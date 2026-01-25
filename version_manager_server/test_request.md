# Тестирование checkVersion эндпоинта

## ✅ Актуальный способ вызова (через query параметры)

### Проверка запроса с curl

```bash
curl 'http://localhost:8080/appCheck/checkVersion?packageName=com.example.myapp&currentVersion=1.0.0&currentBuildNumber=1&platform=android'
```

### С использованием POST

```bash
curl -X POST 'http://localhost:8080/appCheck/checkVersion?packageName=com.example.myapp&currentVersion=1.0.0&currentBuildNumber=1&platform=android' \
  -H "Content-Type: application/json"
```

## Формат параметров

Все параметры передаются как **query параметры** в URL:

| Параметр | Тип | Пример | Обязательный |
|----------|-----|--------|--------------|
| packageName | String | com.example.myapp | ✅ |
| currentVersion | String | 1.0.0 | ✅ |
| currentBuildNumber | String | 1 | ✅ |
| platform | String | android, ios, unknown | ✅ |

**ВАЖНО**: Все параметры передаются как строки в query параметрах!

## Пример кода на клиенте (Flutter)

```dart
try {
  final response = await client.appCheck.checkVersion(
    packageName: 'com.example.myapp',
    currentVersion: '1.0.0',
    currentBuildNumber: '1',  // Строка!
    platform: Platform.android,
  );
  
  print('Response received: $response');
  
  if (response.isBlocked) {
    print('Version is blocked: ${response.blockReason}');
  }
  
  if (response.latestVersion != null) {
    print('New version available: ${response.latestVersion}');
  }
} catch (e, stackTrace) {
  print('Error calling checkVersion: $e');
  print('StackTrace: $stackTrace');
}
```

## Пример ответа (успешный)

```json
{
  "__className__": "AppCheckResponse",
  "isBlocked": false,
  "blockReason": null,
  "latestVersion": "2.0.0",
  "latestBuildNumber": 20,
  "forceUpdate": false,
  "storeLinks": [
    {
      "store": "google_play",
      "url": "https://play.google.com/store/apps/details?id=com.example.myapp"
    }
  ],
  "changelog": "Новые функции и улучшения"
}
```

## Пример ответа (версия заблокирована)

```json
{
  "__className__": "AppCheckResponse",
  "isBlocked": true,
  "blockReason": "Критическая уязвимость",
  "forceUpdate": true
}
```

## Отладка через логи

После перезапуска сервера вы должны увидеть:

```
=== checkVersion ENTERED ===
PackageName: com.example.myapp
CurrentVersion: 1.0.0
BuildNumber (raw): 1
Platform: Platform.android
BuildNumber (parsed): 1
```

## Использование скрипта для тестирования

```bash
./test_curl.sh
```

Этот скрипт автоматически выполнит тестовый запрос.
