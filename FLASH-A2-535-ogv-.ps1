
###   ###   ###   ###   ###   ###   ###

# pwsh.exe

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process pwsh.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

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



Function DateHMS      #  DateHMS:  get-date -format "yyyy-MM-dd HH.mm.ss"
{

    $DateHMS   = get-date -format "yyyy-MM-dd HH.mm.ss" 

    sleep -s $detikS

    Write-Host "`nDateHMS          : $DateHMS "

}



###   ###   ###   ###   ###   ###   ###



CD $PSScriptRoot



###   ###   ###   ###   ###   ###   ###



Write-Host "`nFLASH ANDURIL2 USING AVRDUDE `n "


$DateHMS1 = get-date -format "yyyy-MM-dd HH.mm.ss" 
Write-Host "DateHMS          : $DateHMS1"
Write-Host "`$PSScriptRoot    : $PSScriptRoot " -ForegroundColor Yellow #Yellow #white #Red #Green #Blue
Write-Host "`$PSCommandPath   : $PSCommandPath "



###   ###   ###   ###   ###   ###   ###
###   ###   ###   ###   ###   ###   ###
###   ###   ###   ###   ###   ###   ###





$HexDir      = "$PSScriptRoot\hex"
$testHexDir  = Test-Path -Path $HexDir





if ($testHexDir -eq $false)    #  there is no hex dir. NO FLASHING!
{
    Write-Host "`nHex dir          :" $testHexDir -ForegroundColor Yellow #Yellow #white #Red #Green #Blue
    Write-Host "There is no 'hex' directory. NO FLASHING!" -ForegroundColor Yellow #Yellow #white #Red #Green #Blue

    DateHMS
    theEXIT

}






if ($testHexDir -eq $true)
{
    $hexfile     = gci -Path $HexDir -File *.hex
    $counthex    = ($hexfile).Count

}







if (($testHexDir -eq $true) -and ($counthex -eq 0))    #  there is a hex dir, but no hex file: NO FLASHING!
{
    Write-Host "`nHex file count   :" $counthex -ForegroundColor Yellow #Yellow #Green #Blue
    Write-Host "`nThere is no hex file. NO FLASHING!" -ForegroundColor Yellow #Yellow #white #Red #Green #Blue

    DateHMS

    theEXIT

}








if (($testHexDir -eq $true) -and ($counthex -gt 0))    # hex file is available
{

    Write-host "`nHex file count   :" $counthex -ForegroundColor Yellow #Yellow #Green #Blue
    Write-Host "`nSelect a hex file from the next list..." -ForegroundColor Cyan #Yellow #Green #Blue #Cyan



    RKTC1


    $thehexfile   = ($hexfile | out-gridview -outputMode Single -Title 'FLASH ANDURIL2')


}











if ($null -eq $thehexfile)    #  hex file is NULL. NO FLASHING!
{

    $thehexfile      = 'null'

    Write-Host "`nSelected file    :" $thehexfile -ForegroundColor Yellow #Yellow #white #Red #Green #Blue #Cyan

    Write-Host "Test path        : " (Test-Path -Path "$thehexfile") -ForegroundColor Yellow

    Write-Host "`ninvalid selection. NO FLASHING!" -ForegroundColor Yellow #Yellow #Green #Blue

    DateHMS

    theEXIT

}



else
{

    Write-Host "`nSelected file    :" $thehexfile -ForegroundColor Yellow #Yellow #white #Red #Green #Blue #Cyan

    Write-Host "Test path        :" (Test-Path -Path "$thehexfile") -ForegroundColor Yellow

    Write-Host "`nFLASH ANDURIL2..." -ForegroundColor Cyan #Yellow #white #Red #Green #Blue #Cyan



    RKTC1

    Write-Host " "

    CD $PSScriptRoot

    .\xAVRDUDE-v8.0\avrdude.exe -p attiny1616 -c serialupdi -P com5 -Uflash:w:$thehexfile



    DateHMS

    theEXIT

}



DateHMS

theEXIT





###   ###   ###   ###   ###   ###   ###
###   ###   ###   ###   ###   ###   ###
###   ###   ###   ###   ###   ###   ###








































EXIT
EXIT
EXIT




<#



#>




<#



#>



<#



#>



<#



#>



<#



#>





###   END   


