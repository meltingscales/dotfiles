Import-Module .\backupZipUtil.psm1

$name = "technic"
$src = resolve-path "~\AppData\Roaming\.technic\modpacks"
$dest = "G:\My Drive\Backups\MinecraftAutoBackups\$name"

DoDaBackupZippyThingy $src $dest $name