function IsAdmin {
    #Returns true/false
   ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")
}

function CommandExists {

    param (
        $cmd
    )

    return ($null -ne (Get-Command "$cmd" -ErrorAction SilentlyContinue))
}

if (!(IsAdmin)) {
    throw "You must be running this script as admin."
}

if ((!(CommandExists "git.exe")) -or (!(CommandExists "choco"))) { 
    Write-Host "[i] Unable to find git.exe or choco in your PATH"
    Invoke-Expression ./windows/setup/first-setup-choco-git.ps1
}
else {
    Write-Host "[/] git.exe exists."
}

Write-Host "[+] Setting up Git and repos..."
Invoke-Expression ./windows/setup/first-setup-clone-repos.ps1

Write-Host "[+] Installing Choco/npm/etc packages..."
Invoke-Expression ./windows/setup/first-setup-install-packages