# Elkarbackup Windows Client

## Prerequisites
- Windows 10 64 bits
- OS Bulid 14393.0 or later (Settings > System > About)
- **Linux Subsystem must be enabled**. You can do that manually, or following these steps:
  - Execute PreInstall.bat as administrator
  - Reboot

## Installation
1. Execute Install.bat
2. Execute PostInstall.bat as administrator
    1. The installer will ask you for a port: we suggest to use 2222 port as the port 22 may be used

## Configuration

First of all, you need to add your ElkarBackup server's SSH public key. You can download it from the ElkarBackup web GUI to your Windows computer (for instance, *C:\Publickey.pub*). Let's enable the SSH login with that publickey:

Open a Windows console window (*cmd*) and run the following commands:

```sh
> bash
$ cat /mnt/c/Publickey.pub >> /root/.ssh/authorized_keys
```

Now, we have to add a client/job in our ElkarBackup server to backup the directory *C:\SomeImportantData* from our Windows computer:
- Create a new Client with the following configuration:
  - **URL**: `root@<your-computer-ip>`
  - **Advanced - SSH args**: `-p2222`
- Create a new job:
  - **Path**: `/mnt/c/SomeImportantData/` (where **c** is the drive letter, *C:*)

## Uninstall
1. Execute Uninstall.bat as administrator
