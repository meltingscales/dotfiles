Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

choco install -y git


mkdir ~/Github
cd ~/Github
git clone https://github.com/HenryFBP/VagrantPackerFiles
git clone https://github.com/HenryFBP/iso-notes
git clone https://github.com/HenryFBP/examples
git clone https://github.com/HenryFBP/discord-with-free-emojis
git clone https://github.com/HenryFBP/ms-office-easy-install
git clone https://github.com/HenryFBP/KMS-activator

choco install -y gimp steam libreoffice notepadplusplus 7zip git virtualbox vagrant python3 ruby