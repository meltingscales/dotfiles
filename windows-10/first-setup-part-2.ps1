# Separated because `git` doesn't show up in PATH for some reason after `choco` install

New-Item ~/Github
Set-Location ~/Github
git clone https://github.com/Sycnex/Windows10Debloater
git clone https://github.com/HenryFBP/VagrantPackerFiles
git clone https://github.com/HenryFBP/iso-notes
git clone https://github.com/HenryFBP/examples
git clone https://github.com/HenryFBP/discord-with-free-emojis
git clone https://github.com/HenryFBP/ms-office-easy-install
git clone https://github.com/HenryFBP/KMS-activator

# games
choco install -y steam multimc visualboyadvance zsnes dosbox dolphin scummvm ds4windows cemu 
# yuzu DNE
# retroarch hangs

# multimedia
choco install -y chromium opera firefox vlc spotify

# editing tools
choco install -y gimp libreoffice notepadplusplus inkscape audacity kdenlive obs-studio

# small little coding/etc tools
choco install -y 7zip hxd vscode sysinternals curl wget windirstat alacritty

# code frameworks/large code tools
choco install -y virtualbox vagrant python3 ruby jdk8 nodejs wireshark 