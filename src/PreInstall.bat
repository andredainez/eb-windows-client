reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" /t REG_DWORD /f /v "AllowDevelopmentWithoutDevLicense" /d "1"
DISM /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux
SET /P END="Restart the computer to finish the installation, press enter to close the installer"