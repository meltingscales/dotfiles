function DoDaBackupZippyThingy {
    [CmdletBinding()]
    Param (
        [string]$srcFolder,
        [string]$destFolder,
        [string]$name = "default",
        [string]$date = (Get-Date -Format "MM-dd-yyyy-HH-mm")
    )
    
    $destZip = join-path -path "$destfolder" -childpath "$name-$date.zip"
    $includeBaseDirectory = $false

    if(!(Test-Path $srcFolder)){
        throw "Error! Folder does not exist: $srcFolder"
    }

    if (!(Test-Path $destfolder)) {
        new-item -Path $destfolder -ItemType "Directory"
    }

    Write-Host "Compressing 
>   $srcFolder
into
>   $destZip
..."

    $compressionLevel = [System.IO.Compression.CompressionLevel]::Optimal
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    [System.IO.Compression.ZipFile]::CreateFromDirectory("$srcFolder", "$destZip", $compressionLevel, $includeBaseDirectory)
    # Compress-Archive -path $src -DestinationPath $destZip #don't use compress-archive, it runs out of memory

    if (!($?)) {
        Write-Host "Something went wrong :("
    }
    else {

        Write-Host "Your $name backup is done:"
        Write-Host "$destZip
"
    }

}

Export-ModuleMember -Function DoDaBackupZippyThingy