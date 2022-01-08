#Requires -RunAsAdministrator

# numbers from testing this in a VM, as of 02ae76dba0140bcb980a1fda41caaba96ed433ae
$sizeGB = (110.610341888 - 87.652098048).ToString("#.##");
#TODO: dynamically generate sizeGB variable... This may be impossible if choco does not list package sizes...

$confirmation = Read-Host "This script, if never run, will take up approx. $sizeGB GB... Continue? (y/n)"
if (!($confirmation -eq 'y')) {
    throw "Aborted!"
}

# Feel free to edit this...
$PACKAGE_LIST_RAW = @{
    Games                        = "
steam
itch
battle.net
multimc
visualboyadvance
zsnes
# yuzu # yuzu does not exist
# retroarch # install hangs :(
dosbox
dolphin
scummvm
ds4windows
gzdoom
cemu
";

    Multimedia                   = "
chromium
opera
firefox
irfanview
imagemagick
ghostscript
vlc
discord
";

    DocumentOrMediaEditing       = "
gimp
libreoffice
notepadplusplus
inkscape
audacity
kdenlive
obs-studio
yed
colorpic
calibre
adobereader
";

    SmallTechnicalTools          = "
7zip
hxd 
# idontexist
sysinternals 
windirstat 
cpu-z 
hwinfo 
openhardwaremonitor
crystaldiskinfo
prime95
furmark
teamviewer
bluescreenview
processhacker
dmde
cyberduck
# ftp # doesn't exist AFAIK
zeal
deluge
samsung-magician
partitionwizard
cdrtfe
grep
emacs
procexp
cutter
radare2
vcredist2015
# intel-ipdt # installer doesn't work...
";

    CodingToolsButNotIDEs        = "
vscode
git
gh
curl
wget
alacritty
jetbrainstoolbox
snyk
sonarqube-scanner.portable 
adb
apktool
";

    FrameworksOrLargeCodingTools = "
virtualbox 
vagrant
python3
ruby
openjdk8
nodejs
wireshark
fiddler
graphviz
hugo-extended
racket
ghc
cabal
haskell-language-server
";

}

# split by '\n' and reassign to hashmap
$PACKAGE_LIST = @{}

foreach ($packagetype in $PACKAGE_LIST_RAW.Keys) {
    # for all package types,

    $PACKAGE_LIST[$packagetype] = $PACKAGE_LIST_RAW[$packagetype].Split("`n")

}

foreach ($packagetype in $PACKAGE_LIST.Keys) {
    Write-Host "[i] processing $packagetype..."

    foreach ($packagename in $PACKAGE_LIST[$packagetype]) {
        
        # trim whitespace...
        $packagename="$packagename".Trim()

        if (!("$packagename")) {
            # if it's "falsy" (probably empty)
            write-host "    [/] skipping falsy/empty '$packagename'"
            continue;
        }
        
        if (("$packagename".ToCharArray()) -contains ([char]"#")) {
            # if it's a comment, '#' anywhere in string,
            Write-Host "    [#] skipping   '$packagename'"
            continue;
        }

        $searchResult = (choco.exe search --local --exact --idonly $packagename)
        if ($searchResult -ilike '0 packages installed.') {
            write-host "Package '$packagename' is not locally installed."
            Write-Host "    [+] installing $packagename"
            choco install -y $packagename

            if($LASTEXITCODE -ne 0) {
                throw "    [!] Last command failed. Halting!"
            }

        }
        else {
            Write-Host "    [+] Already installed $packagename"
        }
    }
}

# npm utils
npm install touch-cli -g
