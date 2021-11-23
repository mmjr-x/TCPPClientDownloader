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
.\WoWRegeneration.exe
mv WoW-15595/Data .
rm -r WoW-15595
rm WoWRegeneration.exe

echo "Patching clients..."
echo "HIT ENTER AFTER IT SAID SUCCESS!"
.\connection_patcher.exe Wow.exe
.\connection_patcher.exe Wow-64.exe
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

