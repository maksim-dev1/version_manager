import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';

class ProfileEndpoint extends Endpoint {
  Future<UserProfileModel> getUser(Session session) async {
    final authenticated = session.authenticated;
    if (authenticated == null) {
      throw Exception('Пользователь не авторизован');
    }
    final user = await authenticated.userProfile(session);
    if (user == null) {
      throw Exception('Профиль пользователя не найден');
    }
    return user;
  }
}
