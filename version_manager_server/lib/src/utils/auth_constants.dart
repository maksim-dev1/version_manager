// myproject_server/lib/src/utils/auth_constants.dart

class AuthConstants {
  // Время жизни кода подтверждения
  static const verificationCodeLifetime = Duration(minutes: 10);
  
  // Максимальное количество попыток ввода кода
  static const maxCodeAttempts = 5;
  
  // Минимальный интервал между отправками кода
  static const resendCodeCooldown = Duration(minutes: 1);
  
  // Длина кода подтверждения
  static const verificationCodeLength = 6;
  
  // Минимальная длина пароля
  static const minPasswordLength = 8;
  
  // Время жизни сессии
  static const sessionLifetime = Duration(days: 30);
  
  // Тексты ошибок
  static const errorInvalidEmail = 'Неверный формат email';
  static const errorEmailExists = 'Email уже зарегистрирован';
  static const errorEmailNotFound = 'Email не найден';
  static const errorInvalidCode = 'Неверный код подтверждения';
  static const errorCodeExpired = 'Код подтверждения истек';
  static const errorMaxAttempts = 'Превышено количество попыток ввода кода';
  static const errorResendTooSoon = 'Подождите перед повторной отправкой кода';
  static const errorWeakPassword = 'Пароль должен содержать минимум 8 символов, включая буквы и цифры';
}
