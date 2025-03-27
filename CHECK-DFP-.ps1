
###   ###   ###   ###   ###   ###   ###


<#    #  Administrator


# pwsh.exe

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process pwsh.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }


#>



# pwsh.exe

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process pwsh.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }



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



###   ###   ###   ###   ###   ###   ###


#   CD $PSScriptRoot

#   Root of the Drive:
$RootDrive        = Split-Path -Path $PSScriptRoot -Qualifier

$arch             = "$PSScriptRoot\arch"
$dfp              = "$PSScriptRoot\arch\dfp"
$attiny           = "$PSScriptRoot\arch\dfp\attiny"

$testDFP          = (Test-Path $dfp)
$testATTINY       = (Test-Path $attiny)

$attinyDirSize    = (gci $attiny -rec | measure Length -sum).sum
$attinyDirSizeMB  = "{0:N2}" -f ((gci $attiny -rec | measure Length -sum).sum / 1MB)



###   ###   ###   ###   ###   ###   ###   
###   ###   ###   ###   ###   ###   ###   
###   ###   ###   ###   ###   ###   ###   



Write-Host "Check dfp-attiny" -ForegroundColor Cyan #Blue #Green #Cyan #Yellow
Write-Host " "
Write-Host "PSCommandPath    : $PSCommandPath "



if (($testATTINY -eq $true) -and ($attinyDirSize -gt 109012000)) {

    Write-Host "valid dfp        : " -NoNewline -ForegroundColor Yellow #Blue #Green #Cyan #Yellow

    $lsdfp = ls -path $dfp
    Write-Host $lsdfp.Name -Separator ", " -ForegroundColor Yellow #Blue #Green #Cyan #Yellow

    Write-Host "attiny dir size  :" $attinyDirSizeMB "MB" -ForegroundColor Yellow #Blue #Green #Cyan #Yellow

    $global:dfpStatus = $true

    Write-Host "dfpStatus        :" $dfpStatus -ForegroundColor Yellow #Blue #Green #Cyan #Yellow

    EXIT

}



else {   # No valid dfp in this repo

    Write-Host "Valid dfp-attiny not found in this repo" -ForegroundColor Yellow #Blue #Green #Cyan #Yellow

}



###   ###   ###   ###   ###   ###   ###   
###   ###   ###   ###   ###   ###   ###   
###   ###   ###   ###   ###   ###   ###   



#  Check dfp, starts from the Root of the Drive
Write-Host " "
Write-Host "Finding attiny... "



$FindingAttiny   = gci -Path $RootDrive\ -Filter "attiny" -recurse 



Foreach ($ATTINYsourceDir in $FindingAttiny) {

    $ATTINYsourceDirSize    = (gci "$ATTINYsourceDir" -rec | measure Length -sum).sum

    $ATTINYsourceDirSizeMB  = "{0:N2}" -f ((gci $ATTINYsourceDir -rec | measure Length -sum).sum / 1MB)


    if ($ATTINYsourceDirSize -gt 109012000) {    # valid ATTINY Dir Size ~109012000)

        Write-Host ""
        Write-Host "ATTINY source    : $ATTINYsourceDir"
        Write-Host "ATTINY size      : $ATTINYsourceDirSize ($ATTINYsourceDirSizeMB MB)" -ForegroundColor Yellow

        BREAK

    }

}



#  Write-host "valid dfp-attiny : $ATTINYsourceDir" -ForegroundColor Yellow #Blue #Green #Cyan #Yellow
gci $ATTINYsourceDir



Write-Host ""
Write-Host ""
Write-Host "###   ###   ###   ###   ###   ###   ###"
Write-Host ""
Write-Host "Copy $ATTINYsourceDir " -ForegroundColor Yellow #Blue #Green #Cyan
Write-Host "into $attiny ? " -NoNewline -ForegroundColor Yellow #Blue #Green #Cyan

# $confirmation = Read-Host "[y]yes, [Enter]no (the default is 'no') "
  $confirmation = Read-Host "[y]yes, [Enter]no"



if ($confirmation -ne "y") {
    Write-Host "No." -ForegroundColor Yellow #Blue #Green #Cyan #Yellow

    $global:dfpStatus = $false

    Write-Host ""
    Write-Host "dfpStatus         :" $dfpStatus

    EXIT

}





elseif ($confirmation -eq 'y') {

    Write-Host "Yes" -ForegroundColor Cyan #Blue #Green #Cyan #Yellow

    #  delete the invalid $dfp first (if any)
    if ($testATTINY -eq $true) {

        Write-Host ""
        Write-Host "Delete the invalid dfp first ..." -ForegroundColor Yellow #Blue #Green #Cyan

#       Remove-Item -Path $dfp -Recurse
        Remove-Item -Path $attiny -Recurse

        Write-Host "invalid dfp is deleted." -ForegroundColor Yellow #Blue #Green #Cyan #Yellow

    }



    $attiny       = "$PSScriptRoot\arch\dfp\attiny"
    $testATTINY   = Test-Path $attiny



    if ($testATTINY -eq $false) {    # then Copy ... $ATTINYsourceDir -Destination $attiny ...

        Write-Host ""
        Write-Host "Copying the valid dfp... " -ForegroundColor Yellow #Blue #Green #Cyan #Yellow

        Copy-Item -Path $ATTINYsourceDir -Destination $attiny -Recurse

    }



    $testATTINY      = Test-Path $attiny
    $attinyDirSize   = (gci $dfp -rec | measure Length -sum).sum



    if (($testATTINY -eq $true) -and ($attinyDirSize -gt 109012000)) {

        Write-Host "valid dfp        : " -NoNewline -ForegroundColor Yellow #Blue #Green #Cyan #Yellow

        $gcidfp = gci -path $dfp
        Write-Host $gcidfp.Name -Separator ", "

        $global:dfpStatus = $true

        Write-Host "dfpStatus        :" $dfpStatus

        EXIT

    }

}





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




<#    #  Administrator


# pwsh.exe

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process pwsh.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }


#>



###   ###   ###   ###   ###   ###   ###
###   ###   ###   ###   ###   ###   ###
###   ###   ###   ###   ###   ###   ###



#Yellow #Green #Blue #Cyan

# -ForegroundColor Cyan #Blue #Green #Cyan #Yellow

#Blue #Green #Cyan #Yellow



###   ###   ###   ###   ###   ###   ###
###   ###   ###   ###   ###   ###   ###
###   ###   ###   ###   ###   ###   ###






<#



#>


