@echo off
title ComfyUI Launcher

cd /d "C:\Users\Manuel Almeida\Documents\GitHub\comfyui_personal"
call venv\Scripts\activate.bat

:: Open browser after 30 second delay in the background
start "" cmd /c "timeout /t 40 /nobreak >nul && start "" http://127.0.0.1:8188"

python main.py