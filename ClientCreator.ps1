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

echo "Cleaning up..."
cd ../../
mv ClientCreator/wow434 .
rm -r ClientCreator

echo "Done!"

