# links

- https://wiki.debian.org/AtiHowTo
- https://www.howtogeek.com/508993/how-to-check-which-gpu-is-installed-on-linux/
- https://www.cyberciti.biz/open-source/command-line-hacks/linux-gpu-monitoring-and-diagnostic-commands/
- https://www.maketecheasier.com/monitor-nvidia-gpu-linux/

# commands

    lspci -v | less
        /VGA

    glxinfo -B | less

    sudo apt install nvidia-smi
    nvidia-smi
    
    sudo apt install nvtop
    nvtop
