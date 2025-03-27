Ubuntu 18 with game server manager, Pterodactyl

- https://pterodactyl.io/panel/1.0/getting_started.html
- https://wisp.gg/community

## Extra

### SSH Server

You may want to enable SSH as proxmox VNC sucks, no copy-paste.

    sudo apt-get update
    sudo apt-get install openssh-server
    sudo systemctl status sshd
    sudo ufw allow ssh
    sudo ufw status

## Steps

1. Run `setup.sh`
2. Run `mysql -u root -p` to open MySQL prompt.
3. Execute all the code in `sql.sql`