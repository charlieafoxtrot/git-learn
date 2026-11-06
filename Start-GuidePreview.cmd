@echo off
powershell.exe -NoProfile -File "%~dp0Start-GuidePreview.ps1"
if errorlevel 1 pause
