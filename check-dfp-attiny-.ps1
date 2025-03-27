
###   ###   ###   ###   ###   ###   ###
###   ###   ###   ###   ###   ###   ###
###   ###   ###   ###   ###   ###   ###


<###   pwsh.exe , Administrator




if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process pwsh.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }


#>



if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process pwsh.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }


###   ###   ###   ###   ###   ###   ###
###   ###   ###   ###   ###   ###   ###
###   ###   ###   ###   ###   ###   ###



#  BASIC VARIABLES AND FUNCTIONS

#  $ErrorActionPreference  = 'SilentlyContinue'
$ProgressPreference     = 'SilentlyContinue'



<#    detikS etc.


$date        = Get-Date -format "yyyy-MM-dd"
$dTime       = Get-Date -format "yyyy-MM-dd HH:mm:ss"
$dTimeF      = Get-Date -format "yyMMdd_HHmmss"

$detikS      = 0.1
$detikM      = 0.3
$detikL      = 1
$detikXL     = 2
$detikEXIT   = 0.5



sleep -s $detikS

 -ForegroundColor Cyan #Blue #Green #Cyan #Yellow

#>




##########     FUNCTIONS     ##########
##########     FUNCTIONS     ##########
##########     FUNCTIONS     ##########

Function PKTC1 {      #  ReadKeyToContinue

    Write-Host " "
    Write-Host "Press any key to continue..." -NoNewline -ForegroundColor Yellow #Blue #Green #Cyan #Yellow
    $null = $host.UI.RawUI.ReadKey("NoEcho, includeKeyDown")
    Write-Host " "

}



Function PKTD1 {      #  ReadKeyToContinue

    Write-Host " "
    Write-Host "Press any key to 'debug'. LOL..." -NoNewline -ForegroundColor Yellow #Blue #Green #Cyan
    $null = $host.UI.RawUI.ReadKey("NoEcho, includeKeyDown")
    Write-Host " "

}



Function PKTC2 {      #  ReadKeyToContinue

    $null = $host.UI.RawUI.ReadKey("NoEcho, includeKeyDown")
    Write-Host " "
}



Function TheEXIT {    #  EXIT

    Write-Host " "
    Write-Host "Done! Press any key to EXIT... " -NoNewline -ForegroundColor Yellow #Blue #Green #Cyan
    $null = $host.UI.RawUI.ReadKey("NoEcho, includeKeyDown")

    Write-Host "EXIT in $detikEXIT second..." -NoNewline -ForegroundColor Yellow #Blue #Green #Cyan
    sleep -s $detikEXIT

    Write-Host " " -NoNewline
    EXIT

}



Function DateHMS {    #  DateHMS:  get-date -format "yyyy-MM-dd HH.mm.ss"

    $DateHMS   = get-date -format "yyyy-MM-dd HH.mm.ss" 

    Write-Host " "
    Write-Host "DateHMS          : $DateHMS "

}





##########     VARIABLES     ##########
##########     VARIABLES     ##########
##########     VARIABLES     ##########
 
#   Root of the Drive:
$RootDrive            = Split-Path -Path $PSScriptRoot -Qualifier

$arch                 = "$PSScriptRoot\arch"

$dfp                  = "$PSScriptRoot\arch\dfp"

    $attiny           = "$PSScriptRoot\arch\dfp\attiny"
#   $avrdd            = "$PSScriptRoot\arch\dfp\avrdd"
    $zip              = "$PSScriptRoot\arch\dfp\zip"

        $zipAttPack   = "$PSScriptRoot\arch\dfp\zip\Atmel.ATtiny_DFP.2.0.368.atpack"
#       $zipAvrPack   = "$PSScriptRoot\arch\dfp\zip\Atmel.AVR-Dx_DFP.2.2.253.atpack"



   $testDFP           = (Test-Path $dfp)
   $testATTINY        = (Test-Path $attiny)
#  $testAVRDD         = (Test-Path $avrdd)
   $testZIP           = (Test-Path $zip)



$attinyDirSize        = (gci $attiny -rec | measure Length -sum).sum
$attinyDirSizeMB      = "{0:N2}" -f ((gci $attiny -rec | measure Length -sum).sum / 1MB)



#########  Check dfp-attiny  ##########
#########  Check dfp-attiny  ##########
#########  Check dfp-attiny  ##########


Write-Host "Check dfp-attiny" -ForegroundColor Cyan #Blue #Green #Cyan #Yellow

Write-Host "PSCommandPath    : $PSCommandPath "



if (($testATTINY -eq $true) -and ($attinyDirSize -gt 109012000)) {

    Write-Host " "
    Write-Host "gci dfp dir      : " -NoNewline -ForegroundColor Yellow #Blue #Green #Cyan #Yellow
    $gcidfp    = gci -path $dfp
    Write-Host $gcidfp.Name -Separator ", " -ForegroundColor Yellow #Blue #Green #Cyan #Yellow


    Write-Host " "
    Write-Host "gci attiny dir   : " -NoNewline -ForegroundColor Yellow #Blue #Green #Cyan #Yellow
    $gciattiny = gci -path $attiny
    Write-Host $gciattiny.Name -Separator ", " -ForegroundColor Yellow #Blue #Green #Cyan #Yellow


    Write-Host " "
    Write-Host "attiny dir size  : $attinyDirSizeMB MB" -ForegroundColor Yellow #Blue #Green #Cyan

    $global:dfpStatus = $true

    Write-Host "dfpStatus        :" $dfpStatus -ForegroundColor Yellow #Blue #Green #Cyan #Yellow

    EXIT

}



else {   # dfp-attiny not found in this repo

    Write-Host " "
    Write-Host "dfp-attiny not found in this repo" -ForegroundColor Yellow #Blue #Green #Cyan #Yellow

}





######  ATtiny pack NOT available  ######
######  ATtiny pack NOT available  ######
######  ATtiny pack NOT available  ######



# test if '$arch\dfp\zip\Atmel.ATtiny_DFP.2.0.368.atpack' is availble in this repo
$testATtPack    = Test-Path "$PSScriptRoot\arch\dfp\zip\Atmel.ATtiny_DFP.2.0.368.atpack"

### valid ATTINY Pack Size ~31457000  ((31,457,438 bytes) (30.0 MB))
$attPackSize    = (Get-Item $zipAttPack).Length
$attPackSizeMB  = "{0:N2}" -f ((Get-Item $zipAttPack).Length / 1MB)



if (($testATtPack -eq $false) -or ($attPackSize -lt 31457000)) {


    Write-Host " "
    Write-Host "... and... " -ForegroundColor Yellow #Blue #Green #Cyan #Yellow
    Write-Host "'Atmel.ATtiny_DFP.2.0.368.atpack' is NOT available either"

    Write-Host "or "
    Write-Host "'Atmel.ATtiny_DFP.2.0.368.atpack' is NOT VALID"



    Write-Host " "
    #  Searching for 'Atmel.ATtiny_DFP.2.0.368.atpack', starts from the Root of the Drive
    Write-Host " "
    Write-Host "Finding attiny pack... (Atmel.ATtiny_DFP.2.0.368.atpack)"

    $attinyPack        = gci -Path $RootDrive\ -Filter "Atmel.ATtiny_DFP.2.0.368.atpack" -recurse 

    Write-Host "Found" $attinyPack.count "attiny pack" 


    Write-Host " "
    Write-Host "Filtering THE PACKS..."


    Foreach ($Pack in $attinyPack) {

        ### Check Pack Size
        $PackSize     = (Get-Item $Pack).Length


        if ($PackSize -gt 31457000) {    # valid ATTINY Pack Size ~31457000  ((31,457,438 bytes) (30.0 MB))

            Write-Host "..'THE GOOD PACK':"
            Write-Host "ATTINY pack      : (`$Pack) = $Pack"
            Write-Host "ATTINY pack size : $PackSize bytes ($PackSizeMB MB)" -ForegroundColor Yellow

            BREAK

        }

    }



#   $PackSize     = (Get-Item $Pack).Length

    $PackSizeMB   = "{0:N2}" -f ((Get-Item $Pack).Length / 1MB)

    Write-Host " "
    Write-Host "ATTINY pack size : $PackSize bytes ($PackSizeMB MB)" -ForegroundColor Yellow



    Write-Host " "
    Write-Host " "
    Write-Host "Copy $Pack " -ForegroundColor Yellow #Blue #Green #Cyan
    Write-Host "into $zip ? " -NoNewline -ForegroundColor Yellow #Blue #Green #Cyan

    $confirmation = Read-Host "[y]yes, [Enter]no"



    if ($confirmation -ne "y") {
        Write-Host "No." -ForegroundColor Yellow #Blue #Green #Cyan #Yellow

        $global:dfpStatus = $false

        Write-Host " "
        Write-Host "dfpStatus         :" $dfpStatus

        EXIT

    }





    elseif ($confirmation -eq 'y') {

        Write-Host "Yes" -ForegroundColor Cyan #Blue #Green #Cyan #Yellow

        Write-Host " "
        Write-Host "    create a ''new''  directory : 'zip' "

        New-Item -Path "$PSScriptRoot\arch\dfp\zip" -Type Directory -force

        Write-Host " "
        Write-Host "Copying the attiny pack... " -ForegroundColor Yellow #Blue #Green #Cyan #Yellow
        Write-Host "'Copy-Item -Path `$Pack -Destination `$PSScriptRoot\arch\dfp\zip\'"

        Copy-Item -Path $Pack -Destination "$PSScriptRoot\arch\dfp\zip\"



        $zip            = "$PSScriptRoot\arch\dfp\zip"
        $zipAttPack     = "$PSScriptRoot\arch\dfp\zip\Atmel.ATtiny_DFP.2.0.368.atpack"

        $testZIP        = Test-Path "$PSScriptRoot\arch\dfp\zip"
        $testATtPack    = Test-Path "$PSScriptRoot\arch\dfp\zip\Atmel.ATtiny_DFP.2.0.368.atpack"

        $zipDirSize     = (gci $zip -rec | measure Length -sum).sum

        $attPackSize    = (Get-Item $zipAttPack).Length
        $attPackSizeMB  = "{0:N2}" -f ((Get-Item $zipAttPack).Length / 1MB)



        Write-Host " "
        Write-Host " "
        Write-Host "Test-Path the 'attiny pack' (`$testAttPack) : $testAttPack" 
        Write-Host "'attiny pack' size          (`$attPackSize) : $attPackSize bytes ($attPackSizeMB MB)" 

    }

}





######  ATtiny pack is AVAILABLE  ######
######  ATtiny pack is AVAILABLE  ######
######  ATtiny pack is AVAILABLE  ######



$testATtPack    = Test-Path "$PSScriptRoot\arch\dfp\zip\Atmel.ATtiny_DFP.2.0.368.atpack"



if (($testATtPack -eq $true) -and ($attPackSize -gt 31457000)) {


    Write-Host " "
    Write-Host "..." -ForegroundColor Yellow #Blue #Green #Cyan #Yellow
    Write-Host "'Atmel.ATtiny_DFP.2.0.368.atpack' is AVAILABLE"
    Write-Host "in the 'arch\dfp\zip\' directory"
    Write-Host  "Test the path : '$PSScriptRoot\arch\dfp\zip\Atmel.ATtiny_DFP.2.0.368.atpack'"

    Write-Host " "
    Write-Host "`$testATtPack  : $testATtPack"
    Write-Host "`$attPackSize  : $attPackSize bytes"



    #  delete the invalid $dfp attiny first (if any)
    if ($testATTINY -eq $true) {

        Write-Host " "
        Write-Host "Delete the invalid attiny first ..." -ForegroundColor Yellow #Blue #Green #Cyan

        Remove-Item -Path $attiny -Recurse

        Write-Host "invalid attiny is deleted." -ForegroundColor Yellow #Blue #Green #Cyan #Yellow

    }



    $attiny       = "$PSScriptRoot\arch\dfp\attiny"
    $testATTINY   = Test-Path $attiny


    Write-Host " "
    Write-Host "Recheck the 'dfp\attiny' dir ($attiny)"
    Write-Host "`$testATTINY   : $testATTINY"


    Write-Host "
    NEXT:  extract the 'Atmel.ATtiny_DFP.2.0.368.atpack' ???
           the contents will reside in the 'dfp\attiny' directory ??? "



    if ($testATTINY -eq $false) {    # then extracting the pack 'Atmel.ATtiny_DFP.2.0.368.atpack' ...

        # unzip the "Atmel.ATtiny_DFP.2.0.368.atpack"
        # extract the contents to the directory 'dfp\attiny'

        Write-Host " "
        Write-Host "... extracting the pack 'Atmel.ATtiny_DFP.2.0.368.atpack'"
        Write-Host "into 'dfp\attiny' directory ..."
        Write-Host "'Expand-Archive `$zipAttPack -Destination `$attiny'"

        Expand-Archive "$zipAttPack" -Destination $attiny

        $testATTINY   = Test-Path $attiny

        Write-Host " "
        Write-Host " "
        Write-Host "Recheck the 'dfp\attiny' dir ($attiny)"
        Write-Host "`$testATTINY   : $testATTINY"

    }





#   $attinyDirSize    = (gci $attiny -rec | measure Length -sum).sum
#   $attinyDirSizeMB  = "{0:N2}" -f ((gci $attiny -rec | measure Length -sum).sum / 1MB)

#   $dfp              = "$PSScriptRoot\arch\dfp"
#   $attiny           = "$PSScriptRoot\arch\dfp\attiny"

    $testATTINY       = Test-Path $attiny

    $dfpDirSize       = (gci $dfp -rec | measure Length -sum).sum

    $attinyDirSize    = (gci $attiny -rec | measure Length -sum).sum
    $attinyDirSizeMB  = "{0:N2}" -f ((gci $attiny -rec | measure Length -sum).sum / 1MB)



    if (($testATTINY -eq $true) -and ($attinyDirSize -gt 109012000)) {

        $global:dfpStatus = $true

        Write-Host " "
        Write-Host "dfp-attiny    :" $attiny -ForegroundColor Yellow #Blue #Green #Cyan #Yellow
        Write-Host "dfp dir size  : $dfpDirSize bytes" -ForegroundColor Yellow #Blue #Cyan
        Write-Host "attiny size   : $attinyDirSize bytes ($attinyDirSizeMB MB)" -ForegroundColor Yellow

        Write-Host "dfpStatus     :" $dfpStatus


        EXIT

    }

    EXIT

}



EXIT

###   ###   ###   ###   ###   ###   ###   
###   ###   ###   ###   ###   ###   ###   
###   ###   ###   ###   ###   ###   ###   





































EXIT



<#



#>



<#



#>



<#



#>
