# Separated because `git` doesn't show up in PATH for some reason after `choco` install

New-Item ~/Github
Set-Location ~/Github
git clone https://github.com/HenryFBP/KMS-activator
git clone https://github.com/HenryFBP/HWIDGEN-SRC
git clone https://github.com/Sycnex/Windows10Debloater #TODO W10 Emiliorated edition
git clone https://github.com/HenryFBP/VagrantPackerFiles
git clone https://github.com/HenryFBP/iso-notes
git clone https://github.com/HenryFBP/examples
git clone https://github.com/HenryFBP/discord-with-free-emojis
git clone https://github.com/HenryFBP/ms-office-easy-install

# games
choco install -y steam battle.net multimc visualboyadvance zsnes dosbox dolphin scummvm ds4windows cemu 
# yuzu DNE
# retroarch hangs

# multimedia
choco install -y chromium opera firefox vlc spotify discord

# editing tools
choco install -y gimp libreoffice notepadplusplus inkscape audacity kdenlive obs-studio 

# small little coding/etc tools
choco install -y 7zip hxd vscode sysinternals curl wget windirstat alacritty cpu-z hwinfo openhardwaremonitor prime95 furmark intel-ipdt jetbrainstoolbox teamviewer

# code frameworks/large code tools
choco install -y virtualbox vagrant python3 ruby jdk8 nodejs wireshark partitionwizard
