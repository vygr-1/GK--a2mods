 
###   ###   ###   ###   ###   ###   ###

# 2025-03-16

# 2025-03-18

# 2025-03-21



###   ###   ###   ###   ###   ###   ###

# pwsh.exe

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process pwsh.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

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



sleep -s $detikS

###   ###   ###   ###   ###   ###   ###

#Yellow #Green #Blue #Cyan

#-ForegroundColor Cyan #Blue #Green #Cyan #Yellow

#Blue #Green #Cyan #Yellow



###   ###   ###   ###   ###   ###   ###
###   ###   ###   ###   ###   ###   ###
###   ###   ###   ###   ###   ###   ###



#  BASIC FUNCTIONS

Function BasicStuff {

    $DateHMS   = get-date -format "yyyy-MM-dd HH.mm.ss" 
    Write-Host "DateHMS          : $DateHMS"
    Write-Host "`$PSScriptRoot    : $PSScriptRoot "
    Write-Host "`$PSCommandPath   : $PSCommandPath " -ForegroundColor Yellow #Blue #Green #Cyan #Yellow

}



Function RKTC1 {     #  ReadKeyToContinue

    Write-Host "`nPress any key to continue..." -NoNewline -ForegroundColor Yellow #Blue #Green #Cyan #Yellow
    $null = $host.UI.RawUI.ReadKey("NoEcho, includeKeyDown")
    Write-Host " "
}



Function RKTC2 {     #  ReadKeyToContinue

    Write-Host "`n" -NoNewline -ForegroundColor Yellow #Blue #Green #Cyan #Yellow
    $null = $host.UI.RawUI.ReadKey("NoEcho, includeKeyDown")
    Write-Host " "
}



Function TheEXIT {   #  EXIT

    Write-Host "`nDone! Press any key to EXIT..." -NoNewline -ForegroundColor Yellow #Blue #Green #Cyan #Yellow
    $null = $host.UI.RawUI.ReadKey("NoEcho, includeKeyDown")

    Write-Host " EXIT in $detikEXIT second..." -NoNewline -ForegroundColor Yellow #Blue #Green #Cyan #Yellow
    sleep -s $detikEXIT

    Write-Host " " -NoNewline
    EXIT
}



Function DateHMS {     #  DateHMS:  get-date -format "yyyy-MM-dd HH.mm.ss"


    $DateHMS   = get-date -format "yyyy-MM-dd HH.mm.ss" 

    sleep -s $detikS

    Write-Host "`nDateHMS          : $DateHMS "

}



###   ###   ###   ###   ###   ###   ###
###   ###   ###   ###   ###   ###   ###
###   ###   ###   ###   ###   ###   ###





#  FUNCTIONS

Function TestWSL {    #  WSL

    $TestWslDir = Test-Path -Path "C:\Program Files\WSL"

    sleep -s $detikS
    Write-Host "`nWSL" -ForegroundColor Cyan #Blue #Green #Cyan #Yellow



    if ($TestWslDir -eq $true) {

        wsl -l -v

    }



    if ($TestWslDir -eq $false) {

        Write-Host "WSL is $TestWslDir!`n" -ForegroundColor Yellow #Blue #Green #Cyan #Yellow

        wsl -l -v

        Write-Host "`nNO WSL. NO BUILD!" -ForegroundColor Yellow #Blue #Green #Cyan #Yellow

        DateHMS
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

        sleep -s $detikM
        CLS

        sleep -s $detikS
        Write-Host "`nANDURIL MAKE" -ForegroundColor Cyan #Blue #Green #Cyan #Yellow

    }

}





###   ###   ###   ###   ###   ###   ###
###   ###   ###   ###   ###   ###   ###
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



#   $ALLTASK    = $HashOfExtra + $HashOfMake + $HashOfUnit
#   
$ALLTASK    = $HashOfExtra + $HashOfSectionA + $HashOfMake + $HashOfSectionB + $HashOfUnit





###   ###   ###   ###   ###   ###   ###
###   ###   ###   ###   ###   ###   ###
###   ###   ###   ###   ###   ###   ###



#  ANDURIL MAKE

Write-Host "`n "

BasicStuff

TestWSL

Write-Host "`n###   ###   ###   ###   ###   ###   ### `n"
Write-Host "ANDURIL MAKE" -ForegroundColor Cyan #Blue #Green #Cyan #Yellow

Write-Host "a build helper tool for Anduril flashlight firmware "
Write-Host "Usage: ./make TASK" -ForegroundColor Yellow #Blue #Green #Cyan #Yellow
Write-Host "TASK is one of the tasks or build targets listed below"





while ($TestWslDir -eq $true) {

    #   the TASK window
    $continueOrExit = Read-Host "`nOpen the TASK window and select a task from the list? (Y/N)"


    if ($continueOrExit -eq "N") {

        Write-Host "No!" -ForegroundColor Yellow #Blue #Green #Cyan #Yellow

        TheEXIT

    }



    # else:
    sleep -s $detikS
    Write-Host "`nANDURIL MAKE " -ForegroundColor Cyan #Blue #Green #Cyan #Yellow

    $theTASK     = ($ALLTASK | out-gridview -Title "ANDURIL MAKE, TASKS, BUILD TARGETS" -PassThru)



    ###   ###   ###   ###   ###   ###   ###



    if ($null -eq $theTASK) {    #  TASK is NULL!

        sleep -s $detikS
        Write-Host "The task is null. Not processed."
        Write-Host "`n "

    }



    if (($HashOfSectionA.Contains($theTASK.Name)) -or ($HashOfSectionB.Contains($theTASK.Name))) {    # 

        sleep -s $detikS
        Write-Host "The task is null. Not processed."
        Write-Host "`n "

    }





    if ($HashOfExtra.Contains($theTASK.Name)) {    # TheTASK Name is a part of `$HashOfExtra

        Write-Host "Selected TASK    :" $theTASK.Name -ForegroundColor Yellow #Blue #Green #Cyan #Yellow
        Write-Host "                  " $theTASK.value
        Write-Host "`nWorking on it...`n" -ForegroundColor Yellow #Blue #Green #Cyan #Yellow

        sleep -s $detikM

        switch ($theTASK.Name) 
        {

            "check dfp"       {. "$PSScriptRoot\CHECK-DFP-.ps1"}
            "check hex"       {pwsh "$PSScriptRoot\CHECK-HEX-.ps1"}
            "flash hex"       {pwsh "$PSScriptRoot\FLASH-A2-.ps1"}
            "delete hex"      {pwsh "$PSScriptRoot\DELETE-HEX-.ps1"}

        }

        Write-Host "`n "

    }







    if ($HashOfMake.Contains($theTASK.Name))   {

        Write-Host "Selected TASK    :" $theTASK.Name -ForegroundColor Yellow #Blue #Green #Cyan #Yellow

        Write-Host "                  " $theTASK.value

        Write-Host "`nWorking on it...`n" -ForegroundColor Yellow #Blue #Green #Cyan #Yellow

        sleep -s $detikM

        CD $PSScriptRoot

        Write-Host " "

        wsl.exe ./make $theTASK.Name

        Write-Host "`n "

    }



    if ($HashOfUnit.Contains($theTASK.Name))   {    # TheTASK Name is a part of `$HashOfUnit

        Write-Host "Selected TASK    :" $theTASK.Name -ForegroundColor Yellow #Blue #Green #Cyan #Yellow

        Write-Host "                  " $theTASK.value "`n"

        Write-Host "Check dfp" -ForegroundColor Cyan #Blue #Green #Cyan #Yellow

        sleep -s $detikS

        . "$PSScriptRoot\CHECK-DFP-.ps1"



        if ($dfpStatus -eq $true)    # Go ahead, build Anduril!
        {

            Write-Host "`nWorking on it...`n" -ForegroundColor Yellow #Blue #Green #Cyan #Yellow

            sleep -s $detikM

            CD $PSScriptRoot

            Write-Host " "

            wsl.exe ./bin/build-all.sh $theTASK.Name

            Write-Host "`n "

        }

    }

    RestartMake

}



###   ###   ###   ###   ###   ###   ###



Write-Host "`n"
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


