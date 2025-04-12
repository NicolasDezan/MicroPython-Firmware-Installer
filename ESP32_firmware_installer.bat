@echo off
title Flash ESP32 com MicroPython - Nicolas
echo ========================================
echo         GRAVAR FIRMWARE ESP32        
echo ========================================
echo.

:: Verifica se o Python está instalado
where python >nul 2>nul
if errorlevel 1 (
    echo Python nao foi encontrado no PATH.
    echo Abrindo a pagina oficial do Python para instalacao...
    start https://www.python.org/downloads/
    pause
    exit /b
)

:: Verifica se o esptool está instalado
echo Verificando se o esptool esta instalado...
python -c "import esptool" >nul 2>nul
if errorlevel 1 (
    echo O esptool nao foi encontrado. Tentando instalar automaticamente...
    pip install esptool
    if errorlevel 1 (
        echo Falha ao instalar o esptool. Instale manualmente com:
        echo pip install esptool
        pause
        exit /b
    )
)

:: Pergunta qual porta COM usar
set /p COMPORT=Digite a porta COM (ex: COM3): 
if "%COMPORT%"=="" (
    echo Porta COM nao informada. Encerrando...
    pause
    exit /b
)

:: Pergunta o nome do firmware
set /p FIRMWARE=Digite o nome do arquivo do firmware (ex: firmware.bin): 
if "%FIRMWARE%"=="" (
    echo Nome do firmware nao informado. Encerrando...
    pause
    exit /b
)

:: Verifica se o firmware existe
if not exist "%~dp0%FIRMWARE%" (
    echo ERRO: Arquivo %FIRMWARE% nao encontrado na pasta atual.
    pause
    exit /b
)

:: Vai para a pasta onde está o script e o firmware
cd /d "%~dp0"

echo.
echo Etapa 1: Apagando a memoria flash do ESP32 na porta %COMPORT%...
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
echo ========================================
pause
