Import-Module .\backupZipUtil.psm1

$name = "curseforge"
$src = resolve-path "~\curseforge\minecraft\Instances\"
$dest = "G:\My Drive\Backups\MinecraftAutoBackups\$name"

DoDaBackupZippyThingy $src $dest $name