$date = (Get-Date -Format "MM-dd-yyyy-HH-mm")
$destfolder = "G:\My Drive\Backups\CurseForgeMinecraftAutoBackups"
$dest = join-path -path "$destfolder" -childpath "curseforge-instances-$($date).zip"
$src = resolve-path "~\curseforge\minecraft\Instances\"

if (!(Test-Path $destfolder)) {
    new-item -Path $destfolder -ItemType "Directory"
}

compress-archive -path $src -DestinationPath $dest

Write-Host "Your CurseForge modpack/world backup is done:"
Write-Host "$dest"