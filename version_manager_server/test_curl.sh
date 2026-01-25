#!/bin/bash

# Правильный формат запроса для Serverpod с именованными параметрами

echo "Тестирование checkVersion эндпоинта"
echo "===================================="
echo ""

# Теперь параметры передаются как query параметры
curl -v -X POST 'http://localhost:8080/appCheck/checkVersion?packageName=com.example.testVersionManagerApp&currentVersion=1.0.0&currentBuildNumber=1&platform=android' \
  -H "Content-Type: application/json"

echo -e "\n\n"
