
######  pwsh.exe "Administrator"  ######

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process pwsh.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }



##########     VARIABLES     ##########
##########     VARIABLES     ##########
##########     VARIABLES     ##########
#  
$ErrorActionPreference  = 'SilentlyContinue'
$ProgressPreference     = 'SilentlyContinue'

$date        = Get-Date -format "yyyy-MM-dd"
$dTime       = Get-Date -format "yyyy-MM-dd HH:mm:ss"
$dTimeF      = Get-Date -format "yyMMdd_HHmmss"

$detikS      = 0.1
$detikM      = 0.3
$detikL      = 1
$detikXL     = 2
$detikEXIT   = 0.1

<#



#>

<#



#>





##########   FUNCTIONS   ##########
##########   FUNCTIONS   ##########
##########   FUNCTIONS   ##########


Function BasicStuff {    # unused?

    $DateHMS   = get-date -format "yyyy-MM-dd HH.mm.ss" 
    Write-Host "DateHMS          : $DateHMS"
    Write-Host "PSScriptRoot     : $PSScriptRoot "
    Write-Host "PSCommandPath    : $PSCommandPath " -ForegroundColor Yellow #Blue #Green #Cyan #Yellow


Write-Host " "
$DateHMS   = get-date -format "yyyy-MM-dd HH.mm.ss" 
Write-Host "DateHMS          : $DateHMS"
Write-Host "PSCommandPath    : $PSCommandPath "
Write-Host " "


}



Function PKTC1 {      # ReadKeyToContinue   # with  "Press any key to continue..."

    Write-Host " "
    Write-Host "Press any key to continue..." -NoNewline -ForegroundColor Yellow #Blue #Green #Cyan #Yellow
    $null = $host.UI.RawUI.ReadKey("NoEcho, includeKeyDown")
    Write-Host " "

}



Function PKTC2 {      # ReadKeyToContinue   # plain

    $null = $host.UI.RawUI.ReadKey("NoEcho, includeKeyDown")
    Write-Host " "
}



Function PKTD1 {      # ReadKeyToContinue   # with "Press any key to 'debug'. LOL..."

    Write-Host " "
    Write-Host "Press any key to 'debug'. LOL..." -NoNewline -ForegroundColor Yellow #Blue #Green #Cyan
    $null = $host.UI.RawUI.ReadKey("NoEcho, includeKeyDown")
    Write-Host " "

}



Function PKTE1 {      #  Press any key, NO TIMER, EXIT

    Write-Host "Press any key to EXIT" -NoNewline -ForegroundColor Yellow #Blue #Green #Cyan #Yellow

    $null = $host.UI.RawUI.ReadKey("NoEcho, includeKeyDown")

    EXIT

}



Function PKTE2 {      #  Press any key, timer, then EXIT

    Write-Host "Press any key to EXIT " -NoNewline -ForegroundColor Yellow #Blue #Green #Cyan #Yellow

    $null = $host.UI.RawUI.ReadKey("NoEcho, includeKeyDown")

    sleep -s $detikS

    EXIT

}



Function TestWSL {    #####  Test WSL directory  #####

    $global:TestWslDir = Test-Path -Path "C:\Program Files\WSL"

    Write-Host " "
    Write-Host "WSL" -ForegroundColor Cyan #Blue #Green #Cyan #Yellow

    if ($TestWslDir -eq $true) {

        wsl -l -v

    }



    if ($TestWslDir -eq $false) {

        Write-Host "WSL is $TestWslDir!" -ForegroundColor Yellow #Blue #Green #Cyan

        Write-Host " "
        wsl -l -v

        Write-Host " "
        PKTE1

    }


    Write-Host " "

}



Function SimpleWSL {    #####  Test WSL directory  #####

    $global:TestWslDir = Test-Path -Path "C:\Program Files\WSL"

    if ($TestWslDir -eq $true) {

#       Write-Host "WSL" -ForegroundColor Cyan #Blue #Green #Cyan #Yellow
#       wsl -l -v
#       wsl -l -q
#       wsl --status


    }



    elseif ($TestWslDir -eq $false) {    #  NO BUILD!

        Write-Host " "
        Write-Host "WSL: $TestWslDir!" -ForegroundColor Yellow #Blue #Green #Cyan

        Write-Host " "
        wsl -l -q

        Write-Host " "
        PKTE1

    }

}



Function RestartTask {    ######  OPEN THE TASK WINDOW  ######

    Write-Host " "
    Write-Host "RESTART THE TASK" -ForegroundColor Cyan #Blue #Green #Cyan #Yellow
    Write-Host " "
    Write-Host "Open the task window? " -NoNewline -ForegroundColor Yellow #Blue #Green #Cyan #Yellow
    $Restart = Read-Host "[n]no, [Enter]yes"



    if ($Restart -eq "n") {

        Write-Host "No!" -ForegroundColor Yellow #Blue #Green #Cyan #Yellow

        PKTE1

    }



    if ($Restart -ne "N") {

        sleep -s $detikS
        CLS

    }

}








######  ANDURIL BUILD HELPER  ######
######  ANDURIL BUILD HELPER  ######
######  ANDURIL BUILD HELPER  ######


Write-Host " "
$DateHMS   = get-date -format "yyyy-MM-dd HH.mm.ss" 
Write-Host "DateHMS          : $DateHMS"
Write-Host "PSCommandPath    : $PSCommandPath "


TestWSL


Write-Host " "
Write-Host " "
Write-Host "Open the task window? " -NoNewline -ForegroundColor Yellow #Blue #Green #Cyan #Yellow
$continue = Read-Host "[n]no, [Enter]yes"


if ($continue -eq "n") {    # "No!". EXIT.

    Write-Host "No!"

    PKTE2

}


CLS





##########   HASHTABLES   ##########
#  Hashtable Of Tasks
$HashOfTask   = [ordered]@{

    'check attiny' = 'Check dfp-attiny (local file)'

    'check hex'    = 'Check if any firmare file is available'
    'flash hex'    = 'Flash firmare file to a hardware device'
    'delete hex'   = 'Delete generated hex files'

    'dfp-all'      = 'Download and install Atmel DFPs (all)'
    'dfp-attiny'   = 'Download and install Atmel DFP  (attiny only)'
    'dfp-avrdd'    = 'Download and install Atmel DFP  (avrdd only)'

}
##########   HASHTABLES   ##########





while ($TestWslDir -eq $true) {

    SimpleWSL

    $theTASK     = ($HashOfTask | Out-Gridview -Title "ANDURIL MAKE. TASKS. BUILD TARGETS" -PassThru)



    if ($null -eq $theTASK) {    #  The Task is NULL!

        Write-Host " "
        Write-Host "Null. Not processed." -ForegroundColor Yellow #Blue #Green #Cyan #Yellow
        Write-Host " "

    }



    if ($HashOfTask.Contains($theTASK.Name)) {    # The Task

        Write-Host " "
        Write-Host "Selected Task    :" $theTASK.Name -ForegroundColor Yellow #Blue #Green #Cyan #Yellow
        Write-Host " "

        switch ($theTASK.Name) {

            "check attiny"    {. "$PSScriptRoot\check-dfp-attiny-.ps1"}

            "check hex"       {. "$PSScriptRoot\check-hex-.ps1"}
            "flash hex"       {. "$PSScriptRoot\flash-hex-.ps1"}
            "delete hex"      {. "$PSScriptRoot\delete-hex-.ps1"}

            "dfp-all"         {CD $PSScriptRoot ; wsl.exe ./bin/dfp-install.sh}
            "dfp-attiny"      {CD $PSScriptRoot ; wsl.exe ./bin/dfp-install-attiny.sh}
            "dfp-avrdd"       {CD $PSScriptRoot ; wsl.exe ./bin/dfp-install-avrdd.sh}

        }

        Write-Host "`n "

    }

    RestartTask

}



###   ###   ###   ###   ###   ###   ###



Write-Host " "
Write-Host " "
Write-Host "ERROR"
Write-Host "You should never see this line"
Write-Host "There must be a serious ERROR"


Write-Host " "
$DateHMS   = get-date -format "yyyy-MM-dd HH.mm.ss" 
Write-Host "DateHMS          : $DateHMS"
Write-Host "PSCommandPath    : $PSCommandPath "
Write-Host " "

PKTE1

###   ###   ###   ###   ###   ###   ###
###   ###   ###   ###   ###   ###   ###
###   ###   ###   ###   ###   ###   ###







































<#



#>



<#    # stuff



EXIT




PKTC1
PKTC1
PKTC1


Write-Host " "

. "$PSScriptRoot\check-dfp-attiny-.ps1"

Write-Host " "
Write-Host " "


PKTE2






Write-Host " "

Write-Host " "


Write-Host " "

Write-Host " "


    Write-Host " "

    Write-Host " "



#>



<#



#>



###   END   
