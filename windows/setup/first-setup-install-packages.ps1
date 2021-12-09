#Requires -RunAsAdministrator

# numbers from testing this in a VM, as of 02ae76dba0140bcb980a1fda41caaba96ed433ae
$sizeGB = (110.610341888 - 87.652098048).ToString("#.##");

$confirmation = Read-Host "This script, if never run, will take up approx. $sizeGB GB... Continue? (y/n):"
if (!($confirmation -eq 'y')) {
    throw "Aborted!"
}

# $PACKAGE_LIST=@{
#     GAMES="
# steam
# battle.net
# multimc
# visualboyadvance
# zsnes
# dosbox
# dolphin
# scummvm
# ds4windows
# cemu"
# }

# write-host "test"
# write-host $PACKAGE_LIST.GAMES.Split("`n")[2] # should be battle.net

# # TODO finish this package list thing

# games
choco install -y steam battle.net multimc visualboyadvance zsnes dosbox dolphin scummvm ds4windows cemu 
# yuzu DNE
# retroarch hangs

# multimedia
choco install -y chromium opera firefox vlc discord

# document/media editing tools
choco install -y gimp libreoffice notepadplusplus inkscape audacity kdenlive obs-studio yed colorpic calibre adobereader

# small little technical tools
choco install -y 7zip hxd sysinternals windirstat cpu-z hwinfo openhardwaremonitor prime95 furmark teamviewer bluescreenview dmde cyberduck <# ftp #> zeal deluge samsung-magician partitionwizard grep emacs procexp
#  intel-ipdt DNW

# coding tools but not IDEs
choco install -y vscode curl wget alacritty jetbrainstoolbox snyk sonarqube-scanner.portable adb apktool

# code frameworks/large code tools
choco install -y virtualbox vagrant python3 ruby openjdk8 nodejs wireshark graphviz hugo-extended racket haskell-dev

# npm utils
npm install touch-cli -g
