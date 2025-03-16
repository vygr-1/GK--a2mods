 
###   ###   ###   ###   ###   ###   ###

# 2025-02-06

# 2025-02-09

# 2025/02/10 

# 2025-02-22

# 2025/02/25 

# 2025-03-09

# 2025-03-16



###   ###   ###   ###   ###   ###   ###

# pwsh.exe


<#    #  ADMINISTRATOR


if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process pwsh.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }


#>


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



###   ###   ###   ###   ###   ###   ###



Write-Host "`n###   ###   ###   ###   ###   ###   ### `n"
Write-Host "FOREGROUNDCOLOR `n" -ForegroundColor Yellow #Yellow #white #Red #Green #Blue

sleep -s $detikS
$DateHMS1 = get-date -format "yyyy-MM-dd HH.mm.ss" 
Write-Host "`$DateHMS1        : $DateHMS1"

sleep -s $detikS
Write-Host "`$PSScriptRoot    : $PSScriptRoot " -ForegroundColor Yellow #Yellow #white #Red #Green #Blue

sleep -s $detikS
Write-Host "`$PSCommandPath   : $PSCommandPath "



###   ###   ###   ###   ###   ###   ###



#    -ForegroundColor Yellow #Blue #Green #Cyan #Red #Magenta #Yellow #White    #Black #DarkBlue #DarkGreen #DarkCyan #DarkRed #DarkMagenta #DarkYellow #Gray #DarkGray

#    -ForegroundColor Yellow #Black #DarkBlue #DarkGreen #DarkCyan #DarkRed #DarkMagenta #DarkYellow #Gray #DarkGray

#    -ForegroundColor Yellow #Blue #Green #Cyan #Red #Magenta #Yellow #White

#    -ForegroundColor Yellow #Blue #Green #Cyan #Red #Magenta #Yellow

#   Black
#   DarkBlue
#   DarkGreen
#   DarkCyan
#   DarkRed
#   DarkMagenta
#   DarkYellow
#   Gray
#   DarkGray
#   Blue
#   Green
#   Cyan
#   Red
#   Magenta
#   Yellow
#   White



Write-Host "`n "

Write-Host " COLOR: Blue  " -ForegroundColor Blue   #Blue #Green #Cyan #Red #Yellow #Gray

Write-Host " COLOR: Green " -ForegroundColor Green  #Blue #Green #Cyan #Red #Yellow #Gray

Write-Host " COLOR: Cyan  " -ForegroundColor Cyan   #Blue #Green #Cyan #Red #Yellow #Gray

Write-Host " COLOR: Yellow" -ForegroundColor Yellow #Blue #Green #Cyan #Red #Yellow #Gray

Write-Host " COLOR: Gray  " -ForegroundColor Gray   #Blue #Green #Cyan #Red #Yellow #White #Gray

Write-Host " COLOR: White " -ForegroundColor White  #Blue #Green #Cyan #Red #Magenta #Yellow #White #Gray

Write-Host " COLOR: DarkYellow" -ForegroundColor DarkYellow #Blue #Green #Cyan #Red #Magenta #Yellow #White    #Black #DarkBlue #DarkGreen #DarkCyan #DarkRed #DarkMagenta #DarkYellow #Gray #DarkGray



Write-Host "`n "

Write-Host "FOREGROUND COLORS: " 

Write-Host "`n "

Write-Host "Blue "     -ForegroundColor Blue #Blue #Green #Cyan #Red #Magenta #Yellow

Write-Host "Green "    -ForegroundColor Green #Blue #Green #Cyan #Red #Magenta #Yellow

Write-Host "Cyan "     -ForegroundColor Cyan #Blue #Green #Cyan #Red #Magenta #Yellow

Write-Host "Red "      -ForegroundColor Red #Blue #Green #Cyan #Red #Magenta #Yellow

Write-Host "Magenta "  -ForegroundColor Magenta #Blue #Green #Cyan #Red #Magenta #Yellow

Write-Host "Yellow "   -ForegroundColor Yellow #Blue #Green #Cyan #Red #Magenta #Yellow

Write-Host "White "    -ForegroundColor white #Blue #Green #Cyan #Red #Magenta #Yellow #White

Write-Host "`n "

Write-Host "White "

Write-Host "`n "

Write-Host "Black        "  -ForegroundColor Black #Black #DarkBlue #DarkGreen #DarkCyan #DarkRed #DarkMagenta #DarkYellow #Gray #DarkGray

Write-Host "DarkBlue     "  -ForegroundColor DarkBlue #Black #DarkBlue #DarkGreen #DarkCyan #DarkRed #DarkMagenta #DarkYellow #Gray #DarkGray

Write-Host "DarkGreen    "  -ForegroundColor DarkGreen #Black #DarkBlue #DarkGreen #DarkCyan #DarkRed #DarkMagenta #DarkYellow #Gray #DarkGray

Write-Host "DarkCyan     "  -ForegroundColor DarkCyan #Black #DarkBlue #DarkGreen #DarkCyan #DarkRed #DarkMagenta #DarkYellow #Gray #DarkGray

Write-Host "DarkRed      "  -ForegroundColor DarkRed #Black #DarkBlue #DarkGreen #DarkCyan #DarkRed #DarkMagenta #DarkYellow #Gray #DarkGray

Write-Host "DarkMagenta  "  -ForegroundColor DarkMagenta #Black #DarkBlue #DarkGreen #DarkCyan #DarkRed #DarkMagenta #DarkYellow #Gray #DarkGray

Write-Host "DarkYellow   "  -ForegroundColor DarkYellow #Black #DarkBlue #DarkGreen #DarkCyan #DarkRed #DarkMagenta #DarkYellow #Gray #DarkGray

Write-Host "Gray         "  -ForegroundColor Gray #Black #DarkBlue #DarkGreen #DarkCyan #DarkRed #DarkMagenta #DarkYellow #Gray #DarkGray

Write-Host "DarkGray     "  -ForegroundColor DarkGray #Black #DarkBlue #DarkGreen #DarkCyan #DarkRed #DarkMagenta #DarkYellow #Gray #DarkGray

Write-Host "`n "



theEXIT



<#    #  ForegroundColor


-ForegroundColor

Specifies the text color. There is no default. The acceptable values for this parameter are:

Black
DarkBlue
DarkGreen
DarkCyan
DarkRed
DarkMagenta
DarkYellow
Gray
DarkGray

Blue
Green
Cyan
Red
Magenta
Yellow
White


#>



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


