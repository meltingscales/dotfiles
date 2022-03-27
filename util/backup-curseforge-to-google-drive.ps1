$destfolder = "G:\My Drive\Backups\CurseForgeMinecraftAutoBackups"
$src = resolve-path "~\curseforge\minecraft\Instances\"
$dest = join-path -path "$destfolder" -childpath "curseforge-instances-$($date).zip"
$includeBaseDirectory = $false
$compressionLevel = [System.IO.Compression.CompressionLevel]::Optimal

$date = (Get-Date -Format "MM-dd-yyyy-HH-mm")

if (!(Test-Path $destfolder)) {
    new-item -Path $destfolder -ItemType "Directory"
}

Write-Host "Compressing 
    $src
into
    $dest
..."

Add-Type -AssemblyName System.IO.Compression.FileSystem
[System.IO.Compression.ZipFile]::CreateFromDirectory("$src", "$dest", $compressionLevel, $includeBaseDirectory)
# Compress-Archive -path $src -DestinationPath $dest #don't use compress-archive, it runs out of memory

if (!($?)) {
    Write-Host "Something went wrong :("
}
else {

    Write-Host "Your CurseForge modpack/world backup is done:"
    Write-Host "$dest"
}

