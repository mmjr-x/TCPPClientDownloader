# Exit the script when there is a error
$ErrorActionPreference = "Stop"

echo "Starting..."
mkdir ClientCreator
cd ClientCreator

echo "Downloading dependencies..."
Invoke-Webrequest https://raw.githubusercontent.com/Geigerkind/TCPPClientDownloader/master/ClientDownloader.ps1 -Outfile ClientDownloader.ps1
Invoke-Webrequest https://github.com/Geigerkind/TCPPClientDownloader/raw/master/WoWRegeneration.exe -Outfile WoWRegeneration.exe
Invoke-Webrequest https://github.com/Geigerkind/TCPPClientDownloader/raw/master/connection_patcher.exe -Outfile connection_patcher.exe
Invoke-Webrequest https://github.com/Geigerkind/TCPPClientDownloader/raw/master/WTF.zip -Outfile WTF.zip
Expand-Archive -LiteralPath WTF.zip -DestinationPath ./
rm WTF.zip

echo "Downloading client..."
.\ClientDownloader.ps1
rm ClientDownloader.ps1

mv connection_patcher.exe wow434
mv WoWRegeneration.exe wow434
mv WTF wow434

cd wow434
# .\WoWRegeneration.exe
# $process = Start-Process -FilePath ".\WoWRegeneration.exe" -PassThru -RedirectStandardInput $true

$psi = New-Object System.Diagnostics.ProcessStartInfo;
$psi.FileName = ".\ClientCreator\wow434\WoWRegeneration.exe"; #process file
$psi.WorkingDirectory = ".\ClientCreator\wow434"
$psi.UseShellExecute = $false; #start the process from it's own executable file
$psi.RedirectStandardInput = $true; #enable the process to read from standard input

$process = [System.Diagnostics.Process]::Start($psi);

$process.StandardInput.WriteLine("07"); # Set locale to enUs
$process.StandardInput.WriteLine("01"); # Set OS to win

$process.StandardInput.WriteLine("y"); # Continue

Wait-Process -Id $process.Id

mv WoW-15595/Data .
rm -r WoW-15595
rm WoWRegeneration.exe

# read-host "Press ENTER to continue..."

echo "Patching clients..."

echo "y" | .\connection_patcher.exe Wow.exe
echo "y" | .\connection_patcher.exe Wow-64.exe
rm connection_patcher.exe

rm Wow.exe
rm Wow-64.exe
rm Battle.net.dll
rm Battle.net-64.dll

mv Wow_Patched.exe Wow.exe
mv Battle.net_Patched.dll Battle.net.dll
mv Wow-64_Patched.exe Wow-64.exe
mv Battle.net-64_Patched.dll Battle.net-64.dll

echo "Cleaning up..."
cd ../../
mv ClientCreator/wow434 .
rm -r ClientCreator

echo "Done!"
read-host "Press ENTER to exit..."

