@echo off
title CHROME EXTENSIONS SCRIPT
color 4f
mode 120,30
echo ===============================================
echo  DISABLE CHROME POPUP - SCRIPT EXECUTION
echo  Created by: Rahmat Dani Zaki
echo ===============================================
echo[
set /p idext=ID ATG Extension:
echo[
echo Processing....
echo[
echo Terminating Chrome App..
taskkill /IM chrome.exe >nul
echo[
echo Copying file to system windows

cd policy_templates\windows\admx
copy chrome.admx %windir%\PolicyDefinitions
cd en-US
copy chrome.adml %windir%\PolicyDefinitions\en-US
echo[
echo file successfully copied
echo[
echo Add Chrome registry
reg add HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallWhitelist /v 1 /t REG_SZ /d %idext% /f
echo[
echo Initializing...
ping 127.0.0.1 -n 5 >nul
start chrome
:spinner
set mSpinner=%mSpinner%.
if %mSpinner%'==....' (set mSpinner=.)
cls
echo Applying ATY Extension to Chrome Whitelist%mSpinner%
ping 127.0.0.1 -n 2 >nul
IF "%mSpinner%"=="..." (
    goto ended
)
goto spinner
:ended
taskkill /IM chrome.exe >nul
cls
echo --------------------------------------------
echo  DISABLE CHROME POPUP - SCRIPT EXECUTION
echo --------------------------------------------
echo[
echo Success... Please restart your Chrome Browser
echo[
pause
