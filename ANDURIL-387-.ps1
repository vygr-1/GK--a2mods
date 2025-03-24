
###   ###   ###   ###   ###   ###   ###
###   ###   ###   ###   ###   ###   ###
###   ###   ###   ###   ###   ###   ###



# pwsh.exe

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process pwsh.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }



###   ###   ###   ###   ###   ###   ###
###   ###   ###   ###   ###   ###   ###
###   ###   ###   ###   ###   ###   ###



#    BASIC VARIABLES
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
$detikEXIT   = 0.5



###   ###   ###   ###   ###   ###   ###



Function BasicStuff {

    $DateHMS   = get-date -format "yyyy-MM-dd HH.mm.ss" 
    Write-Host "DateHMS          : $DateHMS"
    Write-Host "PSScriptRoot     : $PSScriptRoot "
    Write-Host "PSCommandPath    : $PSCommandPath " -ForegroundColor Yellow #Blue #Green #Cyan #Yellow

}



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



$TestWslDir = Test-Path -Path "C:\Program Files\WSL"

Function TestWSL {

    Write-Host "`nWSL" -ForegroundColor Cyan #Blue #Green #Cyan #Yellow

    if ($TestWslDir -eq $true) {

        wsl -l -v

    }



    if ($TestWslDir -eq $false) {

        Write-Host "WSL is $TestWslDir! NO WSL. NO BUILD!`n" -ForegroundColor Yellow #Blue #Green #Cyan #Yellow

        wsl -l -v

        TheEXIT

    }

}



Function RestartMake {

    Write-Host "`nRestart ANDURIL MAKE? " -NoNewline -ForegroundColor Cyan #Blue #Green #Cyan #Yellow

    $Restart = Read-Host "(Y/N)"

    if ($Restart -eq "N") {

        Write-Host "No!" -ForegroundColor Yellow #Blue #Green #Cyan #Yellow

        TheEXIT

    }



    if (!($Restart -eq "N")) {

        sleep -s $detikS
        CLS
        Write-Host "`nANDURIL MAKE" -ForegroundColor Cyan #Blue #Green #Cyan #Yellow

    }

}



###   ###   ###   ###   ###   ###   ###



#  Hashtable Of Tasks
$HashOfMake   = [ordered]@{

    'clean'        = 'Delete generated files'
    'dfp'          = 'Download and install Atmel DFPs'
    'docs'         = 'Convert all .md files to .html'
    'models'       = 'Generate the MODELS file'
    'release'      = 'Zip up all .hex files to prep for publishing a release'
    'version'      = 'Show the current version string'
    'todo'         = 'Show tasks noted in source code files'

}



#  Hashtable Of Flashlights
$HashOfUnit   = [ordered]@{}
$Unit         = gci -Path "$PSScriptRoot\hw" -directory -recurse

$HashOfUnit.Add('ANDURIL', 'Compile all build target')

$HashOfUnit.Add(' ',       'Compile all build target')

$Unit.Name | 
Foreach-Object {

    [void] $HashOfUnit.Add($_, "Compile $_ build target")

}



#  Hashtable Of Extra Tasks
$HashOfExtra   = [ordered]@{

'check dfp'    = 'Check mini-dfp (dfp-attiny)'
'check hex'    = 'Check if any firmare file is available'
'flash hex'    = 'Flash firmare file to a hardware device'
'delete hex'   = 'Delete generated hex files'

}



#  Hashtable Of SectionA
$HashOfSectionA = [ordered]@{

    '############'     = '###################################'

}



#  Hashtable Of SectionB
$HashOfSectionB = [ordered]@{

    '#############'     = '###################################'

}



$ALLTASK    = $HashOfExtra + $HashOfSectionA + $HashOfMake + $HashOfSectionB + $HashOfUnit



###   ###   ###   ###   ###   ###   ###
###   ###   ###   ###   ###   ###   ###
###   ###   ###   ###   ###   ###   ###



#  ANDURIL MAKE

Write-Host " "

BasicStuff

TestWSL

CLS

Write-Host ""
Write-Host "###   ###   ###   ###   ###   ###   ###"

Write-Host ""
Write-Host "ANDURIL MAKE" -ForegroundColor Cyan #Blue #Green #Cyan #Yellow
Write-Host "Build helper tool for Anduril flashlight firmware "

Write-Host ""
Write-Host "Usage:" -ForegroundColor Yellow #Blue #Green #Cyan #Yellow
Write-Host "    ./make [Task]" -ForegroundColor Yellow #Blue #Green #Cyan #Yellow

Write-Host ""
Write-Host "Usage on a Windows machine with WSL:" -ForegroundColor Yellow
Write-Host "    wsl.exe ./make [Task]" -ForegroundColor Yellow
Write-Host ""
Write-Host "    wsl.exe ./make [Build Target]" -ForegroundColor Yellow
Write-Host ""
Write-Host "    wsl.exe ./bin/build-all.sh [Build Target]" -ForegroundColor Yellow

Write-Host ""
Write-Host "Extra tasks are done with the help of some ps1 files:" -ForegroundColor Yellow
Write-Host "    pwsh.exe [.\Task.ps1]" -ForegroundColor Yellow

Write-Host ""
Write-Host "    e.g.:" -ForegroundColor Yellow
Write-Host "        pwsh.exe .\check-dfp-.ps1" -ForegroundColor Yellow
Write-Host ""
Write-Host "        pwsh.exe .\check-hex-.ps1" -ForegroundColor Yellow

Write-Host ""
Write-Host "Tasks and build targets are listed on the task window." -ForegroundColor Yellow #Blue #Green #Cyan






while ($TestWslDir -eq $true) {

    Write-Host ""    #   the TASK window
    $continueOrExit = Read-Host "Open the task window and select a task from the list? (Y/N)"


    if ($continueOrExit -eq "N") {

        Write-Host "No!" -ForegroundColor Yellow #Blue #Green #Cyan #Yellow
        TheEXIT
    }



    Write-Host " "

    $theTASK     = ($ALLTASK | Out-Gridview -Title "ANDURIL MAKE.TASKS.BUILD TARGETS" -PassThru)



    if ($null -eq $theTASK) {    #  The Task is NULL!

        Write-Host "The task is null. Not processed." -ForegroundColor Yellow #Blue #Green #Cyan #Yellow
        Write-Host ""
        Write-Host ""

    }



    if (($HashOfSectionA.Contains($theTASK.Name)) -or ($HashOfSectionB.Contains($theTASK.Name))) {  # NULL!

        Write-Host "The task is null. Not processed." -ForegroundColor Yellow #Blue #Green #Cyan #Yellow
        Write-Host "`n "

    }





    if ($HashOfExtra.Contains($theTASK.Name)) {    # The Extra Task

        Write-Host "Selected task    :" $theTASK.Name -ForegroundColor Yellow #Blue #Green #Cyan #Yellow
        Write-Host ""

        switch ($theTASK.Name) {


            "check dfp"       {pwsh "$PSScriptRoot\check-dfp-.ps1"}

            "check hex"       {. "$PSScriptRoot\check-hex-.ps1"}

            "flash hex"       {. "$PSScriptRoot\flash-a2-.ps1"}

            "delete hex"      {. "$PSScriptRoot\delete-hex-.ps1"}

        }

        Write-Host "`n "

    }






    if ($HashOfMake.Contains($theTASK.Name))   {    # The Task Name of $HashOfMake

        Write-Host "Selected TASK    :" $theTASK.Name -ForegroundColor Yellow #Blue #Green #Cyan #Yellow
        Write-Host ""

        sleep -s $detikS

        CD $PSScriptRoot

        Write-Host " "

        wsl.exe ./make $theTASK.Name

        Write-Host "`n "

    }





    if ($HashOfUnit.Contains($theTASK.Name))   {    # The Task Name of $HashOfUnit

        Write-Host "Selected TASK    :" $theTASK.Name -ForegroundColor Yellow #Blue #Green #Cyan #Yellow
        Write-Host " "



        . "$PSScriptRoot\check-dfp-.ps1"



        if ($dfpStatus -eq $true)    # Go ahead, build Anduril!
        {

            Write-Host " "

            sleep -s $detikS

            CD $PSScriptRoot

            Write-Host " "

            wsl.exe ./bin/build-all.sh $theTASK.Name

            Write-Host "`n "

        }

    }

    RestartMake

}



###   ###   ###   ###   ###   ###   ###



Write-Host ""
Write-Host ""
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
#   RKTC1
#   Write-Host ""
#   RKTC1
#   Write-Host ""
#   Write-Host ""

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


