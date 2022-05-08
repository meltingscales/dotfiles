$repos = '
git@github.com:HenryFBP/KMS-activator
git@github.com:HenryFBP/VirtualMachineConfigs
git@github.com:HenryFBP/henryfbp.github.io
git@github.com:HenryFBP/dotfiles
git@github.com:HenryFBP/HWIDGEN-SRC
git@github.com:HenryFBP/iso-notes
git@github.com:HenryFBP/books
git@github.com:HenryFBP/pingstats
https://github.com/Sycnex/Windows10Debloater
git@github.com:HenryFBP/examples
git@github.com:HenryFBP/discord-with-free-emojis
git@github.com:HenryFBP/ms-office-easy-install
https://github.com/viking-gps/viking
git@github.com:HenryFBP/MountainFlow
git@github.com:HenryFBP/robinhoodtest
git@github.com:HenryFBP/pyrhhfbp
git@github.com:HenryFBP/Deep-Reinforcement-Learning-for-Automated-Stock-Trading-Ensemble-Strategy-ICAIF-2020
git@github.com:HenryFBP/trading-bot
git@github.com:HenryFBP/NYU-CS-GY-6843-computer-networking-python
git@github.com:HenryFBP/NYU-CS-GY-6843-computer-networking
';

$repos = $repos.Split([Environment]::NewLine)

# Separated because `git` doesn't show up in PATH for some reason after `choco` install

if (!( Test-path ~/Git)) {
    #if DNE, make it
    New-Item ~/Git
}

if(!(test-path "~/.ssh/id_rsa")) {
    throw "Please create an SSH keypair (run 'ssh-keygen'). Make sure to add it to Github."
}

Push-Location ~/Git 

foreach ($s in $repos) {
    if ($s) {
        git clone $s --recursive
    }
}


Pop-Location