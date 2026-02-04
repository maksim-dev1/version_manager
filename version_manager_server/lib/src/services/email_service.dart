import 'package:mailer/mailer.dart' as mailer;
import 'package:mailer/smtp_server.dart';
import 'package:serverpod/serverpod.dart';
import 'package:version_manager_server/email_templates.dart';
import 'package:version_manager_server/src/generated/protocol.dart';


/// Поддерживаемые провайдеры email-сервисов.
///
/// Каждый провайдер имеет свои SMTP настройки и требования к аутентификации.
enum EmailProvider {
  /// Gmail SMTP сервис.
  ///
  /// **Требования:**
  /// - Включить 2FA в аккаунте Google
  /// - Создать App Password для приложения
  /// - Настроить пароли в Serverpod: `gmailSmtpEmail` и `gmailSmtpAppPassword`
  ///
  /// **SMTP параметры:**
  /// - Хост: smtp.gmail.com
  /// - Порт: 465 (SSL) или 587 (TLS)
  google,


  /// Яндекс.Почта SMTP сервис.
  ///
  /// **Требования:**
  /// - Включить IMAP/SMTP в настройках почты
  /// - Использовать пароль приложения (если включена 2FA)
  /// - Настроить пароли в Serverpod: `yandexSmtpEmail` и `yandexSmtpAppPassword`
  ///
  /// **SMTP параметры:**
  /// - Хост: smtp.yandex.com
  /// - Порт: 465 (SSL)
  yandex,
}


/// Сервис для отправки email-уведомлений с поддержкой HTML-шаблонов.
///
/// Предоставляет единый интерфейс для работы с различными SMTP-провайдерами
/// и автоматическую обработку HTML-шаблонов с переменными и условными блоками.
///
/// ## Поддерживаемые провайдеры
/// - **Gmail** — Google SMTP с поддержкой App Passwords
/// - **Яндекс.Почта** — Яндекс SMTP с SSL
///
/// ## Система шаблонов
/// Сервис поддерживает HTML-шаблоны с:
/// - **Переменными**: `{{VARIABLE_NAME}}` — заменяются на значения
/// - **Условными блоками**: `{{#variable}}content{{/variable}}` — отображаются только при наличии переменной
///
/// ## Встроенные шаблоны
/// - `verification` — для кодов подтверждения email
/// - `passwordReset` — для кодов восстановления пароля
/// - `notification` — для общих уведомлений
///
/// ### Пример использования
/// ```dart
/// final service = EmailService(provider: EmailProvider.google);
///
/// // Отправка кода верификации
/// await service.sendVerificationEmail(
///   'user@example.com',
///   '123456',
///   appName: 'MyApp',
/// );
/// ```
class EmailService {
  /// SMTP провайдер для отправки email.
  final EmailProvider provider;


  /// Создаёт экземпляр сервиса email-уведомлений.
  ///
  /// ### Параметры
  /// - [provider] — SMTP провайдер ([EmailProvider.google] или [EmailProvider.yandex])
  ///
  /// ### Требования к настройке
  /// Перед использованием необходимо настроить пароли в Serverpod:
  ///
  /// **Для Gmail:**
  /// ```yaml
  /// # config/passwords.yaml
  /// gmailSmtpEmail: 'your-email@gmail.com'
  /// gmailSmtpAppPassword: 'your-app-password'
  /// ```
  ///
  /// **Для Яндекс:**
  /// ```yaml
  /// # config/passwords.yaml
  /// yandexSmtpEmail: 'your-email@yandex.com'
  /// yandexSmtpAppPassword: 'your-password'
  /// ```
  EmailService({
    required this.provider,
  });


  Map<String, String> _getCredentials() {
    switch (provider) {
      case EmailProvider.google:
        final username = Serverpod.instance.getPassword('gmailSmtpEmail');
        final password = Serverpod.instance.getPassword('gmailSmtpAppPassword');


        if (username == null || password == null) {
          throw InvalidDataException(
            message:
                'Email или пароль Gmail не настроены в Serverpod passwords.',
            field: 'Gmail SMTP',
            stackTrace: StackTrace.current.toString(),
          );
        }
        return {'username': username, 'password': password};


      case EmailProvider.yandex:
        final username = Serverpod.instance.getPassword('yandexSmtpEmail');
        final password = Serverpod.instance.getPassword(
          'yandexSmtpAppPassword',
        );


        if (username == null || password == null) {
          throw InvalidDataException(
            message:
                'Email или пароль Яндекс не настроены в Serverpod passwords.',
            field: 'Yandex SMTP',
            stackTrace: StackTrace.current.toString(),
          );
        }
        return {'username': username, 'password': password};
    }
  }


  SmtpServer _getSmtpServer() {
    final credentials = _getCredentials();


    switch (provider) {
      case EmailProvider.google:
        return gmail(credentials['username']!, credentials['password']!);


      case EmailProvider.yandex:
        return SmtpServer(
          'smtp.yandex.com',
          port: 465,
          ssl: true,
          username: credentials['username']!,
          password: credentials['password']!,
        );
    }
  }


  /// Обрабатывает HTML-шаблон и заменяет переменные и условные блоки.
  ///
  /// ### Система шаблонов
  ///
  /// **Переменные:** `{{VARIABLE_NAME}}`
  /// - Заменяются на соответствующие значения из [variables]
  /// - Если переменная не найдена, остаётся как есть
  ///
  /// **Условные блоки:** `{{#variable}}content{{/variable}}`
  /// - Контент отображается только если переменная существует в [variables]
  /// - Внутри блока `{{variable}}` заменяется на значение
  /// - Поддерживается вложенность
  ///
  /// ### Параметры
  /// - [template] — HTML-шаблон из EmailTemplates
  /// - [variables] — map переменных для подстановки
  ///
  /// ### Возвращает
  /// Обработанный HTML-код готовый для отправки.
  String _loadTemplate(String template, Map<String, String> variables) {
    var html = template;


    // Замена переменных
    variables.forEach((key, value) {
      html = html.replaceAll('{{$key}}', value);
    });


    // Обработка условных блоков
    html = html.replaceAllMapped(
      RegExp(r'\{\{#(\w+)\}\}(.*?)\{\{/\1\}\}', dotAll: true),
      (match) {
        final varName = match.group(1)!;
        final content = match.group(2)!;


        if (variables.containsKey(varName)) {
          return content.replaceAll('{{$varName}}', variables[varName]!);
        }
        return '';
      },
    );


    return html;
  }


  Future<bool> _sendEmail({
    required String recipientEmail,
    required String subject,
    required String htmlBody,
    String? textBody,
  }) async {
    try {
      final smtpServer = _getSmtpServer();
      final credentials = _getCredentials();


      final message = mailer.Message()
        ..from = mailer.Address(credentials['username']!)
        ..recipients.add(recipientEmail)
        ..subject = subject
        ..text = textBody
        ..html = htmlBody;


      await mailer.send(message, smtpServer);
      return true;
    } on mailer.MailerException catch (e) {
      throw InvalidDataException(
        message: 'Ошибка при отправке email: ${e.message}',
        field: 'Email Service',
        stackTrace: StackTrace.current.toString(),
      );
    } catch (e, stackTrace) {
      throw InvalidDataException(
        message: 'Неожиданная ошибка при отправке email: $e',
        field: 'Email Service',
        stackTrace: stackTrace.toString(),
      );
    }
  }


  /// Отправляет email с кодом верификации на указанный адрес.
  ///
  /// Использует HTML-шаблон `EmailTemplates.verification` для красивого оформления сообщения.
  /// Код верификации отображается крупным шрифтом для удобства ввода.
  ///
  /// ### Параметры
  /// - [email] — адрес получателя
  /// - [code] — 6-значный код верификации (обычно генерируется [VerificationCodeService])
  /// - [appName] — название приложения для персонализации (по умолчанию: 'YourApp')
  ///
  /// ### Возвращает
  /// `true` если email успешно отправлен, иначе выбрасывает [InvalidDataException].
  ///
  /// ### Шаблон переменных
  /// - `{{CODE}}` — код верификации
  /// - `{{APP_NAME}}` — название приложения
  ///
  /// ### Исключения
  /// - [InvalidDataException] — ошибка отправки
  ///
  /// ### Пример
  /// ```dart
  /// await emailService.sendVerificationEmail(
  ///   'user@example.com',
  ///   '123456',
  ///   appName: 'Version Manager',
  /// );
  /// ```
  Future<bool> sendVerificationEmail(
    String email,
    String code, {
    String appName = 'YourApp',
  }) async {
    final html = _loadTemplate(verificationCodeTemplate, {
      'CODE': code,
      'APP_NAME': appName,
    });


    return await _sendEmail(
      recipientEmail: email,
      subject: 'Подтверждение email',
      htmlBody: html,
      textBody: 'Ваш код подтверждения: $code',
    );
  }


  /// Отправляет email с кодом восстановления пароля.
  ///
  /// Использует HTML-шаблон `EmailTemplates.passwordReset` с персонализированным обращением
  /// и инструкциями по восстановлению пароля.
  ///
  /// ### Параметры
  /// - [email] — адрес получателя
  /// - [code] — код восстановления пароля
  /// - [username] — имя пользователя для персонализации (опционально)
  /// - [appName] — название приложения (по умолчанию: 'YourApp')
  ///
  /// ### Возвращает
  /// `true` если email успешно отправлен.
  ///
  /// ### Шаблон переменных
  /// - `{{RESET_CODE}}` — код восстановления
  /// - `{{APP_NAME}}` — название приложения
  /// - `{{#USERNAME}}{{USERNAME}}{{/USERNAME}}` — условный блок с именем пользователя
  ///
  /// ### Пример
  /// ```dart
  /// await emailService.sendPasswordResetEmail(
  ///   'user@example.com',
  ///   'RESET123',
  ///   username: 'Иван',
  ///   appName: 'MyApp',
  /// );
  /// ```
  Future<bool> sendPasswordResetEmail(
    String email,
    String code, {
    String? username,
    String appName = 'YourApp',
  }) async {
    final variables = {
      'RESET_CODE': code,
      'APP_NAME': appName,
    };


    if (username != null) {
      variables['USERNAME'] = username;
    }


    final html = _loadTemplate(passwordResetTemplate, variables);


    return await _sendEmail(
      recipientEmail: email,
      subject: 'Восстановление пароля',
      htmlBody: html,
      textBody: 'Код восстановления пароля: $code',
    );
  }


  /// Отправляет персонализированное уведомление с поддержкой множества параметров.
  ///
  /// Самый гибкий метод для отправки различных типов уведомлений:
  /// информационных сообщений, приглашений, напоминаний и др.
  /// Использует шаблон `EmailTemplates.notification` с полной поддержкой кастомизации.
  ///
  /// ### Обязательные параметры
  /// - [email] — адрес получателя
  /// - [title] — заголовок уведомления (используется также как subject)
  /// - [message] — основной текст сообщения
  ///
  /// ### Опциональные параметры
  /// - [icon] — emoji-иконка для заголовка (по умолчанию: '📬')
  /// - [appName] — название приложения (по умолчанию: 'YourApp')
  /// - [username] — имя получателя для персонализации
  /// - [ctaUrl] — ссылка для Call-To-Action кнопки
  /// - [ctaText] — текст CTA кнопки (по умолчанию: 'Перейти')
  /// - [infoMessage] — дополнительная информация
  /// - [supportUrl] — ссылка на поддержку
  /// - [unsubscribeUrl] — ссылка отписки от уведомлений
  ///
  /// ### Возвращает
  /// `true` если уведомление успешно отправлено.
  ///
  /// ### Шаблон переменных
  /// - `{{TITLE}}`, `{{MESSAGE}}`, `{{ICON}}`, `{{APP_NAME}}`, `{{TIMESTAMP}}`
  /// - Условные блоки: `{{#USERNAME}}`, `{{#CTA_URL}}`, `{{#INFO_MESSAGE}}`, и др.
  ///
  /// ### Примеры использования
  /// ```dart
  /// // Простое уведомление
  /// await emailService.sendNotification(
  ///   email: 'user@example.com',
  ///   title: 'Добро пожаловать!',
  ///   message: 'Ваш аккаунт успешно создан.',
  /// );
  ///
  /// // Уведомление с CTA
  /// await emailService.sendNotification(
  ///   email: 'user@example.com',
  ///   title: 'Подтвердите действие',
  ///   message: 'Нажмите кнопку для подтверждения.',
  ///   ctaUrl: 'https://app.com/confirm/123',
  ///   ctaText: 'Подтвердить',
  /// );
  /// ```
  Future<bool> sendNotification({
    required String email,
    required String title,
    required String message,
    String icon = '📬',
    String appName = 'YourApp',
    String? username,
    String? ctaUrl,
    String? ctaText,
    String? infoMessage,
    String? supportUrl,
    String? unsubscribeUrl,
  }) async {
    final variables = {
      'TITLE': title,
      'MESSAGE': message,
      'ICON': icon,
      'APP_NAME': appName,
      'TIMESTAMP': DateTime.now().toLocal().toString().substring(0, 16),
    };


    if (username != null) variables['USERNAME'] = username;
    if (ctaUrl != null) {
      variables['CTA_URL'] = ctaUrl;
      variables['CTA_TEXT'] = ctaText ?? 'Перейти';
    }
    if (infoMessage != null) variables['INFO_MESSAGE'] = infoMessage;
    if (supportUrl != null) variables['SUPPORT_URL'] = supportUrl;
    if (unsubscribeUrl != null) variables['UNSUBSCRIBE_URL'] = unsubscribeUrl;


    final html = _loadTemplate(notificationTemplate, variables);


    return await _sendEmail(
      recipientEmail: email,
      subject: title,
      htmlBody: html,
      textBody: message,
    );
  }
}
