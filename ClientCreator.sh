echo "Starting..."
mkdir ClientCreator
cd ClientCreator

echo "Downloading dependencies..."
wget https://raw.githubusercontent.com/Geigerkind/ClientDownloader/main/ClientDownloader.sh
# TODO: Put it in some Repo
cp ../../client/connection_patcher .
cp ../../client/WoWRegeneration.exe .
cp -r ../../client/WTF .

echo "Downloading client..."
bash ClientDownloader.sh
rm ClientDownloader.sh

mv connection_patcher wow434
mv WoWRegeneration.exe wow434
mv WTF wow434

cd wow434
#wine WoWRegeneration.exe
#mv WoW-15595/Data .
#rm -r WoW-15595
cp -r ../../../wowregen/WoW-15595/Data .
rm WoWRegeneration.exe

echo "Patching clients..."
./connection_patcher Wow.exe
./connection_patcher Wow-64.exe
mv Wow_Patched.exe Wow.exe
mv Battle.net_Patched.dll Battle.net.dll
mv Wow-64_Patched.exe Wow-64.exe
mv Battle.net-64_Patched.dll Battle.net-64.dll

mkdir -p ~/.wine/drive_c/ProgramData/Blizzard\ Entertainment/Battle.net/Cache/
cp -rf AuthModules/* ~/.wine/drive_c/ProgramData/Blizzard\ Entertainment/Battle.net/Cache/
cp -rf AuthModules_64/* ~/.wine/drive_c/ProgramData/Blizzard\ Entertainment/Battle.net/Cache/
rm -rf AuthModules
rm -rf AuthModules_64
rm connection_patcher

echo "Cleaning up..."
cd ../../
mv ClientCreator/wow434 .
rm -r ClientCreator

echo "Done!"

