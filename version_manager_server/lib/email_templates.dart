const notificationTemplate = '''
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="format-detection" content="telephone=no, date=no, address=no, email=no">
    <meta name="x-apple-disable-message-reformatting">
    <title>{{TITLE}}</title>
</head>
<body style="margin: 0; padding: 0; background-color: #f4f4f4; font-family: Arial, Helvetica, sans-serif;">
    <table width="100%" cellpadding="0" cellspacing="0" border="0" style="background-color: #f4f4f4; padding: 20px 0;">
        <tr>
            <td align="center">
                <!-- Main Container -->
                <table width="600" cellpadding="0" cellspacing="0" border="0" style="background-color: #ffffff; border-radius: 8px; overflow: hidden; box-shadow: 0 2px 8px rgba(0,0,0,0.1); max-width: 600px; width: 100%;">
                    
                    <!-- Header with Icon -->
                    <tr>
                        <td style="background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%); padding: 40px 30px; text-align: center;">
                            <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                    <td align="center">
                                        <div style="background-color: rgba(255,255,255,0.2); border-radius: 50%; width: 80px; height: 80px; display: inline-flex; align-items: center; justify-content: center; margin-bottom: 20px;">
                                            <span style="font-size: 40px;">{{ICON}}</span>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                            <h1 style="margin: 0; color: #ffffff; font-size: 28px; font-weight: 600;">
                                {{TITLE}}
                            </h1>
                        </td>
                    </tr>
                    
                    <!-- Body -->
                    <tr>
                        <td style="padding: 40px 30px;">
                            <p style="margin: 0 0 20px; font-size: 16px; line-height: 24px; color: #333333;">
                                Здравствуйте{{#USERNAME}}, {{USERNAME}}{{/USERNAME}}!
                            </p>
                            
                            <!-- Message Content -->
                            <div style="margin: 0 0 30px; font-size: 16px; line-height: 26px; color: #333333;">
                                {{MESSAGE}}
                            </div>
                            
                            <!-- Call to Action Button (Optional) -->
                            {{#CTA_URL}}
                            <table width="100%" cellpadding="0" cellspacing="0" border="0" style="margin: 30px 0;">
                                <tr>
                                    <td align="center">
                                        <a href="{{CTA_URL}}" style="display: inline-block; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: #ffffff; text-decoration: none; padding: 16px 40px; border-radius: 50px; font-size: 16px; font-weight: 600; min-width: 200px; text-align: center;">
                                            {{CTA_TEXT}}
                                        </a>
                                    </td>
                                </tr>
                            </table>
                            {{/CTA_URL}}
                            
                            <!-- Additional Info Box (Optional) -->
                            {{#INFO_MESSAGE}}
                            <table width="100%" cellpadding="0" cellspacing="0" border="0" style="margin-top: 30px;">
                                <tr>
                                    <td style="background-color: #e7f3ff; border-left: 4px solid #2196F3; padding: 15px; border-radius: 4px;">
                                        <p style="margin: 0; font-size: 14px; line-height: 20px; color: #004085;">
                                            ℹ️ {{INFO_MESSAGE}}
                                        </p>
                                    </td>
                                </tr>
                            </table>
                            {{/INFO_MESSAGE}}
                            
                            <!-- Timestamp (Optional) -->
                            {{#TIMESTAMP}}
                            <p style="margin: 30px 0 0; font-size: 14px; color: #6c757d; line-height: 20px;">
                                📅 {{TIMESTAMP}}
                            </p>
                            {{/TIMESTAMP}}
                        </td>
                    </tr>
                    
                    <!-- Footer -->
                    <tr>
                        <td style="background-color: #f8f9fa; padding: 30px; text-align: center; border-top: 1px solid #e9ecef;">
                            <p style="margin: 0 0 15px; font-size: 14px; color: #6c757d; line-height: 20px;">
                                С уважением,<br>Команда {{APP_NAME}}
                            </p>
                            
                            <!-- Support Link -->
                            {{#SUPPORT_URL}}
                            <p style="margin: 15px 0; font-size: 14px; line-height: 20px;">
                                <a href="{{SUPPORT_URL}}" style="color: #667eea; text-decoration: none;">
                                    Нужна помощь? Свяжитесь с поддержкой
                                </a>
                            </p>
                            {{/SUPPORT_URL}}
                            
                            <p style="margin: 15px 0 0; font-size: 12px; color: #adb5bd; line-height: 18px;">
                                Это автоматическое письмо. Пожалуйста, не отвечайте на него.
                            </p>
                            
                            <!-- Unsubscribe Link (Optional) -->
                            {{#UNSUBSCRIBE_URL}}
                            <p style="margin: 10px 0 0; font-size: 12px; line-height: 18px;">
                                <a href="{{UNSUBSCRIBE_URL}}" style="color: #adb5bd; text-decoration: underline;">
                                    Отписаться от уведомлений
                                </a>
                            </p>
                            {{/UNSUBSCRIBE_URL}}
                        </td>
                    </tr>
                    
                </table>
            </td>
        </tr>
    </table>
</body>
</html>
''';

const verificationCodeTemplate = '''
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Подтверждение Email</title>
</head>
<body style="margin: 0; padding: 0; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;">
    
    <!-- Главный контейнер -->
    <table width="100%" cellpadding="0" cellspacing="0" border="0" style="min-height: 100vh; padding: 40px 20px;">
        <tr>
            <td align="center">
                
                <!-- Карточка письма -->
                <table width="600" cellpadding="0" cellspacing="0" border="0" style="background-color: #ffffff; border-radius: 24px; overflow: hidden; box-shadow: 0 20px 60px rgba(0,0,0,0.3); max-width: 600px; width: 100%;">
                    
                    <!-- Шапка с иконкой -->
                    <tr>
                        <td style="padding: 50px 40px 30px; text-align: center;">
                            <!-- Анимированная иконка безопасности -->
                            <div style="display: inline-block; width: 100px; height: 100px; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); border-radius: 50%; position: relative; margin-bottom: 25px; box-shadow: 0 10px 30px rgba(102, 126, 234, 0.4);">
                                <table width="100%" height="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td align="center" valign="middle">
                                            <span style="font-size: 48px;">🔐</span>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            
                            <h1 style="margin: 0 0 10px; font-size: 32px; font-weight: 700; color: #1a1a1a; line-height: 1.2;">
                                Подтвердите ваш Email
                            </h1>
                            <p style="margin: 0; font-size: 16px; color: #6b7280; line-height: 1.5;">
                                Мы отправили этот код для защиты вашего аккаунта
                            </p>
                        </td>
                    </tr>
                    
                    <!-- Код верификации -->
                    <tr>
                        <td style="padding: 0 40px 40px;">
                            
                            <!-- Блок с кодом -->
                            <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                    <td style="background: linear-gradient(135deg, #f8f9ff 0%, #f0f4ff 100%); border: 2px solid #e0e7ff; border-radius: 16px; padding: 35px; text-align: center;">
                                        <p style="margin: 0 0 15px; font-size: 14px; font-weight: 600; color: #667eea; text-transform: uppercase; letter-spacing: 1px;">
                                            Ваш код подтверждения
                                        </p>
                                        
                                        <!-- Сам код (крупно, с разделением) -->
                                        <div style="font-size: 48px; font-weight: 800; color: #667eea; letter-spacing: 16px; font-family: 'Courier New', monospace; margin: 10px 0; user-select: all; -webkit-user-select: all; -moz-user-select: all; -ms-user-select: all;">
                                            {{CODE}}
                                        </div>
                                        
                                        <!-- Таймер -->
                                        <div style="margin-top: 20px; padding-top: 20px; border-top: 1px solid #e0e7ff;">
                                            <table width="100%" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td align="center">
                                                        <span style="display: inline-flex; align-items: center; background-color: #fef3c7; color: #92400e; padding: 8px 16px; border-radius: 20px; font-size: 13px; font-weight: 600;">
                                                            ⏱️ Действителен 10 минут
                                                        </span>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                            
                        </td>
                    </tr>
                    
                    <!-- Инструкции -->
                    <tr>
                        <td style="padding: 0 40px 30px;">
                            <div style="background-color: #f9fafb; border-radius: 12px; padding: 20px;">
                                <p style="margin: 0 0 12px; font-size: 15px; font-weight: 600; color: #374151;">
                                    📋 Как использовать код:
                                </p>
                                <ol style="margin: 0; padding-left: 20px; font-size: 14px; color: #6b7280; line-height: 1.8;">
                                    <li>Вернитесь в приложение {{APP_NAME}}</li>
                                    <li>Введите код в поле подтверждения</li>
                                    <li>Нажмите «Подтвердить»</li>
                                </ol>
                            </div>
                        </td>
                    </tr>
                    
                    <!-- Предупреждение безопасности -->
                    <tr>
                        <td style="padding: 0 40px 40px;">
                            <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                    <td style="background-color: #fef2f2; border-left: 4px solid #ef4444; border-radius: 8px; padding: 16px;">
                                        <p style="margin: 0; font-size: 13px; color: #991b1b; line-height: 1.6;">
                                            <strong>🛡️ Безопасность:</strong> Никогда не делитесь этим кодом с другими людьми. Наши сотрудники никогда не попросят у вас этот код.
                                        </p>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    
                    <!-- Подвал -->
                    <tr>
                        <td style="background: linear-gradient(135deg, #f9fafb 0%, #f3f4f6 100%); padding: 30px 40px; text-align: center; border-top: 1px solid #e5e7eb;">
                            <p style="margin: 0 0 8px; font-size: 15px; color: #374151; font-weight: 500;">
                                С уважением,<br>
                                <span style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-clip: text; font-weight: 700;">
                                    Команда {{APP_NAME}}
                                </span>
                            </p>
                            
                            <p style="margin: 20px 0 0; font-size: 12px; color: #9ca3af; line-height: 1.5;">
                                Если вы не запрашивали этот код, проигнорируйте это письмо.<br>
                                Ваш аккаунт находится в безопасности.
                            </p>
                        </td>
                    </tr>
                    
                </table>
                
                <!-- Копирайт под карточкой -->
                <table width="600" cellpadding="0" cellspacing="0" border="0" style="margin-top: 20px; max-width: 600px; width: 100%;">
                    <tr>
                        <td style="text-align: center; padding: 20px;">
                            <p style="margin: 0; font-size: 12px; color: rgba(255,255,255,0.8);">
                                © 2026 {{APP_NAME}}. Все права защищены.
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

const passwordResetTemplate = '''
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="format-detection" content="telephone=no, date=no, address=no, email=no">
    <meta name="x-apple-disable-message-reformatting">
    <title>Восстановление пароля</title>
</head>
<body style="margin: 0; padding: 0; background-color: #f4f4f4; font-family: Arial, Helvetica, sans-serif;">
    <table width="100%" cellpadding="0" cellspacing="0" border="0" style="background-color: #f4f4f4; padding: 20px 0;">
        <tr>
            <td align="center">
                <!-- Main Container -->
                <table width="600" cellpadding="0" cellspacing="0" border="0" style="background-color: #ffffff; border-radius: 8px; overflow: hidden; box-shadow: 0 2px 8px rgba(0,0,0,0.1); max-width: 600px; width: 100%;">
                    
                    <!-- Header -->
                    <tr>
                        <td style="background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%); padding: 40px 30px; text-align: center;">
                            <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                    <td align="center">
                                        <div style="background-color: rgba(255,255,255,0.2); border-radius: 50%; width: 80px; height: 80px; display: inline-flex; align-items: center; justify-content: center; margin-bottom: 20px;">
                                            <span style="font-size: 40px;">🔐</span>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                            <h1 style="margin: 0; color: #ffffff; font-size: 28px; font-weight: 600;">
                                Сброс пароля
                            </h1>
                        </td>
                    </tr>
                    
                    <!-- Body -->
                    <tr>
                        <td style="padding: 40px 30px;">
                            <p style="margin: 0 0 20px; font-size: 16px; line-height: 24px; color: #333333;">
                                Здравствуйте{{#USERNAME}}, {{USERNAME}}{{/USERNAME}}!
                            </p>
                            <p style="margin: 0 0 30px; font-size: 16px; line-height: 24px; color: #333333;">
                                Мы получили запрос на восстановление пароля для вашей учетной записи. Используйте код ниже для сброса пароля:
                            </p>
                            
                            <!-- Reset Code Box -->
                            <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                    <td align="center" style="padding: 20px 0;">
                                        <div style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); border-radius: 8px; padding: 25px; display: inline-block;">
                                            <span style="font-size: 36px; font-weight: bold; color: #ffffff; letter-spacing: 8px; font-family: 'Courier New', monospace;">
                                                {{RESET_CODE}}
                                            </span>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                            
                            <p style="margin: 30px 0 20px; font-size: 16px; line-height: 24px; color: #333333;">
                                Код действителен <strong>30 минут</strong> с момента получения письма.
                            </p>
                            
                            <!-- Security Notice -->
                            <table width="100%" cellpadding="0" cellspacing="0" border="0" style="margin-top: 30px;">
                                <tr>
                                    <td style="background-color: #f8d7da; border-left: 4px solid #dc3545; padding: 15px; border-radius: 4px;">
                                        <p style="margin: 0 0 10px; font-size: 14px; line-height: 20px; color: #721c24; font-weight: 600;">
                                            🚨 Важная информация о безопасности
                                        </p>
                                        <p style="margin: 0; font-size: 14px; line-height: 20px; color: #721c24;">
                                            Если вы не запрашивали восстановление пароля, немедленно свяжитесь с нашей службой поддержки. Возможно, кто-то пытается получить доступ к вашему аккаунту.
                                        </p>
                                    </td>
                                </tr>
                            </table>
                            
                            <!-- Tips -->
                            <table width="100%" cellpadding="0" cellspacing="0" border="0" style="margin-top: 30px;">
                                <tr>
                                    <td style="background-color: #e7f3ff; border-left: 4px solid #0062cc; padding: 15px; border-radius: 4px;">
                                        <p style="margin: 0 0 10px; font-size: 14px; line-height: 20px; color: #004085; font-weight: 600;">
                                            💡 Рекомендации по безопасности:
                                        </p>
                                        <ul style="margin: 0; padding-left: 20px; font-size: 14px; line-height: 20px; color: #004085;">
                                            <li>Используйте уникальный пароль длиной не менее 8 символов</li>
                                            <li>Комбинируйте буквы, цифры и специальные символы</li>
                                            <li>Не используйте один пароль для разных сервисов</li>
                                        </ul>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    
                    <!-- Footer -->
                    <tr>
                        <td style="background-color: #f8f9fa; padding: 30px; text-align: center; border-top: 1px solid #e9ecef;">
                            <p style="margin: 0 0 10px; font-size: 14px; color: #6c757d; line-height: 20px;">
                                С уважением,<br>Команда {{APP_NAME}}
                            </p>
                            <p style="margin: 10px 0 0; font-size: 12px; color: #adb5bd; line-height: 18px;">
                                Это автоматическое письмо. Пожалуйста, не отвечайте на него.
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