$repos = '
https://github.com/HenryFBP/KMS-activator
https://github.com/HenryFBP/VirtualMachineConfigs
https://github.com/HenryFBP/henryfbp.github.io
https://github.com/HenryFBP/dotfiles
https://github.com/HenryFBP/HWIDGEN-SRC
https://github.com/HenryFBP/iso-notes
https://github.com/HenryFBP/books
https://github.com/HenryFBP/pingstats
https://github.com/Sycnex/Windows10Debloater
https://github.com/HenryFBP/examples
https://github.com/HenryFBP/discord-with-free-emojis
https://github.com/HenryFBP/ms-office-easy-install
https://github.com/viking-gps/viking
https://github.com/HenryFBP/MountainFlow
https://github.com/HenryFBP/robinhoodtest
https://github.com/HenryFBP/pyrhhfbp
https://github.com/HenryFBP/Deep-Reinforcement-Learning-for-Automated-Stock-Trading-Ensemble-Strategy-ICAIF-2020
https://github.com/HenryFBP/trading-bot
https://github.com/HenryFBP/NYU-CS-GY-6843-computer-networking-python
https://github.com/HenryFBP/NYU-CS-GY-6843-computer-networking
';

$repos = $repos.Split([Environment]::NewLine)

# Separated because `git` doesn't show up in PATH for some reason after `choco` install

if (!( Test-path ~/Git)) {
    #if DNE, make it
    New-Item ~/Git
}

Push-Location ~/Git 

foreach ($s in $repos) {
    if ($s) {
        git clone $s --recursive
    }
}


Pop-Location