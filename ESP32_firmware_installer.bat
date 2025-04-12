@echo off
title Flash ESP32 com MicroPython - Nicolas
echo ========================================
echo         GRAVAR FIRMWARE ESP32        
echo ========================================
echo.

:: Define a COM port e o arquivo do firmware
set COMPORT=COM6
set FIRMWARE=ESP32_GENERIC-20241129-v1.24.1.bin

:: Verifica se o firmware existe
if not exist "%~dp0%FIRMWARE%" (
    echo ERRO: Arquivo %FIRMWARE% não encontrado na pasta atual.
    pause
    exit /b
)

:: Vai para a pasta onde está o script e o firmware
cd /d "%~dp0"

echo Etapa 1: Apagando a memoria flash do ESP32...
python -m esptool --port %COMPORT% erase_flash
if errorlevel 1 (
    echo ERRO ao apagar a flash. Verifique a porta COM ou a conexao do dispositivo.
    pause
    exit /b
)

echo.
echo Etapa 2: Gravando o firmware: %FIRMWARE%
python -m esptool --port %COMPORT% write_flash -z 0x0 %FIRMWARE%
if errorlevel 1 (
    echo ERRO ao gravar o firmware. Tente novamente.
    pause
    exit /b
)

echo.
echo ========================================
echo     Firmware gravado com sucesso!      
echo Agora eh soh abrir o Thonny e testar :)  
echo ========================================
pause
