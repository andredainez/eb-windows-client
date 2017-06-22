VER=1_0
SET /P DEIN="Uninstall Linux Subsystem too? [y/n]:"
echo %DEIN%
IF "%DEIN%"=="y" ( lxrun.exe /uninstall /full )
IF "%DEIN%"=="Y" ( lxrun.exe /uninstall /full )
SCHTASKS /delete /TN EBKP_VDesk /f
netsh advfirewall firewall delete rule name="EBKP SSH In"
netsh advfirewall firewall delete rule name="EBKP SSH Out"
rmdir /q /s "%PROGRAMFILES%\Elkarbackup_WinCli_1_0"
SET /P FIN="Restart the computer to finish the process"