# Separated because `git` doesn't show up in PATH for some reason after `choco` install

mkdir ~/Github
Set-Location ~/Github
git clone https://github.com/HenryFBP/KMS-activator
git clone https://github.com/HenryFBP/HWIDGEN-SRC
git clone https://github.com/Sycnex/Windows10Debloater
git clone https://github.com/HenryFBP/VagrantPackerFiles
git clone https://github.com/HenryFBP/iso-notes
git clone https://github.com/HenryFBP/examples
git clone https://github.com/HenryFBP/discord-with-free-emojis
git clone https://github.com/HenryFBP/ms-office-easy-install

choco install -y steam multimc 

choco install -y chromium opera firefox vlc spotify

choco install -y 7zip hxd vscode sysinternals curl wget windirstat

choco install -y gimp libreoffice notepadplusplus inkscape audacity kdenlive obs-studio

choco install -y virtualbox vagrant python3 ruby jdk8 nodejs wireshark 