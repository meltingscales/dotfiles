Push-Location ~/Git/

foreach ($folder in (get-item "./*")){
    write-host "git fetch --all <= [$(split-path -path $folder -leaf)]"
    Push-Location $folder
    git fetch --all
    Pop-Location
}


Pop-Location