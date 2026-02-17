const isProd = bool.fromEnvironment('PROD');
const serverUrl = String.fromEnvironment('SERVER_URL');
const sentryDsn = String.fromEnvironment('SENTRY_DSN');