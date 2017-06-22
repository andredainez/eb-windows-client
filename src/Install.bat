set VER=1_0
set CWD=%~dp0
@if exist "%TEMP%\Elkarbackup_WinCli_%VER%" rmdir /s /q "%TEMP%\Elkarbackup_WinCli_%VER%"
@if not exist "%TEMP%\Elkarbackup_WinCli_%VER%" mkdir "%TEMP%\Elkarbackup_WinCli_%VER%"
copy "%CWD%" "%TEMP%\Elkarbackup_WinCli_%VER%"
SET /P END="Press Enter to finish:"