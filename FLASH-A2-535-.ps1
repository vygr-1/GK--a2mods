
###   ###   ###   ###   ###   ###   ###

# pwsh.exe

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process pwsh.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

###   ###   ###   ###   ###   ###   ###   ###   ###   ###



#  BASIC VARIABLES AND FUNCTIONS

$ErrorActionPreference  = 'SilentlyContinue'



$date        = Get-Date -format "yyyy-MM-dd"
$dTime       = Get-Date -format "yyyy-MM-dd HH:mm:ss"
$dTimeF      = Get-Date -format "yyMMdd_HHmmss"

$detikS      = 0.1
$detikM      = 0.3
$detikL      = 1
$detikXL     = 2
$detikEXIT   = 1

sleep -s $detikS



Function RKTC1    #  ReadKeyToContinue
{
    Write-Host "`nPress any key to continue..." -NoNewline -ForegroundColor Yellow #Yellow #white #Red #Green #Blue
    $null = $host.UI.RawUI.ReadKey("NoEcho, includeKeyDown")
    Write-Host " "
}



Function RKTC2    #  ReadKeyToContinue
{
    Write-Host "`n" -NoNewline -ForegroundColor Yellow #Yellow #white #Red #Green #Blue
    $null = $host.UI.RawUI.ReadKey("NoEcho, includeKeyDown")
    Write-Host " "
}



Function theEXIT    #  EXIT
{
    Write-Host "`nDone! Press any key to EXIT..." -NoNewline -ForegroundColor Yellow #Yellow #white #Red #Green #Blue
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
$hexfile     = gci -Path $HexDir -File *.hex
$counthex    = ($hexfile).Count



###   ###   ###   ###   ###   ###   ###



Write-Host "`nFLASH ANDURIL2 USING AVRDUDE `n "


$DateHMS1 = get-date -format "yyyy-MM-dd HH.mm.ss" 
Write-Host "`$DateHMS1        : $DateHMS1"

Write-Host "`$PSScriptRoot    : $PSScriptRoot " -ForegroundColor Yellow #Yellow #white #Red #Green #Blue

Write-Host "`$PSCommandPath   : $PSCommandPath "

Write-Host "`$HexDir          : $HexDir" -ForegroundColor Yellow #Yellow #white #Red #Green #Blue



###   ###   ###   ###   ###   ###   ###
###   ###   ###   ###   ###   ###   ###
###   ###   ###   ###   ###   ###   ###



if ($testHexDir -eq $false)    #  there is no hex dir. NO FLASHING!
{

    Write-Host "`nHex dir          :" $testHexDir -ForegroundColor Yellow #Yellow #white #Red #Green #Blue

    Write-Host "There is no 'hex' directory. NO FLASHING!" -ForegroundColor Yellow #Yellow #white #Red #Green #Blue

    theEXIT

}





if ($counthex -eq 0)    #  there is no hex file. NO FLASHING!
{

    Write-Host "`nHex file         :" $counthex -ForegroundColor Yellow #Yellow #white #Red #Green #Blue

    Write-Host "There is no hex file. NO FLASHING!" -ForegroundColor Yellow #Yellow #white #Red #Green #Blue

    theEXIT

}



Write-host "`nThere are" -NoNewline
Write-host " $counthex" -NoNewline -ForegroundColor Yellow #Yellow #white #Red #Green #Blue
Write-Host " hex files"

Write-Host "`nChoose a hex file on the next screen"

RKTC1

$thehexfile   = ($hexfile | out-gridview -outputMode Single)

if ($null -eq $thehexfile)    #  hex file is NULL. NO FLASHING!
{

    $thehexfile      = 'null'

    Write-Host "`nHex file         :" $thehexfile -ForegroundColor Yellow #Yellow #white #Red #Green #Blue

    Write-Host "Test path        :" -NoNewline
    Write-Host " " -NoNewline
    Test-Path -Path "$thehexfile"

    Write-Host "`nThe hex file is $thehexfile. NO FLASHING!" -ForegroundColor Yellow #Yellow #white #Red #Green #Blue

    theEXIT

}



else
{
    Write-Host "`nHex file         :" $thehexfile -ForegroundColor Yellow #Yellow #white #Red #Green #Blue

    Write-Host "Test path        :" -NoNewline
    Write-Host " " -NoNewline
    Test-Path -Path "$thehexfile"

    Write-Host "`nThe hex file is" $thehexfile.Name -ForegroundColor Yellow #Yellow #white #Red #Green #Blue

    RKTC1
    Write-Host "`nFLASH ANDURIL2 ...`n" -ForegroundColor yellow

    .\xAVRDUDE-v8.0\avrdude.exe -p attiny1616 -c serialupdi -P com5 -Uflash:w:$thehexfile

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


