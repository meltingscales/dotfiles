function isadmin {
    #Returns true/false
   ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")
}

if(!(isadmin)){
    throw "You must be running this script as admin."
}

if ($null -eq (Get-Command "git.exe" -ErrorAction SilentlyContinue)) { 
    Write-Host "[i] Unable to find git.exe in your PATH"
    Invoke-Expression ./windows/setup/first-setup-choco-git.ps1
}
else {
    Write-Host "[/] git.exe exists."
}

Write-Host "[+] Setting up Git and repos..."
Invoke-Expression ./windows/setup/first-setup-clone-repos.ps1

Write-Host "[+] Installing Choco/npm/etc packages..."
Invoke-Expression ./windows/setup/first-setup-install-packages