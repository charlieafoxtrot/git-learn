@echo off
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0Start-GuidePreview.ps1"
if errorlevel 1 pause
if errorlevel 1 exit /b 1
start "" "http://localhost:52678/"
