
###   ###   ###   ###   ###   ###   ###

#  BASIC VARIABLES AND FUNCTIONS

$ErrorActionPreference  = 'SilentlyContinue'



<#    detikS etc.


$date        = Get-Date -format "yyyy-MM-dd"
$dTime       = Get-Date -format "yyyy-MM-dd HH:mm:ss"
$dTimeF      = Get-Date -format "yyMMdd_HHmmss"

$detikS      = 0.1
$detikM      = 0.3
$detikL      = 1
$detikXL     = 2
$detikEXIT   = 0.5


sleep -s $detikS

#>



Function PKTC1 {      #  ReadKeyToContinue

    Write-Host " "
    Write-Host "Press any key to continue..." -NoNewline -ForegroundColor Yellow #Blue #Green #Cyan #Yellow
    $null = $host.UI.RawUI.ReadKey("NoEcho, includeKeyDown")
    Write-Host " "

}



Function PKTC2 {      #  ReadKeyToContinue

    $null = $host.UI.RawUI.ReadKey("NoEcho, includeKeyDown")
    Write-Host " "
}



Function TheEXIT {    #  EXIT

    Write-Host " "
    Write-Host "Done! Press any key to EXIT... " -NoNewline -ForegroundColor Yellow #Blue #Green #Cyan
    $null = $host.UI.RawUI.ReadKey("NoEcho, includeKeyDown")

    Write-Host "EXIT in $detikEXIT second..." -NoNewline -ForegroundColor Yellow #Blue #Green #Cyan
    sleep -s $detikEXIT

    Write-Host " " -NoNewline
    EXIT

}



Function DateHMS {    #  DateHMS:  get-date -format "yyyy-MM-dd HH.mm.ss"

    $DateHMS   = get-date -format "yyyy-MM-dd HH.mm.ss" 

    Write-Host " "
    Write-Host "DateHMS          : $DateHMS "

}



###   ###   ###   ###   ###   ###   ###



CD $PSScriptRoot

$HexDir      = "$PSScriptRoot\hex"
$testHexDir  = Test-Path -Path $HexDir
$hexfile     = gci -Path $HexDir -File *.hex
$counthex    = ($hexfile).Count



###   ###   ###   ###   ###   ###   ###



Write-Host "Flash Anduril using AVRDUDE" -ForegroundColor Cyan #Blue #Green #Cyan #Yellow
Write-Host " "
Write-Host "PSCommandPath    : $PSCommandPath "



###   ###   ###   ###   ###   ###   ###   ###   ###



if ($testHexDir -eq $false) {    #  there is no hex dir!

    Write-Host "Hex directory    :" $testHexDir -ForegroundColor Yellow #Blue #Green #Cyan #Yellow
    Write-Host " "
    Write-Host "'hex' directory not found." -ForegroundColor Yellow #Blue #Green #Cyan #Yellow

    EXIT

}





if ($testHexDir -eq $true) {

    $hexfile     = gci -Path $HexDir -File *.hex
    $counthex    = ($hexfile).Count

}



if (($testHexDir -eq $true) -and ($counthex -eq 0)) {    #  there is a hex dir, but no hex file.

    Write-Host "Hex directory    :" $HexDir -ForegroundColor Yellow #Blue #Green #Cyan #Yellow
    Write-Host "Hex file count   :" $counthex -ForegroundColor Yellow #Blue #Green #Cyan #Yellow
    Write-Host " "
    Write-Host "'hex' directory is empty." -ForegroundColor Yellow #Blue #Green #Cyan #Yellow

    EXIT

}





if (($testHexDir -eq $true) -and ($counthex -gt 0)) {    # hex file is available

    Write-Host " "
    Write-Host "Select a hex file from the list? " -NoNewline -ForegroundColor Yellow #Blue #Green #Cyan
    $continue = Read-Host "[n]no, [Enter]yes"


    if ($continue -eq "n") {

        Write-Host "No!" -ForegroundColor Yellow #Blue #Green #Cyan #Yellow
        EXIT

    }



    $thehexfile   = $hexfile | Out-Gridview -Title "FLASH ANDURIL2 HEX FILE" -OutputMode Single



    if ($null -eq $thehexfile) {    #  Selection is NULL. Not processed!

        $thehexfile      = 'null'

        Write-Host ""
        Write-Host "Null. Not processed." -ForegroundColor Yellow #Blue #Green #Cyan

        EXIT

    }



    else {

        Write-Host ""
        Write-Host "Selected file    :" $thehexfile -ForegroundColor Yellow #Blue #Green #Cyan #Yellow

        Write-Host "Test path        : " -NoNewline -ForegroundColor Yellow #Blue #Green #Cyan #Yellow
        Write-Host (Test-Path -Path "$thehexfile") -ForegroundColor Yellow #Blue #Green #Cyan #Yellow

        Write-Host ""
        Write-Host "Flash Anduril2... " -NoNewline -ForegroundColor Yellow #Blue #Green #Cyan #Yellow
        PKTC2

        Write-Host " "

        .\xAVRDUDE-v8.0\avrdude.exe -p attiny1616 -c serialupdi -P com5 -Uflash:w:$thehexfile

        EXIT

    }

}




EXIT
EXIT
EXIT






###   ###   ###   ###   ###   ###   ###
###   ###   ###   ###   ###   ###   ###
###   ###   ###   ###   ###   ###   ###









































<#



#>




<#    Hex directory etc.


    #  Write-Host "Hex directory    :" $HexDir -ForegroundColor Yellow #Blue #Green #Cyan #Yellow
    #  Write-host "Hex file         :" $counthex "file" -ForegroundColor Yellow #Blue #Green #Cyan #Yellow
    #  Write-Host " "
    #  $hexfile.name


#>



<#



#>

<#



#>





###   END   


