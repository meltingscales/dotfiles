
function Show-News {
    if (!($ENV:IN_API_KEY)) {
        Write-Host "See https://github.com/shivam043/instantnews
        You must set 'IN_API_KEY' env var for the 'instantnews' Python3 package.
        Or restart shell if you already set it."
    }
    else {

        $startInfo = New-Object 'System.Diagnostics.ProcessStartInfo' -Property @{
            FileName              = "instantnews"
            Arguments             = "--news", "bloomberg"
            UseShellExecute       = $false
            RedirectStandardInput = $true
        }
        $process = [System.Diagnostics.Process]::Start($startInfo)
        Start-Sleep -Seconds 5
        $process.StandardInput.WriteLine("n")
        # Write-Host $process
        
    }    
}

Write-Host "    === Welcome to HenryFBP/dotfiles/windows/startup.ps1 v1.0 :3c ==="
Write-Host ""

Write-Host "Updating Git repos in separate terminal..."
Start-Sleep 1
cmd.exe /c START powershell.exe "Invoke-Expression ~/Git/dotfiles/util/fetch-all-git-repos.ps1; pause"

Write-Host "Weather:"
curl.exe https://wttr.in/
Write-Host ""

Write-Host "News:"
Show-News
Write-Host ""

Write-Host "Done with startup! Enjoy your day :3c"