@echo off
cls
title Seletor Xbox + Configuracao Windows 11
:menu
cls
echo ===================================================
echo   CONFIGURADOR WINDOWS 11 + CORES XBOX / WINDOWS
echo ===================================================
echo.
echo Aplica o Menu Iniciar e a Pesquisa do Windows 11:
echo 1) Configurar Menus do Windows 11 (Flutuante)
echo.
echo ===================================================
echo              🎨 ESCOLHA A PALETA DE CORES
echo ===================================================
echo 2) Modo Claro (Windows 10/11)
echo 3) Modo Escuro (Windows 10/11)
echo 4) Xbox Classico / 360 (Verde Neon)
echo 5) Xbox Series X (Verde Escuro)
echo.
echo ===================================================
echo               🔄 RESTAURAR OU SAIR
echo ===================================================
echo 6) Voltar ao Normal (Menu Original do Windows 10)
echo 7) Sair do Menu
echo ===================================================
set /p opcao=Digite o numero da opcao desejada e aperte Enter: 

if "%opcao%"=="1" goto config_11
if "%opcao%"=="2" goto claro
if "%opcao%"=="3" goto escuro
if "%opcao%"=="4" goto xbox_360
if "%opcao%"=="5" goto xbox_series
if "%opcao%"=="6" goto restaurar_10
if "%opcao%"=="7" goto sair
goto menu

:config_11
echo.
echo Ajustando o seu ExplorerPatcher para o Windows 11...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ExplorerPatcher" /v "StartMenuStyle" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ExplorerPatcher" /v "SearchStyle" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ExplorerPatcher" /v "TaskbarStyle" /t REG_DWORD /d 0 /f
goto reiniciar_explorer

:claro
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v SystemUsesLightTheme /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v AppsUseLightTheme /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v AccentColor /t REG_DWORD /d 11393280 /f
goto reiniciar_explorer

:escuro
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v SystemUsesLightTheme /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v AppsUseLightTheme /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v AccentColor /t REG_DWORD /d 3289650 /f
goto reiniciar_explorer

:xbox_360
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v SystemUsesLightTheme /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v AppsUseLightTheme /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v AccentColor /t REG_DWORD /d 1080336 /f
goto reiniciar_explorer

:xbox_series
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v SystemUsesLightTheme /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v AppsUseLightTheme /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v AccentColor /t REG_DWORD /d 673546 /f
goto reiniciar_explorer

:restaurar_10
echo.
echo Restaurando o Menu e Pesquisa originais do Windows 10...
:: Define os valores do ExplorerPatcher de volta para o padrão do Windows 10 (0)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ExplorerPatcher" /v "StartMenuStyle" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ExplorerPatcher" /v "SearchStyle" /t REG_DWORD /d 0 /f
goto reiniciar_explorer

:reiniciar_explorer
echo Atualizando a interface do Windows...
taskkill /f /im explorer.exe >nul 2>&1
start explorer.exe
echo Pronto! Alteracao aplicada.
timeout /t 2 >nul
goto menu

:sair
exit
