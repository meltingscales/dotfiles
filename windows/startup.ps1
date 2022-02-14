Invoke-Expression ~/Git/dotfiles/util/fetch-all-git-repos.ps1

# if(Test-Path "~/Git/henryfbp.github.io/scripts/pull-bandcamp-albums/"){
#     Push-Location "~/Git/henryfbp.github.io/scripts/pull-bandcamp-albums/"
#     Invoke-Expression "python3 pull-bandcamp-purchased-albums-to-data.py"
#     Invoke-Expression "python3 pull-bandcamp-wishlisted-albums-to-data.py" 
# }

write-host "Weather:"
curl.exe https://wttr.in/

write-host "News:"
if(!($ENV:IN_API_KEY)){
    write-host "You must set 'IN_API_KEY' env var for the 'instantnews' tool. Or restart shell if you already set it."
} else {
    $startInfo = New-Object 'System.Diagnostics.ProcessStartInfo' -Property @{
        FileName = "instantnews"
        Arguments = "--news", "google-news"
        UseShellExecute = $false
        RedirectStandardInput = $true
    }
    $process = [System.Diagnostics.Process]::Start($startInfo)
    Start-Sleep -Seconds 5
    $process.StandardInput.WriteLine("n")
    # write-host $process
    
}

write-host ""
Write-Host "Done with startup! Enjoy your day :3c"