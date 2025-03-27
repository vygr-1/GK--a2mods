
###   ###   ###   ###   ###   ###   ###   ###   ###   ###

# pwsh.exe

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process pwsh.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }



##########     VARIABLES     ##########
##########     VARIABLES     ##########
##########     VARIABLES     ##########
#  $ErrorActionPreference  = 'SilentlyContinue'
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






##########   FUNCTIONS   ##########
##########   FUNCTIONS   ##########
##########   FUNCTIONS   ##########



$arrayOfDir  = @($dfp, $attiny, $zip)

Write-Host " "
Write-Host "`$arrayOfDir: "
$arrayOfDir



$arrayOfTestPath  = @($testDFP, $testATTINY, $testZIP)

Write-Host " "
Write-Host "`$arrayOfTestPath: "
$arrayOfTestPath






Foreach ($Dir in $arrayOfDir) {


$Dir


PKTC1



    if ((Test-Path -Path $Dir) -eq $false) {

        Write-Host " "

        Write-Host "WHAT??? FALSE???"

        Write-Host " "

        Write-Host "$Dir not found in " -ForegroundColor Yellow #Yellow  #Blue
        Write-Host "Cannot find path  $Dir  because it does not exist.  LoL!" -ForegroundColor Cyan


    PKTC1



    }




    if ((Test-Path -Path $Dir) -eq $true) {

        Write-Host " "

        Write-Host "WHAT??? TRUE???"

        Write-Host " "

        Write-Host " "
        Write-Host "$Dir found..." -ForegroundColor Yellow


        sleep -s $detikS
        $gciDir = gci -path $Dir
        $gciDir


        Write-Host " "

        Write-Host " "
        Write-Host "Delete $Dir directory...?"

    PKTC1

PKTE2

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

PKTC1

PKTE2

}






















##########   REMOVE dfp etc.   ##########
##########   REMOVE dfp etc.   ##########
##########   REMOVE dfp etc.   ##########


Write-Host " "
Write-Host "###   ###   ###   ###   ###   ###   ###"
Write-Host " "
Write-Host "REMOVE dfp ..."



Write-Host " "
$DateHMS   = get-date -format "yyyy-MM-dd HH.mm.ss" 
Write-Host "DateHMS          : $DateHMS"
Write-Host "PSScriptRoot     : $PSScriptRoot " -ForegroundColor Yellow #Yellow #white #Red #Green #Blue
Write-Host "PSCommandPath    : $PSCommandPath "

Write-Host " "

Write-Host " "

Write-Host "Open the task window? " -NoNewline -ForegroundColor Yellow #Blue #Green #Cyan #Yellow
$continue = Read-Host "[n]no, [Enter]yes"


if ($continue -eq "n") {    # "No!". EXIT.

    Write-Host "No!"

    PKTE2

}



#  CLS



##########   HASHTABLES   ##########
#  Hashtable Of Tasks
$HashOfTask   = [ordered]@{

    'delete dfp'    = 'Delete the whole dfp directory'

    'delete attiny' = 'Delete \dfp\attiny directory'

    'break attiny'  = 'Delete the content of \dfp\attiny directory'

    'delete zip'    = 'Delete \dfp\zip directory'

}
##########   HASHTABLES   ##########




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

        "delete dfp"         {   }

        "delete attiny"      {   }

        "break attiny"       {   }

        "delete zip"         {   }

    }

    Write-Host "`n "

}



PKTE2




















# EXIT . . .
PKTE2


EXIT

EXIT

EXIT





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






















































<#   # Test-Path "D:\dfp" 



# Test-Path "D:\dfp" 
if ((Test-Path $DFPinD) -eq $true)
{

sleep -s $detikM
Write-Host "`n`n   1a. OK, DFP-X exists in" -NoNewline
Write-Host " DRIVE D:\" -ForegroundColor Yellow


sleep -s $detikM
$lsDFPinD = ls -path $DFPinD
Write-Host "  `n" -NoNewline
$lsDFPinD

}


elseif ((Test-Path $DFPinD) -eq $false)
{

sleep -s $detikM
Write-Host "`n`n   1b. DFP-X doesn't exist in" -NoNewline
Write-Host " DRIVE D:\" -ForegroundColor Yellow

}



#>







<#   # (((Test-Path $dfp) -eq $false) -and ((Test-Path $DFPinD) -eq $true))


if (((Test-Path $dfp) -eq $false) -and ((Test-Path $DFPinD) -eq $true))
{

sleep -s $detikM
Write-Host "`n`n   3e. DFP-X doesn't exist in" -NoNewline
Write-Host " $PSScriptRoot" -ForegroundColor Yellow
Write-Host "           Cannot find path $dfp because it does not exist." -ForegroundColor Red




sleep -s $detikM
Write-Host "`n`n       DFP-X exists in" -NoNewline
Write-Host " DRIVE D:\" -ForegroundColor Yellow



sleep -s $detikM
Write-Host "`n`n       Do you want to copy" -NoNewline
Write-Host " $DFPinD" -NoNewline -ForegroundColor Red
Write-Host " into" -NoNewline
Write-Host " $PSScriptRoot" -NoNewline -ForegroundColor Green
Write-Host " ???`n`n"





  sleep -s $detikS
  $confirmation = Read-Host "       (Y/N)"

  if ($confirmation -eq "")
  {
    Write-Host "`n`n       NO." -ForegroundColor Red #Yellow #white #Red #Green #Blue
    sleep -s $detikS
  }

  elseif ($confirmation -eq 'N')
  {
    Write-Host "`n`n       NO." -ForegroundColor Red #Yellow #white #Red #Green #Blue
    sleep -s $detikS
  }

  elseif ($confirmation -eq 'Y')
  {

      sleep -s $detikS
      Write-Host "`n`n       YES, PLEASE... `n" -ForegroundColor Green
      sleep -s $detikS

      sleep -s $detikS
      Write-Host "`n       Copying DFP-X... `n" -ForegroundColor Green
      sleep -s $detikS

      Copy-Item -Path $DFPinD -Destination $PSScriptRoot -Recurse

  }



  sleep -s $detikL
  sleep -s $detikL
  sleep -s $detikL

  if ((Test-Path $dfp) -eq $true)
  {

  sleep -s $detikM
  Write-Host "`n`n   5e. OK, now DFP-X exists in" -NoNewline
  Write-Host " $PSScriptRoot" -ForegroundColor Yellow
  Write-Host "       We can proceed building Anduril ... ??? "


  sleep -s $detikL
  $lsdfp = ls -path $dfp
  Write-Host "  `n" -NoNewline
  $lsdfp

  }

}


#>






<#



# Write-Host "      Cannot find path 'D:\2025-A2x\a2-r240420-523-xui-beacon\dfp' because it does not exist."



# sleep -s $detikL
# $lsdfp = ls -path $dfp
# Write-Host "  `n" -NoNewline
# $lsdfp



sleep -s $detikL
$lsDFPinD = ls -path $DFPinD
Write-Host "  `n" -NoNewline
$lsDFPinD




# Write-Host "  `n"

# Write-Host "  `n`n"

# Test-Path "$PSScriptRoot\dfp"


# $Path = 

# $dfpDir = gci -Path $path -Directory 

# $dfp = gci -Path $PSScriptRoot -directory "dfp"




$PROMPTTT++
Write-Host "`n`n   PROMPT-00$PROMPTTT-:::" -NoNewline
Write-Host "   Press any key to continue ..." -NoNewline -ForegroundColor yellow
Read-KeyToContinue



#>



<#

#>



<#

#>



<#

#>


