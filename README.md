# TCPP Client Downloader
Downloads a client from Blizzard's servers and patches it such that it works with the The-Cataclysm-Preservation-Project (TCPP) servers.

## Usage
During the installation it will ask you what kind of client you want to install. 
Use the `enUS` version! Otherwise you have to edit the locale in `WTF/Config.wtf`.
Run it on your own risk!

### GNU/Linux & Mac
1. Make sure that `wine` is installed.
2. Make sure that `wine`'s environment folder is located in `~/.wine`.
3. Run `bash ClientCreator.sh`

### Windows 10
1. Make sure `Visual C++ Redistributable is installed` (https://aka.ms/vs/16/release/vc_redist.x64.exe).
2. Make sure `OpenSSL` is installed (https://slproweb.com/download/Win64OpenSSL-1_1_1L.exe).
3. Run `ClientCreator.ps1` with the `PowerShell`.
