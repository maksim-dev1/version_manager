import 'dart:io';
import 'package:mailer/mailer.dart' as mailer;
import 'package:mailer/smtp_server.dart';
import 'package:serverpod/serverpod.dart';
import 'package:version_manager_server/src/generated/protocol.dart';

enum EmailProvider {
  google,
  yandex,
}

class EmailService {
  final EmailProvider provider;
  final String templatesPath;

  EmailService({
    required this.provider,
    this.templatesPath = 'email_templates',
  });

  Map<String, String> _getCredentials() {
    print('[EmailService] Getting credentials for provider: $provider');
    
    switch (provider) {
      case EmailProvider.google:
        final username = Serverpod.instance.getPassword('gmailSmtpEmail');
        final password = Serverpod.instance.getPassword('gmailSmtpAppPassword');

        print('[EmailService] Gmail credentials check:');
        print('  - Username exists: ${username != null}');
        print('  - Password exists: ${password != null}');
        
        if (username != null) {
          print('  - Username: $username');
        }
        if (password != null) {
          // Показываем только первые и последние 3 символа для безопасности
          final masked = password.length > 6
              ? '${password.substring(0, 3)}...${password.substring(password.length - 3)}'
              : '***';
          print('  - Password (masked): $masked (length: ${password.length})');
        }

        if (username == null || password == null) {
          print('[EmailService] ERROR: Missing Gmail credentials!');
          throw InvalidDataException(
            message: 'Email или пароль Gmail не настроены в Serverpod passwords.',
            field: 'Gmail SMTP',
            stackTrace: StackTrace.current.toString(),
          );
        }
        return {'username': username, 'password': password};

      case EmailProvider.yandex:
        final username = Serverpod.instance.getPassword('yandexSmtpEmail');
        final password = Serverpod.instance.getPassword('yandexSmtpAppPassword');

        print('[EmailService] Yandex credentials check:');
        print('  - Username exists: ${username != null}');
        print('  - Password exists: ${password != null}');
        
        if (username != null) {
          print('  - Username: $username');
        }
        if (password != null) {
          final masked = password.length > 6
              ? '${password.substring(0, 3)}...${password.substring(password.length - 3)}'
              : '***';
          print('  - Password (masked): $masked (length: ${password.length})');
        }

        if (username == null || password == null) {
          print('[EmailService] ERROR: Missing Yandex credentials!');
          throw InvalidDataException(
            message: 'Email или пароль Яндекс не настроены в Serverpod passwords.',
            field: 'Yandex SMTP',
            stackTrace: StackTrace.current.toString(),
          );
        }
        return {'username': username, 'password': password};
    }
  }

  SmtpServer _getSmtpServer() {
    print('[EmailService] Creating SMTP server for provider: $provider');
    final credentials = _getCredentials();

    switch (provider) {
      case EmailProvider.google:
        print('[EmailService] Gmail SMTP configuration:');
        print('  - Host: smtp.gmail.com');
        print('  - Port: 587 (STARTTLS)');
        print('  - Username: ${credentials['username']}');
        
        return gmail(credentials['username']!, credentials['password']!);

      case EmailProvider.yandex:
        print('[EmailService] Yandex SMTP configuration:');
        print('  - Host: smtp.yandex.com');
        print('  - Port: 465');
        print('  - SSL: true');
        print('  - Username: ${credentials['username']}');
        
        return SmtpServer(
          'smtp.yandex.com',
          port: 465,
          ssl: true,
          username: credentials['username']!,
          password: credentials['password']!,
        );
    }
  }

  String _loadTemplate(String templateName, Map<String, String> variables) {
    print('[EmailService] Loading template: $templateName');
    print('[EmailService] Template variables: ${variables.keys.join(', ')}');
    
    try {
      final templateFile = File('$templatesPath/$templateName');
      final absolutePath = templateFile.absolute.path;
      
      print('[EmailService] Template path: $absolutePath');
      print('[EmailService] Template exists: ${templateFile.existsSync()}');

      if (!templateFile.existsSync()) {
        print('[EmailService] ERROR: Template file not found!');
        print('[EmailService] Current directory: ${Directory.current.path}');
        print('[EmailService] Looking in: $templatesPath/');
        
        throw InvalidDataException(
          message: 'HTML-шаблон не найден: $templatesPath/$templateName',
          field: 'Email Template',
          stackTrace: StackTrace.current.toString(),
        );
      }

      var html = templateFile.readAsStringSync();
      print('[EmailService] Template loaded successfully (${html.length} chars)');

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

      print('[EmailService] Template processed successfully');
      return html;
    } catch (e) {
      print('[EmailService] ERROR loading template: $e');
      throw InvalidDataException(
        message: 'Ошибка при загрузке шаблона $templateName: $e',
        field: 'Email Template',
        stackTrace: StackTrace.current.toString(),
      );
    }
  }

  Future<bool> _sendEmail({
    required String recipientEmail,
    required String subject,
    required String htmlBody,
    String? textBody,
  }) async {
    print('[EmailService] ========== SENDING EMAIL ==========');
    print('[EmailService] To: $recipientEmail');
    print('[EmailService] Subject: $subject');
    print('[EmailService] HTML body length: ${htmlBody.length} chars');
    print('[EmailService] Text body: ${textBody != null ? textBody.substring(0, textBody.length > 50 ? 50 : textBody.length) : 'none'}');
    
    try {
      print('[EmailService] Step 1: Getting SMTP server configuration...');
      final smtpServer = _getSmtpServer();
      
      print('[EmailService] Step 2: Getting credentials...');
      final credentials = _getCredentials();

      print('[EmailService] Step 3: Creating email message...');
      final message = mailer.Message()
        ..from = mailer.Address(credentials['username']!)
        ..recipients.add(recipientEmail)
        ..subject = subject
        ..text = textBody
        ..html = htmlBody;

      print('[EmailService] Message created:');
      print('  - From: ${message.from}');
      print('  - To: ${message.recipients}');
      print('  - Subject: ${message.subject}');

      print('[EmailService] Step 4: Connecting to SMTP server and sending...');
      print('[EmailService] This may take up to 60 seconds...');
      
      final startTime = DateTime.now();
      final sendReport = await mailer.send(message, smtpServer);
      final duration = DateTime.now().difference(startTime);
      
      print('[EmailService] ✅ Email sent successfully!');
      print('[EmailService] Duration: ${duration.inMilliseconds}ms');
      print('[EmailService] Send report: $sendReport');
      print('[EmailService] ====================================');
      
      return true;
    } on mailer.MailerException catch (e) {
      print('[EmailService] ❌ MailerException occurred!');
      print('[EmailService] Type: ${e.runtimeType}');
      print('[EmailService] Message: ${e.message}');
      print('[EmailService] Problems:');
      for (var problem in e.problems) {
        print('  - Code: ${problem.code}');
        print('    Message: ${problem.msg}');
      }
      print('[EmailService] ====================================');
      
      throw InvalidDataException(
        message: 'Ошибка при отправке email: ${e.message}',
        field: 'Email Service',
        stackTrace: StackTrace.current.toString(),
      );
    } catch (e, stackTrace) {
      print('[EmailService] ❌ Unexpected error!');
      print('[EmailService] Type: ${e.runtimeType}');
      print('[EmailService] Error: $e');
      print('[EmailService] StackTrace: $stackTrace');
      print('[EmailService] ====================================');
      
      throw InvalidDataException(
        message: 'Неожиданная ошибка при отправке email: $e',
        field: 'Email Service',
        stackTrace: stackTrace.toString(),
      );
    }
  }

  Future<bool> sendVerificationEmail(
    String email,
    String code, {
    String appName = 'YourApp',
  }) async {
    print('[EmailService] === VERIFICATION EMAIL ===');
    print('[EmailService] Email: $email');
    print('[EmailService] Code: $code');
    print('[EmailService] App: $appName');
    
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

  Future<bool> sendPasswordResetEmail(
    String email,
    String code, {
    String? username,
    String appName = 'YourApp',
  }) async {
    print('[EmailService] === PASSWORD RESET EMAIL ===');
    print('[EmailService] Email: $email');
    print('[EmailService] Code: $code');
    
    final variables = {
      'RESET_CODE': code,
      'APP_NAME': appName,
    };

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
    print('[EmailService] === NOTIFICATION EMAIL ===');
    print('[EmailService] Email: $email');
    print('[EmailService] Title: $title');
    
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

    final html = _loadTemplate('notification.html', variables);

    return await _sendEmail(
      recipientEmail: email,
      subject: title,
      htmlBody: html,
      textBody: message,
    );
  }
}
