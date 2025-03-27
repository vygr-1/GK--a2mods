
######  pwsh.exe "Administrator"  ######
######  pwsh.exe "Administrator"  ######
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





##########     FUNCTIONS     ##########
##########     FUNCTIONS     ##########
##########     FUNCTIONS     ##########

Function BasicStuff {    # unused???

    $DateHMS   = get-date -format "yyyy-MM-dd HH.mm.ss" 
    Write-Host "DateHMS          : $DateHMS"
    Write-Host "PSScriptRoot     : $PSScriptRoot "
    Write-Host "PSCommandPath    : $PSCommandPath " -ForegroundColor Yellow #Blue #Green #Cyan #Yellow

}



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



Function PKTE1 {      #  Press any key to EXIT

    Write-Host "Press any key to EXIT" -NoNewline -ForegroundColor Yellow #Blue #Green #Cyan #Yellow

    $null = $host.UI.RawUI.ReadKey("NoEcho, includeKeyDown")

    EXIT

}



Function PKTE2 {      #  Press any key to EXIT

    Write-Host "Press any key to EXIT " -NoNewline -ForegroundColor Yellow #Blue #Green #Cyan #Yellow

    $null = $host.UI.RawUI.ReadKey("NoEcho, includeKeyDown")

    sleep -s $detikS

    EXIT

}



Function TheEXIT {    #  EXIT

    Write-Host " "
#   Write-Host "Done! Press any key to EXIT... " -NoNewline -ForegroundColor Yellow #Blue #Green #Cyan
    Write-Host "Press any key to EXIT... " -NoNewline -ForegroundColor Yellow #Blue #Green #Cyan
    $null = $host.UI.RawUI.ReadKey("NoEcho, includeKeyDown")

#   Write-Host "EXIT in $detikEXIT second..." -NoNewline -ForegroundColor Yellow #Blue #Green #Cyan
    sleep -s $detikEXIT

    Write-Host " " -NoNewline
    EXIT

}



Function DateHMS {    #  DateHMS:  get-date -format "yyyy-MM-dd HH.mm.ss"

    $DateHMS   = get-date -format "yyyy-MM-dd HH.mm.ss" 

    Write-Host " "
    Write-Host "DateHMS          : $DateHMS "

}






Function TestWSL {    #####  Test WSL directory  #####

#   $TestWslDir = Test-Path -Path "C:\Program Files\WSL"

    $global:TestWslDir = Test-Path -Path "C:\Program Files\WSL"

    Write-Host " "
    Write-Host "WSL" -ForegroundColor Cyan #Blue #Green #Cyan #Yellow

    if ($TestWslDir -eq $true) {

        wsl -l -v

    }



    if ($TestWslDir -eq $false) {

        Write-Host "WSL is $TestWslDir! NO WSL. NO BUILD!`n" -ForegroundColor Yellow #Blue #Green #Cyan
        Write-Host " "

        wsl -l -v

        TheEXIT

    }

}





Function RestartMake {    #####  ANDURIL MAKE window  #####

    Write-Host " "
    Write-Host "ANDURIL MAKE" -ForegroundColor Cyan #Blue #Green #Cyan #Yellow
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





##########     HASHTABLES     ##########
##########     HASHTABLES     ##########
##########     HASHTABLES     ##########

$HashOfMake   = [ordered]@{    ### Hashtable Of Tasks

    'clean'        = 'Delete generated files'
    'dfp'          = 'Download and install Atmel DFPs'
    'docs'         = 'Convert all .md files to .html'
    'models'       = 'Generate the MODELS file'
    'release'      = 'Zip up all .hex files to prep for publishing a release'
    'version'      = 'Show the current version string'
    'todo'         = 'Show tasks noted in source code files'

}



$HashOfUnit   = [ordered]@{}    ### Hashtable Of Flashlights
$Unit         = gci -Path "$PSScriptRoot\hw" -directory -recurse

$HashOfUnit.Add('ANDURIL', 'Compile all build target')
$HashOfUnit.Add(' ',       'Compile all build target')

$Unit.Name | 
Foreach-Object {

    [void] $HashOfUnit.Add($_, "Compile $_ build target")

}



$HashOfExtra   = [ordered]@{    ### Hashtable Of Extra Tasks

    'check hex'    = 'Check if any firmare file is available'
    'flash hex'    = 'Flash firmare file to a hardware device'
    'delete hex'   = 'Delete generated hex files'
    'help'         = 'Show the help text'

    'check attiny' = 'Check dfp-attiny (local file)'

    'dfp-all'      = 'Download and install Atmel DFPs (all)'
    'dfp-attiny'   = 'Download and install Atmel DFP  (attiny only)'
    'dfp-avrdd'    = 'Download and install Atmel DFP  (avrdd only)'

}



$HashOfSectionA = [ordered]@{    ### Hashtable Of SectionA

    '############'     = '###################################'

}



$HashOfSectionB = [ordered]@{    ### Hashtable Of SectionB

    '#############'     = '###################################'

}



$ALLTASK    = $HashOfExtra + $HashOfSectionA + $HashOfMake + $HashOfSectionB + $HashOfUnit





##########  ANDURIL MAKE  ##########
##########  ANDURIL MAKE  ##########
##########  ANDURIL MAKE  ##########


Write-Host " "
$DateHMS   = get-date -format "yyyy-MM-dd HH.mm.ss" 
Write-Host "DateHMS          : $DateHMS"
Write-Host "PSCommandPath    : $PSCommandPath "


TestWSL
Write-Host " "



Function BuildHelper {

Write-Host " "
Write-Host "ANDURIL MAKE" -ForegroundColor Cyan #Blue #Green #Cyan #Yellow
Write-Host "Build helper tool for Anduril flashlight firmware" -ForegroundColor Yellow

Write-Host " "
Write-Host "Usage:" -ForegroundColor Yellow #Blue #Green #Cyan #Yellow
Write-Host "    ./make [Task]" -ForegroundColor Yellow #Blue #Green #Cyan #Yellow

Write-Host " "
Write-Host "Usage on a Windows machine with WSL:" -ForegroundColor Yellow
Write-Host "    wsl.exe ./make [Task]" -ForegroundColor Yellow
Write-Host " "
Write-Host "    wsl.exe ./make [Build Target]" -ForegroundColor Yellow
Write-Host " "
Write-Host "    wsl.exe ./bin/build-all.sh [Build Target]" -ForegroundColor Yellow

Write-Host " "
Write-Host "Extra tasks are done with the help of some ps1 files:" -ForegroundColor Yellow
Write-Host "    pwsh.exe [.\ExtraTask.ps1]" -ForegroundColor Yellow

Write-Host " "
Write-Host "    e.g.:" -ForegroundColor Yellow
Write-Host "        pwsh.exe .\check-dfp-.ps1" -ForegroundColor Yellow
Write-Host " "
Write-Host "        pwsh.exe .\check-hex-.ps1" -ForegroundColor Yellow

Write-Host " "
Write-Host "Tasks and build targets are listed on the task window." -ForegroundColor Yellow #Blue #Cyan
Write-Host "Please make a selection from the list." -ForegroundColor Yellow #Blue #Cyan


}



BuildHelper



Write-Host " "
Write-Host " "
Write-Host "Open the task window? " -NoNewline -ForegroundColor Yellow #Blue #Green #Cyan #Yellow
$continue = Read-Host "[n]no, [Enter]yes"



if ($continue -eq "n") {

    Write-Host "No!"

    PKTE2

}



CLS



while ($TestWslDir -eq $true) {

    $theTASK     = ($ALLTASK | Out-Gridview -Title "ANDURIL MAKE. TASKS. BUILD TARGETS" -PassThru)



    if ($null -eq $theTASK) {    #  The Task is NULL!

        Write-Host " "
        Write-Host "Null. Not processed." -ForegroundColor Yellow #Blue #Green #Cyan #Yellow
        Write-Host " "

    }



    if (($HashOfSectionA.Contains($theTASK.Name)) -or ($HashOfSectionB.Contains($theTASK.Name))) {  # NULL!

        Write-Host " "
        Write-Host "Null. Not processed." -ForegroundColor Yellow #Blue #Green #Cyan #Yellow
        Write-Host " "

    }





    if ($HashOfExtra.Contains($theTASK.Name)) {    # The Extra Task

        Write-Host " "
        Write-Host "Selected Task    :" $theTASK.Name -ForegroundColor Yellow #Blue #Green #Cyan #Yellow
        Write-Host " "

        switch ($theTASK.Name) {

            "check hex"       {. "$PSScriptRoot\check-hex-.ps1"}

            "flash hex"       {. "$PSScriptRoot\flash-hex-.ps1"}

            "delete hex"      {. "$PSScriptRoot\delete-hex-.ps1"}

            "help"            {BuildHelper}

#           "check attiny"    {. "$PSScriptRoot\check-dfp-.ps1"}
            "check attiny"    {. "$PSScriptRoot\check-dfp-attiny-.ps1"}



            "dfp-all"         {CD $PSScriptRoot ; wsl.exe ./bin/dfp-install.sh}

            "dfp-attiny"      {CD $PSScriptRoot ; wsl.exe ./bin/dfp-install-attiny.sh}

            "dfp-avrdd"       {CD $PSScriptRoot ; wsl.exe ./bin/dfp-install-avrdd.sh}



        #   'dfp'          = 'Download and install Atmel DFPs'       ./bin/dfp-install.sh 
        #   'dfp-attiny'   = 'Download and install Atmel DFP-attiny' ./bin/dfp-install-attiny.sh 
        #   'dfp-avrdd'    = 'Download and install Atmel DFP-avrdd'  ./bin/dfp-install-avrdd.sh

        }

        Write-Host "`n "

    }



    if ($HashOfMake.Contains($theTASK.Name))   {    # The Task Name of $HashOfMake

        Write-Host " "
        Write-Host "Selected Task    :" $theTASK.Name -ForegroundColor Yellow #Blue #Green #Cyan #Yellow
        Write-Host " "
        CD $PSScriptRoot
        Write-Host " "
        wsl.exe ./make $theTASK.Name
        Write-Host " "

    }



    if ($HashOfUnit.Contains($theTASK.Name))   {    # The Task Name of $HashOfUnit

        Write-Host " "
        Write-Host "Selected Task    : Compile" $theTASK.Name -ForegroundColor Yellow #Blue #Green #Cyan
        Write-Host " "
        Write-Host "Check the dfp-attiny first..."
        Write-Host " "
        . "$PSScriptRoot\check-dfp-attiny-.ps1"



        if ($dfpStatus -eq $true)    # Go ahead, build Anduril!
        {

            Write-Host " "
            Write-Host "Compile" $theTASK.Name "..." -ForegroundColor Cyan #Blue #Green #Cyan #Yellow
            Write-Host " "
            CD $PSScriptRoot
            Write-Host " "
            wsl.exe ./bin/build-all.sh $theTASK.Name
            Write-Host " "

        }

    }

    RestartMake

}



###   ###   ###   ###   ###   ###   ###



Write-Host " "
Write-Host " "
Write-Host "ERROR"
Write-Host "You should've never read this line"
Write-Host "There must've been a serious ERROR"

DateHMS

TheEXIT

###   ###   ###   ###   ###   ###   ###
###   ###   ###   ###   ###   ###   ###
###   ###   ###   ###   ###   ###   ###









































<#



#>



<#



#>



<#


#           "check dfp"       {. "$PSScriptRoot\check-dfp-.ps1"}    #check-dfp-525-.ps1
#           "check dfp"       {pwsh "$PSScriptRoot\check-dfp-525-.ps1"}    #check-dfp-525-.ps1
#           "check dfp"       {. "$PSScriptRoot\check-dfp-.ps1"}  #check-dfp-525-.ps1
#           "check hex"       {. "$PSScriptRoot\check-hex-.ps1"}
#           "check hex"       {. "$PSScriptRoot\check-hex-525-.ps1"}


#>




###   ###   ###   ###   ###   ###   ###
###   ###   ###   ###   ###   ###   ###


#  sleep -s $detikS

#Blue #Green #Cyan #Yellow

#-ForegroundColor Cyan #Blue #Green #Cyan #Yellow

#Blue #Green #Cyan #Yellow



###   ###   ###   ###   ###   ###   ###




#   the TASK window
#   $continueOrExit = Read-Host "`nOpen the task window and select a task from the list? (Y/N)"
#       $SelectTask     = Read-Host "Open the task window and select a task from the list? (Y/N)"
#   PKTC1
#   Write-Host " "
#   PKTC1
#   Write-Host " "
#   Write-Host " "

#  Write-Host "       TASK is one of the tasks or build targets listed below" -ForegroundColor Yellow #Blue #Green #Cyan
#  Write-Host "... where TASK is one of the tasks or build targets listed below" -ForegroundColor Yellow #Blue #Green #Cyan
#  Write-Host "... TASK is one of the tasks or build targets listed below" -ForegroundColor Yellow #Blue #Green #Cyan


<#    #  FUNCTIONS


Function CheckDfp {

    sleep -s $detikS

    #    $GetDfp = "$PSScriptRoot\CHECK-DFP-.ps1"   # This path works. Use "$PSScriptRoot"
    #    pwsh $GetDfp
    #    . $GetDfp

    . "$PSScriptRoot\CHECK-DFP-.ps1"

}



Function CheckHex {

    sleep -s $detikS

#   $CheckHexFile = "$PSScriptRoot\CHECK-HEX-.ps1"
#   pwsh $CheckHexFile

    pwsh "$PSScriptRoot\CHECK-HEX-.ps1"

}



Function FlashHex {

    sleep -s $detikS

#   $FlashHexFile = "$PSScriptRoot\FLASH-A2-.ps1"
#   pwsh $FlashHexFile

    pwsh "$PSScriptRoot\FLASH-A2-.ps1"


}



Function DeleteHex {

    sleep -s $detikS

    Remove-Item "$PSScriptRoot\hex\*.hex"


}


#>



<#



#>



<#



#>


