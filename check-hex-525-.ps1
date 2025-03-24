
###   ###   ###   ###   ###   ###   ###
###   ###   ###   ###   ###   ###   ###
###   ###   ###   ###   ###   ###   ###

# pwsh.exe

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process pwsh.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

###   ###   ###   ###   ###   ###   ###
###   ###   ###   ###   ###   ###   ###
###   ###   ###   ###   ###   ###   ###



#  BASIC VARIABLES AND FUNCTIONS

$ErrorActionPreference  = 'SilentlyContinue'

$date        = Get-Date -format "yyyy-MM-dd"
$dTime       = Get-Date -format "yyyy-MM-dd HH:mm:ss"
$dTimeF      = Get-Date -format "yyMMdd_HHmmss"

$detikS      = 0.1
$detikM      = 0.3
$detikL      = 1
$detikXL     = 2
$detikEXIT   = 0.5



#sleep -s $detikS
# -ForegroundColor Cyan #Blue #Green #Cyan #Yellow



Function RKTC1 {   #  ReadKeyToContinue

    Write-Host "`nPress any key to continue..." -NoNewline -ForegroundColor Yellow #Blue #Green #Cyan #Yellow
    $null = $host.UI.RawUI.ReadKey("NoEcho, includeKeyDown")
    Write-Host " "
}



Function RKTC2 {   #  ReadKeyToContinue

    $null = $host.UI.RawUI.ReadKey("NoEcho, includeKeyDown")
    Write-Host " "
}



Function TheEXIT {   #  EXIT

    Write-Host "`nDone! Press any key to EXIT..." -NoNewline -ForegroundColor Yellow #Blue #Green #Cyan
    $null = $host.UI.RawUI.ReadKey("NoEcho, includeKeyDown")

    Write-Host " EXIT in $detikEXIT second..." -NoNewline -ForegroundColor Yellow #Blue #Green #Cyan
    sleep -s $detikEXIT

    Write-Host " " -NoNewline
    EXIT
}



Function DateHMS {     #  DateHMS:  get-date -format "yyyy-MM-dd HH.mm.ss"

    $DateHMS   = get-date -format "yyyy-MM-dd HH.mm.ss" 

    Write-Host "`nDateHMS          : $DateHMS "

}



###   ###   ###   ###   ###   ###   ###



CD $PSScriptRoot

$HexDir      = "$PSScriptRoot\hex"
$testHexDir  = Test-Path -Path $HexDir
$hexfile     = gci -Path $HexDir -File *.hex
$counthex    = ($hexfile).Count



###   ###   ###   ###   ###   ###   ###



Write-Host ""
Write-Host "Check hex file" -ForegroundColor Cyan #Blue #Green #Cyan #Yellow
Write-Host ""
Write-Host "PSCommandPath    : $PSCommandPath "



###   ###   ###   ###   ###   ###   ###





if ($testHexDir -eq $false) {    #  there is no hex dir! 

    Write-Host "Hex directory    :" $testHexDir -ForegroundColor Yellow #Blue #Green #Cyan #Yellow

    Write-Host ""
    Write-Host "There is no 'hex' directory." -ForegroundColor Yellow #Blue #Green #Cyan #Yellow

}



if ($testHexDir -eq $true) {
    $hexfile     = gci -Path $HexDir -File *.hex
    $counthex    = ($hexfile).Count
}



if (($testHexDir -eq $true) -and ($counthex -eq 0)) {    #  there is a hex dir, but no hex file.

    Write-Host "Hex directory    :" $HexDir -ForegroundColor Yellow #Blue #Green #Cyan #Yellow
    Write-Host "Hex file count   :" $counthex -ForegroundColor Yellow #Blue #Green #Cyan #Yellow

    Write-Host ""
    Write-Host "Hex dir is empty. There is no hex file." -ForegroundColor Yellow #Blue #Green #Cyan #Yellow

}



if (($testHexDir -eq $true) -and ($counthex -gt 0)) {    # hex file is available

    Write-Host "Hex directory    :" $HexDir -ForegroundColor Yellow #Blue #Green #Cyan #Yellow
    Write-host "Hex file count   :" $counthex -ForegroundColor Yellow #Blue #Green #Cyan #Yellow

    Write-Host ""
    Write-Host "Hex file         :" -ForegroundColor Yellow #Blue #Green #Cyan #Yellow #Cyan

    Write-Host $hexfile.name -Separator "`n"

    Write-Host ""
    Write-Host ""
    Write-Host "Options:" -ForegroundColor Yellow #Blue
    Write-Host "   [D]Delete   [F]Flash   [E]Exit  " -NoNewline -ForegroundColor Yellow #Blue
    $HexOption = Read-Host " "

    Write-Host ""

    switch ($HexOption) {

        "D"      {"   [D]Delete"        ;  " "  ; . "$PSScriptRoot\delete-hex-525-.ps1"}

        "F"      {"   [F]Flash"         ;  " "  ; . "$PSScriptRoot\flash-a2-.ps1"}

        "E"      {"   [E]Exit"          ;  " "  ; "   E = EXIT = TheEXIT"}

        default  {"   default: [E]Exit" ;  " "  ; "   E = EXIT = TheEXIT"}

    }


}





Write-Host ""
Write-Host ""



TheEXIT





RKTC1

Write-Host ""
Write-Host "ERROR ???" -NoNewline -ForegroundColor Cyan #Blue #Cyan #Yellow
RKTC2

TheEXIT

EXIT

###   ###   ###   ###   ###   ###   ###
###   ###   ###   ###   ###   ###   ###
###   ###   ###   ###   ###   ###   ###









































<#



#>


###   ###   ###   ###   ###   ###   ###


<#    #  Administrator


# pwsh.exe

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process pwsh.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }


#>




<#


    switch ($HexOption) {

        "D"      {"   [D]Delete"        ;  " "  ; . "$PSScriptRoot\delete-hex-525-.ps1"}

        "F"      {"   [F]Flash"         ;  " "  ; . "$PSScriptRoot\flash-a2-.ps1"}

#       "C"      {"   [C]Compile"       ;  " "  ; "   NOT IMPLEMENTED YET." ; TheEXIT}

        "E"      {"   [E]Exit"          ;  " "  ; "   E = EXIT = TheEXIT"   ; TheEXIT}

        default  {"   default: [E]Exit" ;  " "  ; "   E = EXIT = TheEXIT"   ; TheEXIT}

    }



#>



<#



#>


<#



#>


<#



#>



###   END   
