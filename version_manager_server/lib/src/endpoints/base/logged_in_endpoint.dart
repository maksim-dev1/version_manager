import 'package:serverpod/serverpod.dart';

/// Базовый эндпоинт, требующий аутентификации.
///
/// Все эндпоинты, наследующиеся от этого класса, автоматически
/// требуют валидный токен доступа. Serverpod проверит токен
/// перед вызовом любого метода.
///
/// ### Использование
/// ```dart
/// class UserEndpoint extends LoggedInEndpoint {
///   Future<UserData> getData(Session session) async {
///     // session.authenticated гарантированно не null
///     final userId = (await session.authenticated)!.userId;
///     // ...
///   }
/// }
/// ```
///
/// ### Публичные методы в защищённом эндпоинте
/// Если нужен отдельный публичный метод, пометьте его:
/// ```dart
/// @unauthenticatedClientCall
/// Future<String> publicMethod(Session session) async {
///   return 'доступно всем';
/// }
/// ```
abstract class LoggedInEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;
}
