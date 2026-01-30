import 'dart:io';
import 'package:mailer/mailer.dart' as mailer;
import 'package:mailer/smtp_server.dart';
import 'package:serverpod/serverpod.dart';
import 'package:version_manager_server/src/generated/exceptions/invalid_data_exception.dart';

/// Перечисление поддерживаемых SMTP-провайдеров для отправки email.
///
/// Каждый провайдер имеет свои настройки подключения и требования
/// к конфигурации в `passwords.yaml`.
enum EmailProvider {
  /// Google Gmail SMTP (smtp.gmail.com, порт 587/465).
  /// Требует App Password при включенной двухфакторной аутентификации.
  google,

  /// Яндекс SMTP (smtp.yandex.com, порт 465).
  /// Требует пароль приложения из настроек безопасности Яндекса.
  yandex,
}

/// Сервис для отправки email через SMTP с поддержкой HTML-шаблонов.
///
/// Этот класс инкапсулирует логику отправки email через различных
/// провайдеров (Gmail, Яндекс) и поддерживает загрузку HTML-шаблонов
/// из файловой системы с заменой переменных.
///
/// Основные возможности:
/// - Отправка верификационных писем для подтверждения email
/// - Отправка писем для восстановления пароля
/// - Отправка произвольных уведомлений пользователям
/// - Загрузка и обработка HTML-шаблонов с переменными
/// - Поддержка условных блоков в шаблонах
///
/// Пример использования:
/// ```dart
/// final emailService = EmailService(
///   provider: EmailProvider.google,
///   templatesPath: 'email_templates',
/// );
///
/// await emailService.sendVerificationEmail(
///   'user@example.com',
///   '123456',
///   appName: 'My App',
/// );
/// ```
///
/// Требования к конфигурации в `passwords.yaml`:
/// - Для Gmail: `gmailSmtpEmail`, `gmailSmtpAppPassword`
/// - Для Яндекс: `yandexSmtpEmail`, `yandexSmtpAppPassword`
class EmailService {
  /// SMTP-провайдер, используемый для отправки писем.
  final EmailProvider provider;

  /// Путь к директории с HTML-шаблонами email.
  ///
  /// По умолчанию 'email_templates'. Путь должен быть относительно
  /// корневой директории серверного проекта.
  final String templatesPath;

  /// Создает экземпляр сервиса отправки email.
  ///
  /// [provider] - SMTP-провайдер (Google или Яндекс).
  /// [templatesPath] - путь к папке с HTML-шаблонами (по умолчанию 'email_templates').
  ///
  /// Пример:
  /// ```dart
  /// final service = EmailService(
  ///   provider: EmailProvider.google,
  ///   templatesPath: 'my_templates',
  /// );
  /// ```
  EmailService({
    required this.provider,
    this.templatesPath = 'email_templates',
  });

  /// Извлекает учетные данные SMTP из конфигурации Serverpod.
  ///
  /// Метод читает email и пароль из `passwords.yaml` в зависимости
  /// от выбранного провайдера.
  ///
  /// Возвращает Map с ключами 'username' и 'password'.
  ///
  /// Throws [InvalidDataException] если учетные данные не найдены
  /// или не настроены в конфигурации Serverpod.
  ///
  /// Требуемые ключи в passwords.yaml:
  /// - Для Google: `gmailSmtpEmail`, `gmailSmtpAppPassword`
  /// - Для Яндекс: `yandexSmtpEmail`, `yandexSmtpAppPassword`
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

  /// Создает и настраивает SMTP-сервер для выбранного провайдера.
  ///
  /// Метод автоматически применяет правильные настройки подключения
  /// (хост, порт, SSL/TLS) в зависимости от провайдера.
  ///
  /// Настройки по умолчанию:
  /// - Gmail: smtp.gmail.com (порт 587 с TLS)
  /// - Яндекс: smtp.yandex.com (порт 465 с SSL)
  ///
  /// Возвращает настроенный объект [SmtpServer] для отправки писем.
  ///
  /// Throws [InvalidDataException] если учетные данные отсутствуют.
  SmtpServer _getSmtpServer() {
    final credentials = _getCredentials();

    switch (provider) {
      case EmailProvider.google:
        // Использует встроенную функцию gmail() из пакета mailer
        // с автоматическими настройками (smtp.gmail.com:587, STARTTLS)
        return gmail(credentials['username']!, credentials['password']!);

      case EmailProvider.yandex:
        // Яндекс требует SSL-соединение на порту 465
        return SmtpServer(
          'smtp.yandex.com',
          port: 465,
          ssl: true,
          username: credentials['username']!,
          password: credentials['password']!,
        );
    }
  }

  /// Загружает HTML-шаблон из файла и заменяет переменные.
  ///
  /// Этот метод поддерживает два типа подстановок:
  /// 1. Простые переменные: `{{VARIABLE_NAME}}`
  /// 2. Условные блоки: `{{#VARIABLE}}content{{/VARIABLE}}`
  ///
  /// Простые переменные всегда заменяются на значение из [variables].
  /// Условные блоки отображаются только если переменная присутствует в [variables].
  ///
  /// [templateName] - имя файла шаблона (например, 'verification.html').
  /// [variables] - Map с переменными для замены в шаблоне.
  ///
  /// Возвращает обработанный HTML-код письма.
  ///
  /// Throws [InvalidDataException] если:
  /// - Файл шаблона не найден
  /// - Ошибка чтения файла
  /// - Ошибка обработки шаблона
  ///
  /// Пример шаблона:
  /// ```html
  /// <h1>Hello, {{USERNAME}}!</h1>
  /// {{#CTA_URL}}
  ///   <a href="{{CTA_URL}}">{{CTA_TEXT}}</a>
  /// {{/CTA_URL}}
  /// ```
  ///
  /// Пример использования:
  /// ```dart
  /// final html = _loadTemplate('notification.html', {
  ///   'USERNAME': 'John',
  ///   'CTA_URL': 'https://example.com',
  ///   'CTA_TEXT': 'Click here',
  /// });
  /// ```
  String _loadTemplate(String templateName, Map<String, String> variables) {
    try {
      final templateFile = File('$templatesPath/$templateName');

      if (!templateFile.existsSync()) {
        throw InvalidDataException(
          message: 'HTML-шаблон не найден: $templatesPath/$templateName',
          field: 'Email Template',
          stackTrace: StackTrace.current.toString(),
        );
      }

      var html = templateFile.readAsStringSync();

      // Замена обычных переменных вида {{VARIABLE}}
      // Все переменные из Map заменяются на соответствующие значения
      variables.forEach((key, value) {
        html = html.replaceAll('{{$key}}', value);
      });

      // Обработка условных блоков вида {{#VAR}}content{{/VAR}}
      // Блок отображается только если переменная VAR присутствует в Map
      // RegExp с флагом dotAll позволяет . совпадать с переносами строк
      html = html.replaceAllMapped(
        RegExp(r'\{\{#(\w+)\}\}(.*?)\{\{/\1\}\}', dotAll: true),
        (match) {
          final varName = match.group(1)!; // Имя переменной
          final content = match.group(2)!; // Содержимое блока

          // Показываем блок только если переменная задана
          if (variables.containsKey(varName)) {
            // Заменяем переменные внутри условного блока
            return content.replaceAll('{{$varName}}', variables[varName]!);
          }
          // Если переменной нет, блок полностью удаляется
          return '';
        },
      );

      return html;
    } catch (e) {
      throw InvalidDataException(
        message: 'Ошибка при загрузке шаблона $templateName: $e',
        field: 'Email Template',
        stackTrace: StackTrace.current.toString(),
      );
    }
  }

  /// Базовый метод для отправки email через SMTP.
  ///
  /// Этот приватный метод инкапсулирует всю логику отправки писем
  /// и используется всеми публичными методами сервиса.
  ///
  /// [recipientEmail] - email адрес получателя.
  /// [subject] - тема письма.
  /// [htmlBody] - HTML-содержимое письма.
  /// [textBody] - текстовая версия письма (опционально, для клиентов без HTML).
  ///
  /// Возвращает `true` при успешной отправке.
  ///
  /// Throws [InvalidDataException] если:
  /// - Не удалось подключиться к SMTP-серверу
  /// - Ошибка аутентификации
  /// - Невалидный email получателя
  /// - Любая другая ошибка при отправке
  ///
  /// Пример текстовой версии нужен для email-клиентов,
  /// которые не поддерживают HTML или у пользователя отключены изображения.
  Future<bool> _sendEmail({
    required String recipientEmail,
    required String subject,
    required String htmlBody,
    String? textBody,
  }) async {
    try {
      final smtpServer = _getSmtpServer();
      final credentials = _getCredentials();

      // Создание объекта письма с использованием cascade notation
      final message = mailer.Message()
        ..from = mailer.Address(credentials['username']!)
        ..recipients.add(recipientEmail)
        ..subject = subject
        ..text = textBody // Plaintext версия (опционально)
        ..html = htmlBody; // HTML версия (основная)

      // Отправка через SMTP сервер
      await mailer.send(message, smtpServer);
      return true;
    } on mailer.MailerException catch (e) {
      // Перехват специфичных ошибок mailer и преобразование в InvalidDataException
      throw InvalidDataException(
        message: 'Ошибка при отправке email: ${e.message}',
        field: 'Email Service',
        stackTrace: StackTrace.current.toString(),
      );
    }
  }

  /// Отправляет письмо с кодом подтверждения для верификации email.
  ///
  /// Использует HTML-шаблон `verification.html` из папки [templatesPath].
  /// Письмо содержит код, который пользователь должен ввести для
  /// подтверждения своего email-адреса при регистрации.
  ///
  /// [email] - email адрес получателя для верификации.
  /// [code] - код подтверждения (обычно 6-значный).
  /// [appName] - название приложения для отображения в письме (по умолчанию 'YourApp').
  ///
  /// Возвращает `true` при успешной отправке.
  ///
  /// Throws [InvalidDataException] при ошибке отправки или загрузки шаблона.
  ///
  /// Переменные шаблона:
  /// - `{{CODE}}` - код подтверждения
  /// - `{{APP_NAME}}` - название приложения
  ///
  /// Пример:
  /// ```dart
  /// await emailService.sendVerificationEmail(
  ///   'user@example.com',
  ///   '123456',
  ///   appName: 'My App',
  /// );
  /// ```
  ///
  /// Обычно этот метод вызывается в `AuthConfig.sendValidationEmail`
  /// для интеграции с Serverpod Auth.
  Future<bool> sendVerificationEmail(
    String email,
    String code, {
    String appName = 'YourApp',
  }) async {
    final html = _loadTemplate('verification.html', {
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

  /// Отправляет письмо с кодом для восстановления пароля.
  ///
  /// Использует HTML-шаблон `password_reset.html` из папки [templatesPath].
  /// Письмо содержит код для сброса пароля и инструкции по безопасности.
  ///
  /// [email] - email адрес пользователя.
  /// [code] - код для сброса пароля (обычно 6-8 символов).
  /// [username] - имя пользователя для персонализации (опционально).
  /// [appName] - название приложения (по умолчанию 'YourApp').
  ///
  /// Возвращает `true` при успешной отправке.
  ///
  /// Throws [InvalidDataException] при ошибке отправки или загрузки шаблона.
  ///
  /// Переменные шаблона:
  /// - `{{RESET_CODE}}` - код восстановления
  /// - `{{APP_NAME}}` - название приложения
  /// - `{{USERNAME}}` - имя пользователя (условный блок)
  ///
  /// Пример:
  /// ```dart
  /// await emailService.sendPasswordResetEmail(
  ///   'user@example.com',
  ///   'RESET123',
  ///   username: 'John Doe',
  ///   appName: 'My App',
  /// );
  /// ```
  ///
  /// Обычно этот метод вызывается в `AuthConfig.sendPasswordResetEmail`
  /// для интеграции с Serverpod Auth.
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

    // Добавляем username только если он передан
    // Это делает блок {{#USERNAME}}...{{/USERNAME}} видимым в шаблоне
    if (username != null) {
      variables['USERNAME'] = username;
    }

    final html = _loadTemplate('password_reset.html', variables);

    return await _sendEmail(
      recipientEmail: email,
      subject: 'Восстановление пароля',
      htmlBody: html,
      textBody: 'Код восстановления пароля: $code',
    );
  }

  /// Отправляет пользовательское уведомление.
  ///
  /// Универсальный метод для отправки любых уведомлений пользователям:
  /// изменение статуса заказа, новое сообщение, напоминания и т.д.
  ///
  /// Использует HTML-шаблон `notification.html` с поддержкой множества
  /// опциональных элементов: кнопок действий, дополнительной информации,
  /// ссылок на поддержку и отписку.
  ///
  /// Обязательные параметры:
  /// - [email] - email адрес получателя
  /// - [title] - заголовок уведомления (также используется как тема письма)
  /// - [message] - текст сообщения (может содержать HTML)
  ///
  /// Опциональные параметры:
  /// - [icon] - эмодзи для заголовка (по умолчанию '📬')
  /// - [appName] - название приложения (по умолчанию 'YourApp')
  /// - [username] - имя получателя для персонализации
  /// - [ctaUrl] - URL для кнопки призыва к действию (Call-To-Action)
  /// - [ctaText] - текст кнопки CTA (по умолчанию 'Перейти')
  /// - [infoMessage] - дополнительная информация в синем блоке
  /// - [supportUrl] - ссылка на службу поддержки
  /// - [unsubscribeUrl] - ссылка для отписки от уведомлений
  ///
  /// Возвращает `true` при успешной отправке.
  ///
  /// Throws [InvalidDataException] при ошибке отправки или загрузки шаблона.
  ///
  /// Переменные шаблона:
  /// - `{{TITLE}}` - заголовок
  /// - `{{MESSAGE}}` - основное сообщение
  /// - `{{ICON}}` - иконка в заголовке
  /// - `{{APP_NAME}}` - название приложения
  /// - `{{TIMESTAMP}}` - время отправки
  /// - `{{USERNAME}}` - имя пользователя (условный блок)
  /// - `{{CTA_URL}}`, `{{CTA_TEXT}}` - кнопка действия (условный блок)
  /// - `{{INFO_MESSAGE}}` - инфоблок (условный блок)
  /// - `{{SUPPORT_URL}}` - ссылка поддержки (условный блок)
  /// - `{{UNSUBSCRIBE_URL}}` - ссылка отписки (условный блок)
  ///
  /// Пример использования:
  /// ```dart
  /// await emailService.sendNotification(
  ///   email: 'user@example.com',
  ///   title: 'Ваш заказ отправлен',
  ///   message: 'Заказ #12345 был отправлен и скоро прибудет.',
  ///   icon: '📦',
  ///   username: 'Иван',
  ///   ctaUrl: 'https://app.com/orders/12345',
  ///   ctaText: 'Отследить заказ',
  ///   supportUrl: 'https://app.com/support',
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
    // Формирование базовых переменных (всегда присутствуют)
    final variables = {
      'TITLE': title,
      'MESSAGE': message,
      'ICON': icon,
      'APP_NAME': appName,
      // Timestamp в локальном времени, обрезанный до минут (YYYY-MM-DD HH:MM)
      'TIMESTAMP': DateTime.now().toLocal().toString().substring(0, 16),
    };

    // Добавление опциональных переменных
    // Только если они не null, иначе условные блоки в шаблоне будут удалены
    if (username != null) variables['USERNAME'] = username;
    if (ctaUrl != null) {
      variables['CTA_URL'] = ctaUrl;
      variables['CTA_TEXT'] = ctaText ?? 'Перейти';
    }
    if (infoMessage != null) variables['INFO_MESSAGE'] = infoMessage;
    if (supportUrl != null) variables['SUPPORT_URL'] = supportUrl;
    if (unsubscribeUrl != null) variables['UNSUBSCRIBE_URL'] = unsubscribeUrl;

    final html = _loadTemplate('notification.html', variables);

    return await _sendEmail(
      recipientEmail: email,
      subject: title,
      htmlBody: html,
      textBody: message,
    );
  }
}
