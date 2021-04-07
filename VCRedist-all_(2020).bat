@Echo off
Echo ############################################################
Echo ##                                                        ##
Echo ##                   VCRuntime Installer                  ##
Echo ##                                                        ##
Echo ##                      !ATTENTION!                       ##
Echo ##                                                        ##
Echo ##                                                        ##
Echo ############################################################
chcp 861>nul

:: BatchGotAdmin BEGIN https://sites.google.com/site/eneerge/home/BatchGotAdmin | https://ss64.com/nt/rem.html | https://ss64.com/nt/cacls.html
:: Check for permissions
mkdir "%windir%\GotAdminTestCreateDir"
if '%errorlevel%' == '0' (
    rmdir "%windir%\GotAdminTestCreateDir" &goto gotAdmin
) else ( goto UACPrompt )




:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%~dp0getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%~dp0getadmin.vbs"

    "%~dp0getadmin.vbs"
    exit /B

:gotAdmin
    if exist "%~dp0getadmin.vbs" ( del "%~dp0getadmin.vbs" )
    pushd "%CD%"
    CD /D "%~dp0"
:: BatchGotAdmin END
@echo off
del /q /f "b64"  >nul 2>nul
del /q /f "vcredist_inst.ps1"  >nul 2>nul

:: c64 enc vcredist_get.ps1 =powershell script for downloading all packs
set "blowload1=PCMNCiAgICAuU1lOT1BTSVMNCiAgICAgICAgSW5zdGFsbCBhbGwgImVuZ2xpc2giIFZpc3VhbCBDKysgUnVudGltZXMNCiANCiAgICAuUEFSQU1FVEVSICBQYXJhbWV0ZXJBDQogICAgICAgICRPdXRwdXRQYXRoID0gRGVmYXVsdCBQYXRoDQojPiAgDQpwYXJhbSgNCiAgICBbU3RyaW5nXSRvdXRwdXRQYXRoID0gIi5cVkNSdW50aW1lIg0KKQ0KIA0KW1N0cmluZ10kb3V0cHV0UGF0aCA9ICIuXFZDUnVudGltZSINCiANCldyaXRlLUhvc3QgIkluc3RhbGwgTWljcm9zb2Z0IFZpc3VhbCBDKysgMjAwNSwgMjAwOCwgMjAxMCwgMjAxMiwgMjAxMywgMjAxNSwyMDE3LDIwMTkgKyBWQ0ZvclB5dGhvbjI3Ig0KV3JpdGUtSG9zdCAiQW5kcmVhcyBOaWNrLCBTb2Z0d2FyZS1WaXJ0dWFsaXNpZXJ1bmcuZGUsIDIwMTUiDQogDQpmb3JlYWNoICgkdmNGaWxlIGluIEdldC1DaGlsZEl0ZW0gJG91dHB1dFBhdGggLVJlY3Vyc2UgLUZpbHRlciAiKi4qIikNCnsNCiAgICBXcml0ZS1Ib3N0ICJJbnN0YWxsICIgJHZjRmlsZS5mdWxsbmFtZQ0KICAgIFN0YXJ0LVByb2Nlc3MgICR2Y0ZpbGUuZnVsbG5hbWUgLUFyZ3VtZW50TGlzdCAnL3EnIC1Ob05ld1dpbmRvdyAtV2FpdA0KICAgICANCiAgICAgDQp9"
::  c64 enc
set "blowload2=PCMNCiAgICAuU1lOT1BTSVMNCiAgICAgICAgSW5zdGFsbCBhbGwgImVuZ2xpc2giIFZpc3VhbCBDKysgUnVudGltZXMNCiANCiAgICAuUEFSQU1FVEVSICBQYXJhbWV0ZXJBDQogICAgICAgICRPdXRwdXRQYXRoID0gRGVmYXVsdCBQYXRoDQogDQojPg0KIA0KIA0KcGFyYW0oDQogICAgW1N0cmluZ10kb3V0cHV0UGF0aCA9ICIuXFZDUnVudGltZSINCikNCiANCltTdHJpbmddJG91dHB1dFBhdGggPSAiLlxWQ1J1bnRpbWUiDQogDQpXcml0ZS1Ib3N0ICJJbnN0YWxsIE1pY3Jvc29mdCBWaXN1YWwgQysrIDIwMDUsIDIwMDgsIDIwMTAsIDIwMTIsIDIwMTMsIDIwMTUiDQpXcml0ZS1Ib3N0ICJBbmRyZWFzIE5pY2ssIFNvZnR3YXJlLVZpcnR1YWxpc2llcnVuZy5kZSwgMjAxNSINCiANCmZvcmVhY2ggKCR2Y0ZpbGUgaW4gR2V0LUNoaWxkSXRlbSAkb3V0cHV0UGF0aCAtUmVjdXJzZSAtRmlsdGVyICIqLmV4ZSIpDQp7DQogICAgV3JpdGUtSG9zdCAiSW5zdGFsbCAiICR2Y0ZpbGUuZnVsbG5hbWUNCiAgICBTdGFydC1Qcm9jZXNzICAkdmNGaWxlLmZ1bGxuYW1lIC1Bcmd1bWVudExpc3QgJy9xJyAtTm9OZXdXaW5kb3cgLVdhaXQNCiAgICAgDQogICAgIA0KfQ=="

echo -----BEGIN CERTIFICATE-----%blowload1%-----END CERTIFICATE----->"b64_1"
certutil /decode "b64" "vcredist_get.ps1" >nul 2>nul
echo -----BEGIN CERTIFICATE-----%blowload2%-----END CERTIFICATE----->"b64_2"
certutil /decode "b64" "vcredist_inst.ps1" >nul 2>nul
start powershell.exe -file vcredist_inst.ps1
start powershell.exe -file vcredist_get.ps1
del /q /f "b64"  >nul 2>nul
del /q /f "vcredist_get.ps1"  >nul 2>nul
del /q /f "vcredist_inst.ps1"  >nul 2>nul