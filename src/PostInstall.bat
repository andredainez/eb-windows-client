SET VER=1_0
@if exist %USERPROFILE%\AppData\Local\lxss\mnt type "%TEMP%\Elkarbackup_WinCli_%VER%\ConfiguracionSSH.txt"
@if exist %USERPROFILE%\AppData\Local\lxss\mnt GOTO Install2
lxrun /install /y
lxrun /update
bash -c do-release-upgrade
bash -c "/usr/sbin/dpkg-reconfigure openssh-server"
bash -c "ssh-keygen -t rsa -b 4096 -f /root/.ssh/id_rsa -q -N \"\""
bash -c "touch /root/.ssh/authorized_keys"
bash -c "echo \"service ssh --full-restart\" >> /root/.bashrc"
bash -c "chmod 600 /root/.ssh/authorized_keys"
bash -c "apt-get --assume-yes install dos2unix"
:Install
SET /P PORT="Enter the port for SSH (22 is in use on Windows10), recommended 2222:"
bash -c "echo "" > /etc/ssh/sshd_config"
echo Port %PORT% >> %USERPROFILE%\AppData\Local\lxss\rootfs\etc\ssh\sshd_config
type "%TEMP%\Elkarbackup_WinCli_%VER%\sshd_configport" >> %USERPROFILE%\AppData\Local\lxss\rootfs\etc\ssh\sshd_config
GOTO Install3
:Install2
SET /P PORT="Enter the port configured for SSH:"
:Install3
schtasks /Create /SC onlogon /TN EBKP_VDesk /TR "%PROGRAMFILES%\Elkarbackup_WinCli_%VER%\vdesk.exe on:2 noswitch:true run:bash" /DELAY 0000:20
netsh advfirewall firewall add rule name="EBKP SSH In" dir=in action=allow protocol=TCP localport=%PORT%
netsh advfirewall firewall add rule name="EBKP SSH Out" dir=out action=allow protocol=TCP localport=%PORT%
@if not exist "%PROGRAMFILES%\Elkarbackup_WinCli_%VER%" mkdir "%PROGRAMFILES%\Elkarbackup_WinCli_%VER%"
@if exist "%TEMP%\Elkarbackup_WinCli_%VER%" copy %TEMP%\Elkarbackup_WinCli_%VER%\* "%PROGRAMFILES%\Elkarbackup_WinCli_%VER%"
@if exist "%TEMP%\Elkarbackup_WinCli_%VER%" rmdir /q /s "%TEMP%\Elkarbackup_WinCli_%VER%"
SET /P END="Press Enter to finish:"