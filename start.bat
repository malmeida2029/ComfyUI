@echo off
title ComfyUI Launcher

cd /d "C:\Users\Manuel Almeida\Documents\GitHub\ComfyUI"
call venv\Scripts\activate.bat

:: Start ComfyUI in a minimized background window
start "comfyui_server" /min cmd /c "cd /d "C:\Users\Manuel Almeida\Documents\GitHub\ComfyUI" && call venv\Scripts\activate.bat && python main.py"

:: Poll until ComfyUI responds, then open browser
echo Waiting for ComfyUI to start...
:WAIT_LOOP
timeout /t 2 /nobreak >nul
curl -s http://127.0.0.1:8188 >nul 2>&1
if errorlevel 1 goto WAIT_LOOP

echo ComfyUI is ready! Opening browser...
start "" "http://127.0.0.1:8188"

echo.
echo ComfyUI is running in the minimized window.
echo Close the minimized "comfyui_server" window to shut it down.
echo.
pause