# Posi+ive's script to download all of the My Little Pony G5 episodes from YayPonies.
# The ypdl.gdn mirror doesn't support resuming, so I have to play around to avoid
# redownloading a finished file. We'll see how it goes.

# Version 0.2

Write-Host "Hey There!"

function S1 {
    # Test and initialize directory
    $path = Test-Path '.\Chapter 1'
    if ($path -eq "True") {
        Write-Host "Seems like the Chapter 1 directory already exists."
    }
    else {
        Write-Host "Seems like the Chapter 1 directory doesn't exist. Creating now."
        New-Item -Name "Chapter 1" -ItemType Directory | Out-Null # Suppress output when creating directory
    }
    Write-Host "Downloading Chapter 1 now..."
    Invoke-WebRequest -Uri "https://ypdl.gdn/files/YP-1N-G5-MakeYourMark-V2.mkv" -OutFile "Chapter 1\My Little Pony Make Your Mark - S01E01.mkv"
    Write-Host "Chapter 1 has been downloaded. Nice.`n"
}

function S2 {
    $path = Test-Path '.\Chapter 2'
    if ($path -eq "True") {
        Write-Host "Seems like the Chapter 2 directory already exists."
    }
    else {
        Write-Host "Seems like the Chapter 2 directory doesn't exist. Creating now."
        New-Item -Name "Chapter 2" -ItemType Directory | Out-Null
    }

    Write-Host "Downloading Chapter 2 now..."
    foreach ($y in 1..8){
		# The episodes contain leading zeroes so we pad the numbers with one 0 here.
		$y = "$y".PadLeft(2, "0")
		# Initiate the download
		Invoke-WebRequest -Uri "https://ypdl.gdn/files/YP-1N-MYM-02x$y.mkv" -OutFile "Chapter 2\My Little Pony Make Your Mark - S02E$y.mkv"
	}

	Write-Host "Chapter 2 has been downloaded. Nice.`n"
}

function S3 {
    $path = Test-Path '.\Chapter 3'
    if ($path -eq "True") {
        Write-Host "Seems like the Chapter 3 directory already exists."
    }
    else {
        Write-Host "Seems like the Chapter 3 directory doesn't exist. Creating now."
        New-Item -Name "Chapter 3" -ItemType Directory | Out-Null
    }
    Write-Host "Downloading Chapter 3 now..."
    Invoke-WebRequest -Uri https://ypdl.gdn/files/YP-1N-MYM-03x01.mkv -OutFile "Chapter 3\My Little Pony Make Your Mark - S03E01.mkv"
    Write-Host "Chapter 3 has been downloaded. Nice.`n"
}

function S4 {
    $path = Test-Path '.\Chapter 4'

    if ($path -eq "True") {
        Write-Host "Seems like the Chapter 4 directory already exists."
    }
    else {
        Write-Host "Seems like the Chapter 4 directory doesn't exist. Creating now."
        New-Item -Name "Chapter 4" -ItemType Directory | Out-Null
    }

    Write-Host "Downloading Chapter 4 now..."
    foreach ($y in 1..4) {
        $y = "$y".PadLeft(2, "0")
        Invoke-WebRequest -Uri https://ypdl.gdn/files/YP-1N-MYM-04x$y.mkv -OutFile "Chapter 4\My Little Pony Make Your Mark - S04E$y.mkv"
    }

    foreach ($y in 5..7) { # Episode 5 to 7 has a -FIX postfix in their filename
        $y = "$y".PadLeft(2, "0")
        Invoke-WebRequest -Uri https://ypdl.gdn/files/YP-1N-MYM-04x$y-FIX.mkv -OutFile "Chapter 4\My Little Pony Make Your Mark - S04E$y.mkv"
    }
    Write-Host "Chapter 4 has been downloaded. Nice.`n"
}

function S5 {
    $path = Test-Path '.\Chapter 5'

    if ($path -eq "True") {
        Write-Host "Seems like the Chapter 5 directory already exists."
    }
    else {
        Write-Host "Seems like the Chapter 5 directory doesn't exist. Creating now."
        New-Item -Name "Chapter 5" -ItemType Directory | Out-Null
    }
    
    Write-Host "Downloading Chapter 5 now..."
    foreach ($y in 1..6) {
        $y = "$y".PadLeft(2, "0")
        Invoke-WebRequest -Uri https://ypdl.gdn/files/YP-1N-MYM-05x$y.mkv -OutFile "Chapter 5\My Little Pony Make Your Mark - S05E$y.mkv"
    }
    Write-Host "Chapter 5 has been downloaded. Nice.`n"
}

function S6 {
    $path = Test-Path '.\Chapter 6'

    if ($path -eq "True") {
        Write-Host "Seems like the Chapter 6 directory already exists."
    }
    else {
        Write-Host "Seems like the Chapter 6 directory doesn't exist. Creating now."
        New-Item -Name "Chapter 6" -ItemType Directory | Out-Null
    }
    
    Write-Host "Downloading Chapter 6 now..."
    foreach ($y in 1..4) {
        $y = "$y".PadLeft(2, "0")
        Invoke-WebRequest -Uri https://ypdl.gdn/files/YP-1N-MYM-06x$y.mkv -OutFile "Chapter 5\My Little Pony Make Your Mark - S06E$y.mkv"
    }
    Write-Host "Chapter 6 has been downloaded. Nice.`n"
}

function SA {
    Write-Host "Downloading all chapters now...`n"
    S1
    S2
    S3
    S4
    S5
    S6
    Write-Host "All chapters downloaded. Nice.`n"
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
    while (1 -eq 1) {
        $x = Read-Host
        if ($x -eq "1") {
            S1
            main
        }
        elseif ($x -eq "2") {
            S2
            main
        }
        elseif ($x -eq "3") {
            S3
            main
        }
        elseif ($x -eq "4") {
            S4
            main
        }
        elseif ($x -eq "5") {
            S5
            main
        }
        elseif ($x -eq "6") {
            S6
            main
        }
        elseif ($x -eq "0") {
            SA
            Write-Host "Bye!"
            Exit
        }
        elseif ($x -eq "e") {
            Write-Host "Bye!"
            Exit
        }
        else {
            Write-Host "Wrong option buddy."
            Continue
        }
    }
}


main