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

        $FullSource = Join-Path -Path $SourcePrefix -ChildPath $Source
        $FullDest = Join-Path -Path $DEST -ChildPath $SOURCE

        if (!(test-path $FullSource) ) {
            Write-Host "Error! Source folder does not exist: `n $FullSource "
            return;
        }

        if (test-path $FullDest) {
            Write-Host "[+] Destination path already exists: `n   [i] $FullDest"
            return;
        }

        Write-Host "[+] Copy $("~/$SOURCE") to $("$DEST/")..."
    
        Copy-Item -Path (Resolve-Path "~/$SOURCE") -Destination "$DEST/" -Recurse
    
        Write-Host "   [i] Done!"
        
        if ($DELETE_SOURCE) {
            Write-Host "rm ~/$SOURCE"
            Remove-Item -Recurse "~/$SOURCE"
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