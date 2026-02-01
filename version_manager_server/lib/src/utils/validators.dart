class Validators {
  /// Проверяет соответствие email стандартному формату
  static bool isValidEmail(String email) {
    return RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    ).hasMatch(email);
  }

  /// Проверяет надежность пароля
  /// Минимум 8 символов, хотя бы одна цифра и буква
  static bool isValidPassword(String password) {
    if (password.length < 8) return false;
    
    final hasDigit = RegExp(r'\d').hasMatch(password);
    final hasLetter = RegExp(r'[a-zA-Z]').hasMatch(password);
    
    return hasDigit && hasLetter;
  }

  /// Проверяет формат ко`да верификации (6 цифр)`
  static bool isValidVerificationCode(String code) {
    return RegExp(r'^\d{6}$').hasMatch(code);
  }
}
