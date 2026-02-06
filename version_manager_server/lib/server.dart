import 'dart:io';

import 'package:serverpod/serverpod.dart';
import 'package:version_manager_server/src/services/email_service.dart';
import 'package:version_manager_server/src/services/service_locator.dart';

import 'src/generated/endpoints.dart';
import 'src/generated/protocol.dart';
import 'src/web/routes/app_config_route.dart';
import 'src/web/routes/root.dart';

/// The starting point of the Serverpod server.
void run(List<String> args) async {
  // Инициализация сервисов
  Services().initialize(
    emailProvider: EmailProvider.google,
    // emailTemplatesPath: 'email_templates',
  );

  // Initialize Serverpod and connect it with your generated code.
  final pod = Serverpod(
    args,
    Protocol(),
    Endpoints(),
    authenticationHandler: (session, token) async {
      final tokenService = Services().tokenService;
      final tokenHash = tokenService.hashToken(token);

      final authSession = await AuthSession.db.findFirstRow(
        session,
        where: (t) => t.tokenHash.equals(tokenHash) & t.isActive.equals(true),
      );

      if (authSession == null) return null;

      // Проверяем срок действия
      if (authSession.expiresAt.isBefore(DateTime.now())) return null;

      // Обновляем время последней активности
      authSession.lastActivityAt = DateTime.now();
      await AuthSession.db.updateRow(session, authSession);

      return AuthenticationInfo(
        authSession.userId.toString(),
        {},
        authId: authSession.id!.toString(),
      );
    },
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
