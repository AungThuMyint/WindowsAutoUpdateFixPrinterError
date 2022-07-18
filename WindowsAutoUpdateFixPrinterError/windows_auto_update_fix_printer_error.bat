@ECHO OFF
if "%~s0"=="%~s1" ( cd %~sp1 & shift ) else (
  echo CreateObject^("Shell.Application"^).ShellExecute "%~s0","%~0 %*","","runas",1 >"%tmp%%~n0.vbs" & "%tmp%%~n0.vbs" & del /q "%tmp%%~n0.vbs" & goto :eof
)
cls
title Windows Auto Update Fix Printer Error [Coder : MR47M]
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /f /v NoAutoRebootWithLoggedOnUsers /t REG_DWORD /d 1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /f /v NoAutoUpdate /t REG_DWORD /d 0
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /f /v ScheduledInstallDay /t REG_DWORD /d 0
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /f /v AUOptions /t REG_DWORD /d 4
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /f /v RescheduleWaitTime /t REG_DWORD /d 1
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Print" /v RpcAuthnLevelPrivacyEnabled /t REG_DWORD /d 0 /f
net stop spooler
net start spooler
cls
timeout /t 5