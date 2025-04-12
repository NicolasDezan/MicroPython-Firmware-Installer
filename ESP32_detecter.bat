@echo off
title Detectar dispositivos ESP
echo ==========================================
echo      DETECCAO DE DISPOSITIVOS ESP         
echo ==========================================
echo.

:: Verifica se o esptool esta instalado
where python >nul 2>nul
if errorlevel 1 (
    echo Python nao encontrado no PATH. Instale o Python primeiro.
    pause
    exit /b
)

python -c "import esptool" >nul 2>nul
if errorlevel 1 (
    echo O esptool nao esta instalado.
    echo Instale com: pip install esptool
    pause
    exit /b
)

:: Lista portas seriais
echo Procurando portas seriais...
python -m serial.tools.list_ports > portas.txt

setlocal enabledelayedexpansion
set found=0

for /f "tokens=1,* delims= " %%a in (portas.txt) do (
    set porta=%%a
    echo Testando !porta!...

    :: Tenta detectar chip ESP (atualmente focado no C3, mas pode trocar depois)
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