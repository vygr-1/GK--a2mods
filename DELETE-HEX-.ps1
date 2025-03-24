
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

 -ForegroundColor Cyan #Blue #Green #Cyan #Yellow

#>



Function RKTC1 {      #  ReadKeyToContinue

    Write-Host " "
    Write-Host "Press any key to continue..." -NoNewline -ForegroundColor Yellow #Blue #Green #Cyan #Yellow
    $null = $host.UI.RawUI.ReadKey("NoEcho, includeKeyDown")
    Write-Host " "

}



Function RKTC2 {      #  ReadKeyToContinue

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



# 
Write-Host "Delete hex file" -ForegroundColor Cyan #Blue #Green #Cyan #Yellow
# 
Write-Host " "
Write-Host "PSCommandPath    : $PSCommandPath "





if ($testHexDir -eq $false) {    #  there is no hex dir! 

    Write-Host "Hex directory    :" $testHexDir -ForegroundColor Yellow #Blue #Green #Cyan #Yellow
    Write-Host " "
    Write-Host "There is no 'hex' directory." -ForegroundColor Yellow #Blue #Green #Cyan #Yellow

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
    Write-Host "Hex dir is empty. There is no hex file." -ForegroundColor Yellow #Blue #Green #Cyan #Yellow

    EXIT

}





if (($testHexDir -eq $true) -and ($counthex -gt 0)) {    # hex file is available

    Write-Host " "
    $continue = Read-Host "Select one or more hex file to be deleted? (Y/N)"



    if ($continue -eq "N") {

        Write-Host "No!" -ForegroundColor Yellow #Blue #Green #Cyan #Yellow

        EXIT

    }



    $thehexfile   = $hexfile | Out-Gridview -Title "DELETE HEX FILE" -OutputMode Multiple



    if ($null -eq $thehexfile) {    # Selection is NULL. Not processed!

        $thehexfile      = 'null'

        Write-Host " "
        Write-Host "Null. Not processed." -ForegroundColor Yellow #Blue #Green #Cyan

        EXIT

    }





    else {

        Write-Host ""
        Write-Host "Selected hex file:" -ForegroundColor Yellow #Blue #Green #Cyan #Yellow
        $thehexfile.name


        Write-Host ""
        Write-Host "Delete the selectd hex file? (Y/N)" -NoNewline -ForegroundColor Yellow #Blue #Cyan
        $DelHexfile = Read-Host " "


        if ($DelHexfile -ne "Y") {    # "No!" EXIT!

            Write-Host "No!" -ForegroundColor Yellow #Blue #Green #Cyan #Yellow

            EXIT

        }



        if ($DelHexfile -eq "Y") {    # "Yes!" Delete!

            Write-Host "Yes!" -ForegroundColor Yellow #Blue #Green #Cyan #Yellow

            Remove-Item $thehexfile

            sleep -s $detikM
            EXIT

        }

        Write-Host ""
        Write-Host "ERROR.CATCH" -NoNewline -ForegroundColor Cyan #Blue #Cyan #Yellow
        RKTC2

        EXIT

    }



    Write-Host ""
    Write-Host "ERROR.CATCH" -NoNewline -ForegroundColor Cyan #Blue #Cyan #Yellow
    RKTC2

    EXIT

}





Write-Host ""
Write-Host "ERROR.CATCH" -NoNewline -ForegroundColor Cyan #Blue #Cyan #Yellow
RKTC2

EXIT
EXIT
EXIT

###   ###   ###   ###   ###   ###   ###
###   ###   ###   ###   ###   ###   ###
###   ###   ###   ###   ###   ###   ###









































<#



#>


<#



#>


<#



#>




<#


    Write-Host "Hex directory    :" $HexDir -ForegroundColor Yellow #Blue #Green #Cyan #Yellow
    Write-host "Hex file         :" $counthex "file" -ForegroundColor Yellow #Blue #Green #Cyan #Yellow
    Write-Host " "
    $hexfile.name


#>



<#    #  Administrator


# pwsh.exe

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process pwsh.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }


#>



<#   ###   ###   ###   ###   ###   ###   ###



#Yellow #Green #Blue #Cyan

# -ForegroundColor Cyan #Blue #Green #Cyan #Yellow

#Blue #Green #Cyan #Yellow




#>



###   END   
