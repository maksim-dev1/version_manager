import 'package:version_manager_server/src/services/email_service.dart';
import 'package:version_manager_server/src/services/password_service.dart';
import 'package:version_manager_server/src/services/token_service.dart';

/// Простой Service Locator для управления зависимостями без внешних библиотек.
///
/// Реализует паттерн **Service Locator** с синглтон-доступом ко всем сервисам приложения.
/// Обеспечивает централизованную инициализацию и lazy loading сервисов, упрощая
/// управление зависимостями и тестирование.
///
/// ## Принципы работы
/// - **Синглтон** — единственный экземпляр на всё приложение
/// - **Lazy Loading** — сервисы создаются только при первом обращении
/// - **Fail-Fast** — выбрасывает исключение при обращении к неинициализированным сервисам
/// - **Testability** — поддерживает подмену сервисов для тестирования
///
/// ## Управляемые сервисы
/// - [PasswordService] — хеширование и проверка паролей
/// - [TokenService] — генерация и управление токенами
/// - [EmailService] — отправка email-уведомлений
///
/// ## Жизненный цикл
/// 1. **Инициализация** — вызов `Services().initialize()` при старте сервера
/// 2. **Использование** — получение сервисов через геттеры
/// 3. **Тестирование** — подмена через `overrideForTesting()`
///
/// ### Пример инициализации в main.dart
/// ```dart
/// void main() async {
///   // Инициализация сервисов при старте
///   Services().initialize(
///     emailProvider: EmailProvider.gmail,
///     emailTemplatesPath: 'email_templates',
///   );
///
///   // Запуск сервера
///   await Serverpod.run(...);
/// }
/// ```
///
/// ### Пример использования в эндпоинтах
/// ```dart
/// class AuthEndpoint extends Endpoint {
///   final _passwordService = Services().passwordService;
///   final _emailService = Services().emailService;
///
///   Future<String> hashPassword(String password) async {
///     return _passwordService.hashPassword(password);
///   }
/// }
/// ```
class Services {
  /// Синглтон экземпляр для глобального доступа к сервисам.
  static final Services _instance = Services._internal();

  /// Фабричный конструктор, возвращающий единственный экземпляр.
  factory Services() => _instance;

  /// Приватный конструктор для реализации синглтон-паттерна.
  Services._internal();

  /// Сервис хеширования паролей (lazy loading).
  PasswordService? _passwordService;

  /// Сервис управления токенами (lazy loading).
  TokenService? _tokenService;

  /// Сервис отправки email (lazy loading).
  EmailService? _emailService;

  /// Инициализирует все сервисы приложения.
  ///
  /// **Должен быть вызван один раз при запуске сервера** до первого обращения
  /// к любому сервису. Создаёт экземпляры всех сервисов с указанными параметрами.
  ///
  /// ### Параметры
  /// - [emailProvider] — SMTP провайдер для отправки email ([EmailProvider.google] или [EmailProvider.yandex])
  /// - [emailTemplatesPath] — путь к папке с HTML шаблонами (по умолчанию: 'email_templates')
  ///
  /// ### Создаваемые сервисы
  /// - [PasswordService] — без дополнительных параметров
  /// - [TokenService] — без дополнительных параметров
  /// - [EmailService] — с указанным провайдером и путём к шаблонам
  ///
  /// ### Требования к окружению
  /// Перед вызовом необходимо настроить пароли в Serverpod:
  ///
  /// **Для Gmail:**
  /// ```yaml
  /// # config/passwords.yaml
  /// gmailSmtpEmail: 'your-email@gmail.com'
  /// gmailSmtpAppPassword: 'app-password'
  /// ```
  ///
  /// **Для Яндекс:**
  /// ```yaml
  /// # config/passwords.yaml
  /// yandexSmtpEmail: 'your-email@yandex.com'
  /// yandexSmtpAppPassword: 'app-password'
  /// ```
  ///
  /// ### Пример использования
  /// ```dart
  /// // В main.dart перед запуском сервера
  /// Services().initialize(
  ///   emailProvider: EmailProvider.gmail,
  ///   emailTemplatesPath: 'assets/email_templates',
  /// );
  /// ```
  ///
  /// ### Исключения
  /// Если сервисы уже инициализированы, повторный вызов перезаписывает их.
  /// Это может быть полезно для изменения конфигурации в runtime.
  void initialize({
    EmailProvider emailProvider = EmailProvider.yandex,
    String emailTemplatesPath = 'email_templates',
  }) {
    _passwordService = PasswordService();
    _tokenService = TokenService();
    _emailService = EmailService(
      provider: emailProvider,
    );
  }

  /// Возвращает экземпляр сервиса хеширования паролей.
  ///
  /// ### Исключения
  /// - [StateError] — если сервисы не инициализированы через [initialize()]
  ///
  /// ### Пример использования
  /// ```dart
  /// final passwordService = Services().passwordService;
  /// final hash = passwordService.hashPassword('user-password');
  /// ```
  PasswordService get passwordService {
    if (_passwordService == null) {
      throw StateError(
        'Services not initialized. Call Services().initialize() first',
      );
    }
    return _passwordService!;
  }

  /// Возвращает экземпляр сервиса управления токенами.
  ///
  /// ### Исключения
  /// - [StateError] — если сервисы не инициализированы через [initialize()]
  ///
  /// ### Пример использования
  /// ```dart
  /// final tokenService = Services().tokenService;
  /// final tokens = tokenService.generateTokenPair();
  /// ```
  TokenService get tokenService {
    if (_tokenService == null) {
      throw StateError(
        'Services not initialized. Call Services().initialize() first',
      );
    }
    return _tokenService!;
  }

  /// Возвращает экземпляр сервиса отправки email.
  ///
  /// ### Исключения
  /// - [StateError] — если сервисы не инициализированы через [initialize()]
  ///
  /// ### Пример использования
  /// ```dart
  /// final emailService = Services().emailService;
  /// await emailService.sendVerificationEmail('user@example.com', '123456');
  /// ```
  EmailService get emailService {
    if (_emailService == null) {
      throw StateError(
        'Services not initialized. Call Services().initialize() first',
      );
    }
    return _emailService!;
  }

  /// Заменяет сервисы на mock-объекты для тестирования.
  ///
  /// Позволяет подменить любой из сервисов на тестовый аналог без необходимости
  /// полной реинициализации. Полезно для изоляции тестов и мокирования внешних зависимостей.
  ///
  /// ### Параметры
  /// Все параметры опциональные — подменяются только указанные сервисы:
  /// - [passwordService] — mock для [PasswordService]
  /// - [tokenService] — mock для [TokenService]
  /// - [emailService] — mock для [EmailService]
  ///
  /// ### Применение в тестах
  /// ```dart
  /// void main() {
  ///   group('Auth Tests', () {
  ///     setUp(() {
  ///       // Подменяем email сервис на mock
  ///       Services().overrideForTesting(
  ///         emailService: MockEmailService(),
  ///       );
  ///     });
  ///
  ///     test('should send verification email', () async {
  ///       // Тест будет использовать MockEmailService
  ///       final endpoint = AuthEndpoint();
  ///       await endpoint.checkEmailAndSendCode(...);
  ///     });
  ///   });
  /// }
  /// ```
  ///
  /// ### Восстановление после тестов
  /// ```dart
  /// tearDown(() {
  ///   // Восстанавливаем реальные сервисы
  ///   Services().initialize();
  /// });
  /// ```
  void overrideForTesting({
    PasswordService? passwordService,
    TokenService? tokenService,
    EmailService? emailService,
  }) {
    if (passwordService != null) _passwordService = passwordService;
    if (tokenService != null) _tokenService = tokenService;
    if (emailService != null) _emailService = emailService;
  }
}
