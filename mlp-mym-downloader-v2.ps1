# Posi+ive's script to download all of the My Little Pony G5 episodes from YayPonies.
# The ypdl.gdn mirror doesn't support resuming, so I have to play around to avoid
# redownloading a finished file. We'll see how it goes.
# ^ Haven't implemented btw.

# Version 0.3

Write-Host "Hey there!"
Start-Sleep -Seconds 1

function season ($s, $e) {
    $path = Test-Path ".\Chapter $s"

    if ($path -eq $true) {
        Write-Host "Seems like the Chapter $s directory already exists."
    }
    else {
        Write-Host "Seems like the Chapter $s directory doesn't exist. Creating now."
        New-Item -Name "Chapter $s" -ItemType Directory | Out-Null
    }
    
    switch ($s) {

        '1' { # Chapter 1 has a completely different filename so I had to.
            Write-Host "Downloading Chapter $s now..."
            $ee = "$y".PadLeft(2, "0")
            $ss = "$s".PadLeft(2, "0")
            Invoke-WebRequest -Uri "https://ypdl.gdn/files/YP-1N-G5-MakeYourMark-V2.mkv" -OutFile "Chapter $s\My Little Pony Make Your Mark - S${ss}E${ee}.mkv"
        }

        '4' { # Episode 5 to 7 has a -FIX postfix in their filename. Idk if there's a better solution.
            Write-Host "Downloading Chapter $s now..."
            foreach ($y in 1..4) {
                $ee = "$y".PadLeft(2, "0")
                $ss = "$s".PadLeft(2, "0")
                Invoke-WebRequest -Uri https://ypdl.gdn/files/YP-1N-MYM-${ss}x${ee}.mkv -OutFile "Chapter $s\My Little Pony Make Your Mark - S${ss}E${ee}.mkv"
            }
        
            foreach ($y in 5..7) {
                $ee = "$y".PadLeft(2, "0")
                $ss = "$s".PadLeft(2, "0")
                Invoke-WebRequest -Uri https://ypdl.gdn/files/YP-1N-MYM-${ss}x${ee}-FIX.mkv -OutFile "Chapter $s\My Little Pony Make Your Mark - S${ss}E${ee}.mkv"
            }
        }

        Default {
            Write-Host "Downloading Chapter $s now..."
            foreach ($y in 1..$e) {
                $ee = "$y".PadLeft(2, "0")
                $ss = "$s".PadLeft(2, "0")
                Invoke-WebRequest -Uri "https://ypdl.gdn/files/YP-1N-MYM-${ss}x${ee}.mkv" -OutFile "Chapter $s\My Little Pony Make Your Mark - S${ss}E${ee}.mkv"
            }
        }
    }
    Write-Host "Chapter $s has been downloaded. Nice.`n"
}
function main {
    Write-Host "Please choose which season you want to download."
    Write-Host @"
1 - Season 1
2 - Season 2
3 - Season 3
4 - Season 4
5 - Season 5
6 - Season 6
0 - All Seasons
e - Exit
"@
    while ($true) {
        $x = Read-Host
        switch ($x) {

            '1' {season 1 1
                main}
            '2' {season 2 8
                main}
            '3' {season 3 1
                main}
            '4' {season 4 7
                main}
            '5' {season 5 6
                main}
            '6' {season 6 4
                main}

            '0' {season 1 1
                season 2 8
                season 3 1
                season 4 7
                season 5 6
                season 6 4
                Write-Host "All chapter has been downloaded. Nice.`n"}

            'e' {Write-Host "Bye!"
                Exit}

            Default {Write-Host "Wrong input buddy."}
        }
    }
}

main