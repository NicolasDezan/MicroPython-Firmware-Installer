@echo off
title Detectar dispositivos ESP
echo ==========================================
echo      DETECCAO DE DISPOSITIVOS ESP         
echo ==========================================
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

:: Tenta importar o esptool, instala se nao tiver
echo Verificando se o esptool esta instalado...
python -c "import esptool" >nul 2>nul
if errorlevel 1 (
    echo O esptool nao foi encontrado. Tentando instalar automaticamente...
    pip install esptool
    if errorlevel 1 (
        echo Falha ao instalar o esptool. Verifique sua conexao com a internet ou instale manualmente com:
        echo pip install esptool
        pause
        exit /b
    )
)

:: Lista portas seriais
echo.
echo Procurando portas seriais...
python -m serial.tools.list_ports > portas.txt

setlocal enabledelayedexpansion
set found=0

for /f "tokens=1,* delims= " %%a in (portas.txt) do (
    set porta=%%a
    echo Testando !porta!...

    :: Tenta detectar chip ESP (atualmente focado no C3, pode ajustar o --chip se quiser outro)
    python -m esptool --chip esp32c3 --port !porta! flash_id > resultado.txt 2>nul

    findstr /C:"Detected" resultado.txt >nul
    if !errorlevel! == 0 (
        echo ------------------------------------------
        echo Dispositivo ESP identificado!
        echo Porta: !porta!
        findstr /C:"Chip is" resultado.txt
        findstr /C:"MAC:" resultado.txt
        echo.
        set /a found=!found!+1
    )
)

if !found! == 0 (
    echo Nenhum dispositivo ESP foi encontrado.
) else (
    echo Total de dispositivos encontrados: !found!
)

del portas.txt >nul 2>nul
del resultado.txt >nul 2>nul
pause