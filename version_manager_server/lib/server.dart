import 'dart:io';

import 'package:mailer/mailer.dart' as mailer;
import 'package:mailer/smtp_server.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import 'package:serverpod_auth_idp_server/providers/email.dart';

import 'src/generated/endpoints.dart';
import 'src/generated/protocol.dart';
import 'src/web/routes/app_config_route.dart';
import 'src/web/routes/root.dart';

/// The starting point of the Serverpod server.
void run(List<String> args) async {
  // Initialize Serverpod and connect it with your generated code.
  final pod = Serverpod(args, Protocol(), Endpoints());

  // Получаем Яндекс SMTP настройки из passwords.yaml
  final smtpHost = pod.getPassword('smtpHost') ?? 'smtp.yandex.ru';
  final smtpPort = int.parse(pod.getPassword('smtpPort') ?? '465');
  final smtpEmail = pod.getPassword('smtpEmail') ?? 'Почта не указана';
  final smtpPassword = pod.getPassword('smtpPassword') ?? 'Пароль не указан';

  // Настраиваем SMTP сервер Яндекса
  final smtpServer = SmtpServer(
    smtpHost,
    port: smtpPort,
    username: smtpEmail, // Яндекс требует полный email как username
    password: smtpPassword,
    ssl: true, // Порт 465 использует SSL
    ignoreBadCertificate: false,
  );

  // final gmailEmail = pod.getPassword('gmailEmail')!;
  // final gmailPass = pod.getPassword('gmailAppPassword')!;

  // final gmailSmtpServer = gmail(gmailEmail, gmailPass);

  pod.initializeAuthServices(
    tokenManagerBuilders: [JwtConfigFromPasswords()],
    identityProviderBuilders: [
      EmailIdpConfig(
        secretHashPepper: pod.getPassword('emailSecretHashPepper')!,

        // Письмо с кодом регистрации
        sendRegistrationVerificationCode:
            (
              session, {
              required accountRequestId,
              required email,
              required transaction,
              required verificationCode,
            }) async {
              final message = mailer.Message()
                ..from = mailer.Address(smtpEmail, 'Version Manager')
                ..recipients.add(email)
                ..subject = '🔐 Подтверждение регистрации в Version Manager'
                ..html =
                    '''
            <!DOCTYPE html>
            <html>
            <head>
              <meta charset="UTF-8">
              <meta name="viewport" content="width=device-width, initial-scale=1.0">
            </head>
            <body style="margin: 0; padding: 0; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif; background-color: #f5f5f5;">
              <table width="100%" cellpadding="0" cellspacing="0" style="background-color: #f5f5f5; padding: 20px;">
                <tr>
                  <td align="center">
                    <table width="600" cellpadding="0" cellspacing="0" style="background-color: #ffffff; border-radius: 12px; box-shadow: 0 2px 8px rgba(0,0,0,0.1); overflow: hidden;">
                      
                      <!-- Заголовок -->
                      <tr>
                        <td style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); padding: 40px 30px; text-align: center;">
                          <h1 style="margin: 0; color: #ffffff; font-size: 28px; font-weight: 600;">
                            Version Manager
                          </h1>
                          <p style="margin: 10px 0 0 0; color: #e0e7ff; font-size: 16px;">
                            Добро пожаловать!
                          </p>
                        </td>
                      </tr>
                      
                      <!-- Основной контент -->
                      <tr>
                        <td style="padding: 40px 30px;">
                          <h2 style="margin: 0 0 20px 0; color: #1f2937; font-size: 24px; font-weight: 600;">
                            Подтверждение регистрации
                          </h2>
                          
                          <p style="margin: 0 0 24px 0; color: #4b5563; font-size: 16px; line-height: 1.6;">
                            Спасибо за регистрацию в Version Manager! Чтобы завершить создание аккаунта, введите код подтверждения в приложении:
                          </p>
                          
                          <!-- Код подтверждения -->
                          <table width="100%" cellpadding="0" cellspacing="0">
                            <tr>
                              <td align="center" style="padding: 24px 0;">
                                <div style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); border-radius: 12px; padding: 24px; display: inline-block;">
                                  <p style="margin: 0 0 8px 0; color: #e0e7ff; font-size: 14px; font-weight: 500; text-transform: uppercase; letter-spacing: 1px;">
                                    Ваш код
                                  </p>
                                  <p style="margin: 0; color: #ffffff; font-size: 36px; font-weight: 700; letter-spacing: 8px; font-family: 'Courier New', monospace;">
                                    $verificationCode
                                  </p>
                                </div>
                              </td>
                            </tr>
                          </table>
                          
                          <!-- Важная информация -->
                          <div style="background-color: #fef3c7; border-left: 4px solid #f59e0b; border-radius: 6px; padding: 16px; margin: 24px 0;">
                            <p style="margin: 0; color: #92400e; font-size: 14px; line-height: 1.5;">
                              ⏱️ <strong>Код действителен 15 минут</strong><br>
                              🔒 Никому не сообщайте этот код
                            </p>
                          </div>
                          
                          <p style="margin: 24px 0 0 0; color: #6b7280; font-size: 14px; line-height: 1.6;">
                            Если вы не регистрировались в Version Manager, просто проигнорируйте это письмо.
                          </p>
                        </td>
                      </tr>
                      
                      <!-- Футер -->
                      <tr>
                        <td style="background-color: #f9fafb; padding: 24px 30px; border-top: 1px solid #e5e7eb;">
                          <p style="margin: 0; color: #9ca3af; font-size: 12px; line-height: 1.5; text-align: center;">
                            © ${DateTime.now().year} Version Manager. Все права защищены.<br>
                            Это автоматическое письмо, отвечать на него не нужно.
                          </p>
                        </td>
                      </tr>
                      
                    </table>
                  </td>
                </tr>
              </table>
            </body>
            </html>
          ''';

              try {
                await mailer.send(message, smtpServer);
              } catch (e) {
                session.log(
                  '[EmailIDP] ❌ Ошибка отправки: $e',
                  level: LogLevel.error,
                );
                rethrow;
              }
            },

        // Письмо со сбросом пароля
        sendPasswordResetVerificationCode:
            (
              session, {
              required email,
              required passwordResetRequestId,
              required transaction,
              required verificationCode,
            }) async {
              final message = mailer.Message()
                ..from = mailer.Address(smtpEmail, 'Version Manager')
                ..recipients.add(email)
                ..subject = '🔑 Восстановление пароля Version Manager'
                ..html =
                    '''
            <!DOCTYPE html>
            <html>
            <head>
              <meta charset="UTF-8">
              <meta name="viewport" content="width=device-width, initial-scale=1.0">
            </head>
            <body style="margin: 0; padding: 0; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif; background-color: #f5f5f5;">
              <table width="100%" cellpadding="0" cellspacing="0" style="background-color: #f5f5f5; padding: 20px;">
                <tr>
                  <td align="center">
                    <table width="600" cellpadding="0" cellspacing="0" style="background-color: #ffffff; border-radius: 12px; box-shadow: 0 2px 8px rgba(0,0,0,0.1); overflow: hidden;">
                      
                      <!-- Заголовок -->
                      <tr>
                        <td style="background: linear-gradient(135deg, #ef4444 0%, #dc2626 100%); padding: 40px 30px; text-align: center;">
                          <h1 style="margin: 0; color: #ffffff; font-size: 28px; font-weight: 600;">
                            Version Manager
                          </h1>
                          <p style="margin: 10px 0 0 0; color: #fee2e2; font-size: 16px;">
                            Восстановление доступа
                          </p>
                        </td>
                      </tr>
                      
                      <!-- Основной контент -->
                      <tr>
                        <td style="padding: 40px 30px;">
                          <h2 style="margin: 0 0 20px 0; color: #1f2937; font-size: 24px; font-weight: 600;">
                            Сброс пароля
                          </h2>
                          
                          <p style="margin: 0 0 24px 0; color: #4b5563; font-size: 16px; line-height: 1.6;">
                            Вы запросили восстановление пароля для вашего аккаунта. Используйте код ниже для продолжения:
                          </p>
                          
                          <!-- Код подтверждения -->
                          <table width="100%" cellpadding="0" cellspacing="0">
                            <tr>
                              <td align="center" style="padding: 24px 0;">
                                <div style="background: linear-gradient(135deg, #ef4444 0%, #dc2626 100%); border-radius: 12px; padding: 24px; display: inline-block;">
                                  <p style="margin: 0 0 8px 0; color: #fee2e2; font-size: 14px; font-weight: 500; text-transform: uppercase; letter-spacing: 1px;">
                                    Код восстановления
                                  </p>
                                  <p style="margin: 0; color: #ffffff; font-size: 36px; font-weight: 700; letter-spacing: 8px; font-family: 'Courier New', monospace;">
                                    $verificationCode
                                  </p>
                                </div>
                              </td>
                            </tr>
                          </table>
                          
                          <!-- Предупреждение безопасности -->
                          <div style="background-color: #fef2f2; border-left: 4px solid #ef4444; border-radius: 6px; padding: 16px; margin: 24px 0;">
                            <p style="margin: 0 0 12px 0; color: #991b1b; font-size: 14px; font-weight: 600;">
                              ⚠️ Важная информация о безопасности
                            </p>
                            <p style="margin: 0; color: #991b1b; font-size: 14px; line-height: 1.5;">
                              • Код действителен только <strong>15 минут</strong><br>
                              • Никому не сообщайте этот код<br>
                              • Если вы не запрашивали сброс пароля, немедленно свяжитесь с поддержкой
                            </p>
                          </div>
                          
                          <div style="background-color: #f0fdf4; border: 1px solid #86efac; border-radius: 6px; padding: 16px; margin: 24px 0;">
                            <p style="margin: 0; color: #166534; font-size: 13px; line-height: 1.5;">
                              💡 <strong>Совет:</strong> Используйте надежный пароль длиной не менее 8 символов, содержащий буквы, цифры и специальные символы.
                            </p>
                          </div>
                          
                          <p style="margin: 24px 0 0 0; color: #6b7280; font-size: 14px; line-height: 1.6;">
                            Если это были не вы, просто проигнорируйте это письмо — ваш пароль останется прежним.
                          </p>
                        </td>
                      </tr>
                      
                      <!-- Футер -->
                      <tr>
                        <td style="background-color: #f9fafb; padding: 24px 30px; border-top: 1px solid #e5e7eb;">
                          <p style="margin: 0; color: #9ca3af; font-size: 12px; line-height: 1.5; text-align: center;">
                            © ${DateTime.now().year} Version Manager. Все права защищены.<br>
                            Это автоматическое письмо, отвечать на него не нужно.
                          </p>
                        </td>
                      </tr>
                      
                    </table>
                  </td>
                </tr>
              </table>
            </body>
            </html>
          ''';

              try {
                await mailer.send(message, smtpServer);
              } catch (e) {
                session.log(
                  '[EmailIDP] ❌ Ошибка отправки: $e',
                  level: LogLevel.error,
                );
                rethrow;
              }
            },
      ),
    ],
  );

  // Setup a default page at the web root.
  // These are used by the default page.
  pod.webServer.addRoute(RootRoute(), '/');
  pod.webServer.addRoute(RootRoute(), '/index.html');

  // Serve all files in the web/static relative directory under /.
  // These are used by the default web page.
  final root = Directory(Uri(path: 'web/static').toFilePath());
  pod.webServer.addRoute(StaticRoute.directory(root));

  // Setup the app config route.
  // We build this configuration based on the servers api url and serve it to
  // the flutter app.
  pod.webServer.addRoute(
    AppConfigRoute(apiConfig: pod.config.apiServer),
    '/app/assets/assets/config.json',
  );

  // Checks if the flutter web app has been built and serves it if it has.
  final appDir = Directory(Uri(path: 'web/app').toFilePath());
  if (appDir.existsSync()) {
    // Serve the flutter web app under the /app path.
    pod.webServer.addRoute(
      FlutterRoute(
        Directory(
          Uri(path: 'web/app').toFilePath(),
        ),
      ),
      '/app',
    );
  } else {
    // If the flutter web app has not been built, serve the build app page.
    pod.webServer.addRoute(
      StaticRoute.file(
        File(
          Uri(path: 'web/pages/build_flutter_app.html').toFilePath(),
        ),
      ),
      '/app/**',
    );
  }

  // Start the server.
  await pod.start();
}
