@echo off
title Emergency Patient Management System - C Priority Queue Engine
echo ====================================================================
echo   Building Priority-Based Emergency Patient Management System
echo   Data Structures: Array-Based Max Heap (C Backend Engine)
echo ====================================================================
echo.

:: Stop any running instance of server.exe so file is not locked
taskkill /F /IM server.exe >nul 2>&1

echo [1/3] Compiling C Backend Source Files...
gcc -Wall -Wextra -O2 -Ibackend -o server.exe backend/main.c backend/patient.c backend/priority_queue.c backend/server.c -lpthread -lws2_32

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo [ERROR] C Compilation failed! Please check gcc configuration.
    pause
    exit /b %ERRORLEVEL%
)

echo [SUCCESS] C Backend server compiled successfully (server.exe).
echo.

echo [2/3] Automatically opening Web Interface in Default Browser...
start http://localhost:8080

echo [3/3] Starting C Backend Socket Server...
server.exe
