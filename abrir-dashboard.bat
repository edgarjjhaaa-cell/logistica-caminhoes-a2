@echo off
chcp 65001 >nul
cd /d "%~dp0"

echo.
echo  ========================================
echo   Control Tower - Logistica dos Caminhoes
echo  ========================================
echo.

for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /i /c:"IPv4"') do (
  for /f "tokens=1" %%b in ("%%a") do set IP=%%b
)

echo  No PC abra:
echo    http://localhost:8080/dashboard.html
echo.
echo  No celular (mesma rede Wi-Fi):
echo    http://%IP%:8080/dashboard.html
echo.
echo  Se o mapa falhar no celular, use internet
echo  no aparelho e atualize a pagina.
echo.
echo  Deixe esta janela aberta enquanto usar.
echo  ========================================
echo.

REM Libera porta no firewall (pede admin se necessario; ignora erro)
netsh advfirewall firewall add rule name="Dashboard Logistica 8080" dir=in action=allow protocol=TCP localport=8080 >nul 2>&1

python -m http.server 8080 --bind 0.0.0.0
pause
