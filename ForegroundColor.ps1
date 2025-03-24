 
###   ###   ###   ###   ###   ###   ###

# 2025-03-16

# 2025-03-22



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



Write-Host "`nFOREGROUNDCOLOR `n" -ForegroundColor Yellow #Yellow #white #Red #Green #Blue

sleep -s $detikS
$DateHMS   =   get-date -format "yyyy-MM-dd HH.mm.ss" 
Write-Host "DateHMS          : $DateHMS"
Write-Host "`$PSCommandPath   : $PSCommandPath" -ForegroundColor Yellow #Yellow #white #Red #Green #Blue



###   ###   ###   ###   ###   ###   ###



#    -ForegroundColor Yellow #Blue #Green #Cyan #Red #Magenta #Yellow #White    #Black #DarkBlue #DarkGreen #DarkCyan #DarkRed #DarkMagenta #DarkYellow #Gray #DarkGray

#    -ForegroundColor Yellow #Black #DarkBlue #DarkGreen #DarkCyan #DarkRed #DarkMagenta #DarkYellow #Gray #DarkGray

#    -ForegroundColor Yellow #Blue #Green #Cyan #Red #Magenta #Yellow #White

#    -ForegroundColor Yellow #Blue #Green #Cyan #Red #Magenta #Yellow

#    -ForegroundColor Yellow #Blue #Green #Cyan #Yellow



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

Write-Host "    COLOR: Blue  " -ForegroundColor Blue   #Blue #Green #Cyan #Yellow #Gray

Write-Host "    COLOR: Green " -ForegroundColor Green  #Blue #Green #Cyan #Yellow #Gray

Write-Host "    COLOR: Cyan  " -ForegroundColor Cyan   #Blue #Green #Cyan #Yellow #Gray

Write-Host "    COLOR: Yellow" -ForegroundColor Yellow #Blue #Green #Cyan #Yellow #Gray

Write-Host "    COLOR: Gray  " -ForegroundColor Gray   #Blue #Green #Cyan #Yellow #Gray

Write-Host "    COLOR: White " -ForegroundColor White  #Blue #Green #Cyan #Yellow #White

Write-Host "    COLOR: DarkYellow" -ForegroundColor DarkYellow #Blue #Green #Cyan #Red #Magenta #Yellow #White    #Black #DarkBlue #DarkGreen #DarkCyan #DarkRed #DarkMagenta #DarkYellow #Gray #DarkGray



Write-Host "`n "

Write-Host "    Blue "     -ForegroundColor Blue    #Blue #Green #Cyan #Red #Magenta #Yellow

Write-Host "    Green "    -ForegroundColor Green   #Blue #Green #Cyan #Red #Magenta #Yellow

Write-Host "    Cyan "     -ForegroundColor Cyan    #Blue #Green #Cyan #Red #Magenta #Yellow

Write-Host "    Red "      -ForegroundColor Red     #Blue #Green #Cyan #Red #Magenta #Yellow

Write-Host "    Magenta "  -ForegroundColor Magenta #Blue #Green #Cyan #Red #Magenta #Yellow

Write-Host "    Yellow "   -ForegroundColor Yellow  #Blue #Green #Cyan #Red #Magenta #Yellow

Write-Host "    White "    -ForegroundColor white   #Blue #Green #Cyan #Red #Magenta #Yellow #White

Write-Host "`n "

Write-Host "    White "

Write-Host "`n "

Write-Host "    Black        "  -ForegroundColor Black       #Black #Blue #Green #Cyan #Yellow #Gray

Write-Host "    DarkBlue     "  -ForegroundColor DarkBlue    #DarkBlue #Blue #Green #Cyan #Yellow #Gray

Write-Host "    DarkGreen    "  -ForegroundColor DarkGreen   #DarkGreen #Blue #Green #Cyan #Yellow #Gray

Write-Host "    DarkCyan     "  -ForegroundColor DarkCyan    #DarkCyan #Blue #Green #Cyan #Yellow #Gray

Write-Host "    DarkRed      "  -ForegroundColor DarkRed     #DarkRed #Blue #Green #Cyan #Yellow #Gray

Write-Host "    DarkMagenta  "  -ForegroundColor DarkMagenta #DarkMagenta #Blue #Green #Cyan #Yellow #Gray

Write-Host "    DarkYellow   "  -ForegroundColor DarkYellow  #DarkYellow #Blue #Green #Cyan #Yellow #Gray

Write-Host "    Gray         "  -ForegroundColor Gray        #Blue #Green #Cyan #Yellow #Gray

Write-Host "    DarkGray     "  -ForegroundColor DarkGray    #DarkGray #Blue #Green #Cyan #Yellow #Gray

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


