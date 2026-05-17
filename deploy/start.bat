@echo off
title Doubao Free API Server
echo ========================================
echo   Doubao Free API Server
echo ========================================
echo.

:: 检查 node 是否可用
where node >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] Node.js not found! Please install Node.js 18+ first.
    pause
    exit /b 1
)

:: 安装依赖（首次运行）
if not exist node_modules (
    echo [INFO] Installing dependencies...
    npm install --omit=dev
    echo.
)

:: 端口配置：可通过参数传入，如 start.bat 9000
set PORT=%1
if "%PORT%"=="" set PORT=8000

echo [INFO] Starting server on port %PORT%...
echo [INFO] Press Ctrl+C to stop.
echo.

node --enable-source-maps dist/index.js --port %PORT%
pause
