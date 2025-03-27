
###   ###   ###   ###   ###   ###   ###   ###   ###   ###

# pwsh.exe

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process pwsh.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }



##########     VARIABLES     ##########
##########     VARIABLES     ##########
##########     VARIABLES     ##########
#  
$ErrorActionPreference  = 'SilentlyContinue'
$ProgressPreference  = 'SilentlyContinue'

$date        = Get-Date -format "yyyy-MM-dd"
$dTime       = Get-Date -format "yyyy-MM-dd HH:mm:ss"
$dTimeF      = Get-Date -format "yyMMdd_HHmmss"

$detikS      = 0.1
$detikM      = 0.3
$detikL      = 1
$detikXL     = 2
$detikEXIT   = 1





##########   FUNCTIONS   ##########
##########   FUNCTIONS   ##########
##########   FUNCTIONS   ##########


Function PKTC1 {      # ReadKeyToContinue   # with  "Press any key to continue..."

    Write-Host " "
    Write-Host "Press any key to continue..." -NoNewline -ForegroundColor Yellow #Blue #Green #Cyan #Yellow
    $null = $host.UI.RawUI.ReadKey("NoEcho, includeKeyDown")
    Write-Host " "

}



Function PKTE2 {      #  Press any key, timer, then EXIT

    Write-Host "Press any key to EXIT " -NoNewline -ForegroundColor Yellow #Blue #Green #Cyan #Yellow

    $null = $host.UI.RawUI.ReadKey("NoEcho, includeKeyDown")

    sleep -s $detikS

    EXIT

}





##########     VARIABLES     ##########
##########     VARIABLES     ##########
##########     VARIABLES     ##########


$dfp                  = "$PSScriptRoot\arch\dfp"

    $attiny           = "$PSScriptRoot\arch\dfp\attiny"
#   $avrdd            = "$PSScriptRoot\arch\dfp\avrdd"
    $zip              = "$PSScriptRoot\arch\dfp\zip"



    $testDFP          = (Test-Path $dfp)
    $testATTINY       = (Test-Path $attiny)
#   $testAVRDD        = (Test-Path $avrdd)
    $testZIP          = (Test-Path $zip)





##########     ARRAY     ##########
##########     ARRAY     ##########
##########     ARRAY     ##########


$arrayOfDir  = @($dfp, $attiny, $zip)
Write-Host " "
Write-Host "`$arrayOfDir: "
$arrayOfDir





##########   REMOVE dfp etc.   ##########
##########   REMOVE dfp etc.   ##########
##########   REMOVE dfp etc.   ##########

Write-Host " "
Write-Host "###   ###   ###   ###   ###   ###   ###"
Write-Host " "
Write-Host "REMOVE dfp etc. ..."


Write-Host " "
$DateHMS   = get-date -format "yyyy-MM-dd HH.mm.ss" 
Write-Host "DateHMS          : $DateHMS"
Write-Host "PSCommandPath    : $PSCommandPath "


Write-Host " "
Write-Host "Open the task window... " -NoNewline -ForegroundColor Yellow #Blue #Green #Cyan #Yellow



##########   HASHTABLES   ##########
#  Hashtable Of Tasks
$HashOfTaskC   = [ordered]@{

    'delete dfp'    = "$PSScriptRoot\arch\dfp"

    'delete attiny' = "$PSScriptRoot\arch\dfp\attiny"

    'delete zip'    = "$PSScriptRoot\arch\dfp\zip"

    'break attiny'  = "$PSScriptRoot\arch\dfp\attiny"

}
##########   HASHTABLES   ##########



$theTASK     = ($HashOfTaskC | Out-Gridview -Title "DELETE SOME DIRECTORY. Select a directory to be deleted..." -PassThru)



if ($null -eq $theTASK) {    #  The Task is NULL!

    Write-Host " "
    Write-Host " "
    Write-Host "Null. Not processed." -ForegroundColor Yellow #Blue #Green #Cyan #Yellow
    Write-Host " "

}



if ($HashOfTaskC.Contains($theTASK.Name)) {    # The Task

    Write-Host " "
    Write-Host " "
    Write-Host "Selected Task    :" $theTASK.Name -ForegroundColor Yellow #Blue #Green #Cyan #Yellow
    Write-Host " "


    switch ($theTASK.Name) {

        "delete dfp"         {Write-Host "Delete "$theTASK.Value" directory"}

        "delete attiny"      {Write-Host "Delete "$theTASK.Value" directory"}

        "delete avrdd"       {Write-Host "Delete "$theTASK.Value" directory"}

        "delete zip"         {Write-Host "Delete "$theTASK.Value" directory"}

        "break attiny"       {Write-Host "Delete "$theTASK.Value" directory"}

    }



    Write-Host " "
    Write-Host "Test-Path "$theTASK.Value": " -NoNewline -ForegroundColor Yellow
    Test-Path -Path $theTASK.Value



    if ((Test-Path -Path $theTASK.Value) -eq $false) {

        Write-Host " "
#       Write-Host "Directory not found"  -ForegroundColor Yellow
        Write-Host "Cannot delete "$theTASK.Value". it does not exist!" -ForegroundColor Yellow #Blue

        Write-Host " "
        PKTE2

    }



    if ((Test-Path -Path $theTASK.Value) -eq $true) {

        $gciTheTask = gci -Path $theTASK.Value

        Write-Host " "
        Write-Host " "
        Write-Host "    Get-ChildItem `$gciTheTask:"
        $gciTheTask


        Write-Host " "
        Write-Host " "
        Write-Host "Delete "$theTASK.Value" directory? " -NoNewline -ForegroundColor Yellow #Blue #Cyan
        $delete = Read-Host "[y]yes, [Enter]no"


        if ($delete -ne "y") {    # "No!". EXIT.

            Write-Host "No!"

            PKTE2

        }



        Write-Host " "
        Write-Host "Deleting directory" $theTASK.Value

        Remove-Item -Path $theTASK.Value -Recurse

        Write-Host " "
        Write-Host "Recheck "$theTASK.Value" ..."

        Write-Host " "
        Write-Host "Test-Path "$theTASK.Value": " -NoNewline -ForegroundColor Yellow
        Test-Path -Path $theTASK.Value







        Write-Host " "

        PKTE2



    }

}



Write-Host " "
PKTE2













































# EXIT . . .
PKTE2


EXIT

EXIT

EXIT










<#    $arrayOfTestPath  = @($testDFP, $testATTINY, $testZIP)


$arrayOfTestPath  = @($testDFP, $testATTINY, $testZIP)
Write-Host " "
Write-Host "`$arrayOfTestPath: "
$arrayOfTestPath



#>






<#

Write-Host " "
Write-Host " "
Write-Host "Open the task window? " -NoNewline -ForegroundColor Yellow #Blue #Green #Cyan #Yellow
$continue = Read-Host "[n]no, [Enter]yes"


if ($continue -eq "n") {    # "No!". EXIT.

    Write-Host "No!"

    PKTE2

}



#  CLS




#>






##########   HASHTABLES   ##########
#  Hashtable Of Tasks
$HashOfTask   = [ordered]@{

    'delete dfp'    = 'Delete the whole dfp directory'

    'delete attiny' = 'Delete \dfp\attiny directory'

    'break attiny'  = 'Delete the content of \dfp\attiny directory'

    'delete zip'    = 'Delete \dfp\zip directory'

}
##########   HASHTABLES   ##########












if ($testDFP -eq $false)
{


    Write-Host " "

    Write-Host "dfp not found in " -NoNewline
    Write-Host " $PSScriptRoot\arch\" -ForegroundColor Yellow
    Write-Host "Cannot find path  $dfp  because it does not exist.  LoL!" -ForegroundColor Cyan #Yellow  #Blue

}



if ($testDFP -eq $true)
{


    Write-Host " "
    Write-Host "dfp found in" -NoNewline
    Write-Host " $PSScriptRoot\arch\" -NoNewline -ForegroundColor Yellow


    sleep -s $detikS
    $lsdfp = ls -path $dfp
    $lsdfp


    Write-Host " "

    Write-Host " "

    Write-Host "Delete dfp directory..."


    Remove-Item -Path $dfp -Recurse

    sleep -s $detikM



    Write-Host "Recheck dfp ..."



    $testDFP = (Test-Path $dfp)

    if ($testDFP -eq $false)
    {

        sleep -s $detikS
        Write-Host "dfp has been deleted from" -NoNewline -ForegroundColor Cyan #Yellow #white #Red #Green #Cyan
        Write-Host " $PSScriptRoot\arch\" -ForegroundColor Yellow #Yellow #white #Red #Green #Blue
        sleep -s $detikS

    }

}









###   ###   ###   ###   ###   ###   ###   ###   ###   ###
###   ###   ###   ###   ###   ###   ###   ###   ###   ###
###   ###   ###   ###   ###   ###   ###   ###   ###   ###






















































<#

#>



<#

#>



<#

#>
