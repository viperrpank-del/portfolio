@echo off
chcp 65001 > nul
echo ========================================
echo        ЗАПУСК ЛОКАЛЬНОГО СЕРВЕРА
echo ========================================
echo.
echo Папка: %CD%
echo.
echo 1. Проверяю Python...
where python >nul 2>nul
if %errorlevel% equ 0 (
    echo Python найден!
) else (
    echo Python не найден! Проверяю py...
    where py >nul 2>nul
    if %errorlevel% equ 0 (
        echo Py найден!
        set USEPY=1
    ) else (
        echo ОШИБКА: Python не установлен!
        echo Скачайте с https://python.org
        pause
        exit /b 1
    )
)

echo.
echo 2. Запускаю сервер на порту 8000...
echo.
echo ========================================
echo ОТКРОЙТЕ В БРАУЗЕРЕ: http://localhost:8000
echo ========================================
echo.
echo Нажмите Ctrl+C чтобы остановить
echo.
if defined USEPY (
    py -m http.server 8000
) else (
    python -m http.server 8000
)
pause