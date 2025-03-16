 
###   ###   ###   ###   ###   ###   ###

# 2025-02-06

# 2025-02-09

# 2025/02/10 

# 2025-02-22

# 2025/02/25 

# 2025-03-09

# 2025-03-16

# 2025-03-17



###   ###   ###   ###   ###   ###   ###

# pwsh.exe

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process pwsh.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

###   ###   ###   ###   ###   ###   ###



#  BASIC VARIABLES AND FUNCTIONS

$ErrorActionPreference  = 'SilentlyContinue'
$ProgressPreference     = 'SilentlyContinue'



$date        = Get-Date -format "yyyy-MM-dd"
$dTime       = Get-Date -format "yyyy-MM-dd HH:mm:ss"
$dTimeF      = Get-Date -format "yyMMdd_HHmmss"

$detikS      = 0.1
$detikM      = 0.3
$detikL      = 1
$detikXL     = 2
$detikEXIT   = 1

sleep -s $detikS



Function RKTC1      #  ReadKeyToContinue
{
    Write-Host "`nPress any key to continue..." -NoNewline -ForegroundColor Yellow #Yellow #white #Red #Green #Blue
    $null = $host.UI.RawUI.ReadKey("NoEcho, includeKeyDown")
    Write-Host " "
}



Function RKTC2      #  ReadKeyToContinue
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



Write-Host "`n###   ###   ###   ###   ###   ###   ### `n"
Write-Host "ANDURIL2 WITH WSL `n" -ForegroundColor Yellow #Yellow #white #Red #Green #Blue


$DateHMS1 = get-date -format "yyyy-MM-dd HH.mm.ss" 
Write-Host "`$DateHMS1        : $DateHMS1"

Write-Host "`$PSScriptRoot    : $PSScriptRoot " -ForegroundColor Yellow #Yellow #white #Red #Green #Blue

Write-Host "`$PSCommandPath   : $PSCommandPath "



###   ###   ###   ###   ###   ###   ###
###   ###   ###   ###   ###   ###   ###
###   ###   ###   ###   ###   ###   ###



sleep -s $detikS
Write-Host "`nWSL: " -ForegroundColor Yellow #Yellow #white #Red #Green #Blue
wsl -l -v



sleep -s $detikS
Write-Host "`nDFP" -ForegroundColor Cyan #Blue #Green #Cyan #Red #Yellow #White #Gray

$GetDfp = "$PSScriptRoot\DFP-325-.ps1"   # This path works. Use "$PSScriptRoot"

# Dot sourcing the DFP script
. $GetDfp    # "waiting" for info if dfpStatus = $true



sleep -s $detikS



if ($dfpStatus -eq $true)    #  Let's build Anduril!
{

    CD $PSScriptRoot

    sleep -s $detikS
    Write-Host "`n`n`nANDURIL MAKE " -ForegroundColor Cyan #Yellow #white #Red #Green #Blue #Cyan

    $MakeHelp = "$PSScriptRoot\ANDURIL-MAKE-.ps1"    #  This path works. Use "$PSScriptRoot"

    # Dot sourcing the ANDURIL-MAKE script
    . $MakeHelp     #  ANDURIL-MAKE script



    ###   ###   ###   ###   ###   ###   ###



    if ($null -eq $theTASK)    #  TASK is NULL. EXIT!
    {
        sleep -s $detikS
        Write-Host "`nThe TASK is null. Not processed! `n`n" -ForegroundColor Yellow #Yellow #white #Red #Green #Blue

        theEXIT
    }



    else
    {
        sleep -s $detikS
        Write-Host "`nWorking on it... `n`n" -ForegroundColor Yellow #Yellow #white #Red #Green #Blue

        wsl ./make $theTASK
    }

}





else     # (dfpStatus NOT $true)    # then NO BUILD !
{
    sleep -s $detikS
    Write-Host "`nNO DFP. NO BUILD!" -ForegroundColor Yellow #Yellow #white #Red #Green #Blue

    sleep -s $detikS
    theEXIT
}



sleep -s $detikS
Write-Host "`n`nWSL: " -ForegroundColor Yellow #Yellow #white #Red #Green #Blue
wsl -l -v

sleep -s $detikS
$DateHMS2= get-date -format "yyyy-MM-dd HH.mm.ss"
Write-Host "`n`$DateHMS2        : $DateHMS2 " -NoNewline

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


