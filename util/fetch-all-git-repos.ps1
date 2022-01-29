$gitdir="~/Git/"

Push-Location $gitdir

foreach ($folder in (Get-ChildItem -Directory $gitdir)){

    $currFolder=$(split-path -path $folder -leaf)

    Push-Location $folder

    if(test-path "./.git/"){
        write-host "git fetch --all <= [$currFolder]"
            git fetch --all
    } else {
        write-host "Not a git repo  -- [$currFolder]"
    }

    Pop-Location    
}

Pop-Location