<#

from https://community.idera.com/database-tools/powershell/powertips/b/tips/posts/setting-permanent-environment-variables
https://medium.com/@cedricdue/moving-vagrant-boxes-and-related-virtualbox-vms-to-another-drive-f1d7c50d20bc

#>

$DEST = "D:/" # you can change this...

function MoveFolder {
    [cmdletbinding()]
    Param (
        [string] $Source,
        [string] $SourcePrefix,
        [string] $Dest,
        [bool] $DeleteSource
    );

    Process {

        $FullSource = Resolve-Path (Join-Path -Path "$SourcePrefix" -ChildPath "$Source")
        $FullDest = Join-Path -Path "$Dest" -ChildPath "$Source"

        if (!(test-path "$FullSource") ) {
            Write-Host "Error! Source folder does not exist: `n $FullSource "
            return;
        }

        if (test-path "$FullDest") {
            Write-Host "[+] Destination path already exists: `n   [i] $FullDest"
            return;
        }

        Write-Host "[+] Copy $FullSource to $FullDest..."

        $size_mb = [Math]::Round(
                ((Get-ChildItem "$FullSource" -Recurse | Measure-Object -Property Length -Sum).Sum / 1.0MB),
            2.0)
            

        Write-Host "   [i] $($size_mb) MB..."
    
        Copy-Item -Path "$FullSource" -Destination "$FullDest/" -Recurse
    
        Write-Host "   [i] Done!"
        
        if ($DELETE_SOURCE) {
            Write-Host "rm $FullSource"
            Remove-Item -Recurse "$FullSource"
        }
    }
    
}

MoveFolder -SourcePrefix "~" -Source "Virtualbox VMs/"  -Dest $DEST -DeleteSource $false
MoveFolder -SourcePrefix "~" -Source ".vagrant.d/"  -Dest $DEST -DeleteSource $false

$VARVAL = (Join-Path -Path $DEST -ChildPath ".vagrant.d/")
if (!([System.Environment]::GetEnvironmentVariable('VAGRANT_HOME', 'User'))) {
    Write-Host "[+] Setting env var for VAGRANT_HOME to new dir '$VARVAL'..."
    [System.Environment]::SetEnvironmentVariable('VAGRANT_HOME', $VARVAL, 'User'); 
}