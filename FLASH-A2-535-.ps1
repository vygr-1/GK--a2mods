
###   ###   ###   ###   ###   ###   ###

# pwsh.exe

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process pwsh.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

###   ###   ###   ###   ###   ###   ###   ###   ###   ###



$date        = Get-Date -format "yyyy-MM-dd"
$dTime       = Get-Date -format "yyyy-MM-dd HH:mm:ss"
$dTimeF      = Get-Date -format "yyMMdd_HHmmss"

$detikS      = 0.1
$detikM      = 0.3
$detikL      = 1
$detikXL     = 2
$detikEXIT   = 1



Function RKTC    #  ReadKeyToContinue
{

    Write-Host "`n  Press any key to continue..." -NoNewline -ForegroundColor Yellow #Yellow #white #Red #Green #Blue
    $null = $host.UI.RawUI.ReadKey("NoEcho, includeKeyDown")
    Write-Host ""
}



Function RKTC2    #  ReadKeyToContinue
{
    Write-Host "`n  " -NoNewline -ForegroundColor Yellow #Yellow #white #Red #Green #Blue
    $null = $host.UI.RawUI.ReadKey("NoEcho, includeKeyDown")
    Write-Host "  "
}



Function theEXIT    #  EXIT
{
    Write-Host "`n  Done! Press any key to EXIT..." -NoNewline -ForegroundColor Yellow #Yellow #white #Red #Green #Blue
    $null = $host.UI.RawUI.ReadKey("NoEcho, includeKeyDown")

    Write-Host " EXIT in $detikEXIT second..." -NoNewline -ForegroundColor Yellow #Yellow #white #Red #Green #Blue
    sleep -s $detikEXIT

    Write-Host " " -NoNewline
    EXIT
}



###   ###   ###   ###   ###   ###   ###



CD $PSScriptRoot

$HexDir      = "$PSScriptRoot\hex"
$testHexDir  = Test-Path -Path $HexDir
$hexfile     = gci -Path $HexDir -File *.hex -errorAction SilentlyContinue
$counthex    = ($hexfile).Count



###   ###   ###   ###   ###   ###   ###



Write-Host "`n  FLASH ANDURIL2 USING AVRDUDE `n "

$DateHMS = get-date -format "yyyy-MM-dd HH.mm.ss" 
Write-Host "  `$DateHMS         : $DateHMS"

Write-Host "  `$PSScriptRoot    :" -NoNewline
Write-Host " $PSScriptRoot " -ForegroundColor Yellow #Yellow #white #Red #Green #Blue

Write-Host "  `$PSCommandPath   : $PSCommandPath  "

Write-Host "  `$HexDir          :" -NoNewline
Write-Host " $HexDir" -ForegroundColor Yellow #Yellow #white #Red #Green #Blue



###   ###   ###   ###   ###   ###   ###
###   ###   ###   ###   ###   ###   ###
###   ###   ###   ###   ###   ###   ###



if ($testHexDir -eq $false)    #  there is no hex dir. NO FLASHING!
{

    Write-Host "`n  Hex dir          :" $testHexDir -ForegroundColor Yellow #Yellow #white #Red #Green #Blue

    Write-Host "  There is no 'hex' directory. NO FLASHING!" -ForegroundColor Yellow #Yellow #white #Red #Green #Blue

    theEXIT

}





if ($counthex -eq 0)    #  there is no hex file. NO FLASHING!
{

    Write-Host "`n  Hex file         :" $counthex -ForegroundColor Yellow #Yellow #white #Red #Green #Blue

    Write-Host "  There is no hex file. NO FLASHING!" -ForegroundColor Yellow #Yellow #white #Red #Green #Blue

    theEXIT

}





Write-host "`n  There are" -NoNewline
Write-host " $counthex" -NoNewline -ForegroundColor Yellow #Yellow #white #Red #Green #Blue
Write-Host " hex files"


Write-Host "`n  Choose a hex file on the next screen"

RKTC2

Write-host "  " -NoNewline

$thehexfile   = ($hexfile | out-gridview -outputMode Single)



if ($null -eq $thehexfile)    #  hex file is NULL. NO FLASHING!
{

    $thehexfile      = 'null'

    Write-Host "Hex file         :" $thehexfile -ForegroundColor Yellow #Yellow #white #Red #Green #Blue

    Write-Host "  Test path        :" -NoNewline
    Write-Host " " -NoNewline
    Test-Path -Path "$thehexfile"

    Write-Host "`n  The hex file is $thehexfile. NO FLASHING!" -ForegroundColor Yellow #Yellow #white #Red #Green #Blue

    theEXIT

}



else
{

    Write-Host "Hex file         :" $thehexfile -ForegroundColor Yellow #Yellow #white #Red #Green #Blue

    Write-Host "  Test path        :" -NoNewline
    Write-Host " " -NoNewline
    Test-Path -Path "$thehexfile"

    Write-Host "`n  The hex file is" $thehexfile.Name -ForegroundColor Yellow #Yellow #white #Red #Green #Blue


    #    
    RKTC2
    Write-Host "  FLASH ANDURIL2 ..." -ForegroundColor yellow


    Write-Host "`n  "
    .\xAVRDUDE-v8.0\avrdude.exe -p attiny1616 -c serialupdi -P com5 -Uflash:w:$thehexfile


    Write-Host "`n  "
    theEXIT

}



theEXIT



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





###   END   


