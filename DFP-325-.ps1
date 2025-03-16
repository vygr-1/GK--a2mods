
###   ###   ###   ###   ###   ###   ###

# pwsh.exe

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process pwsh.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

###   ###   ###   ###   ###   ###   ###



#  BASIC VARIABLES AND FUNCTIONS

$ErrorActionPreference  = 'SilentlyContinue'
$ProgressPreference     = 'SilentlyContinue'



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



# Root of the Drive:
$RootDrive        = Split-Path -Path $PSScriptRoot -Qualifier

$arch             = "$PSScriptRoot\arch"
$dfp              = "$PSScriptRoot\arch\dfp"
$attiny           = "$PSScriptRoot\arch\dfp\attiny"

$testDFP          = (Test-Path $dfp)
$testATTINY       = (Test-Path $attiny)

$attinyDirSize    = (gci $attiny -rec | measure Length -sum).sum
$attinyDirSizeMB  = "{0:N2}" -f ((gci $attiny -rec | measure Length -sum).sum / 1MB)

$TotalDfpDirCount = 0
$FalseDfpDirCount = 0
$TrueDfpDirCount  = 0



###   ###   ###   ###   ###   ###   ###   



Function Function03    #  Function03
{
    Begin
    {
        sleep -s $detikS
        Write-Host "Searching for dfp..."
    }



    Process
    {
        $testATTINYsource  = Test-Path "$_\attiny"
        $ATTINYsourceSize  = (gci "$_\attiny" -rec | measure Length -sum).sum

        if (  ($testATTINYsource -eq $true) -and ($ATTINYsourceSize -gt 100000000) -and ($TrueDfpDirCount -eq 0)  )
        {
            $global:ATTINYsource = "$_\attiny"
            $global:TrueDfpDirCount++
        }
    }



    End
    {

    }
}



###   ###   ###   ###   ###   ###   ###   
###   ###   ###   ###   ###   ###   ###   
###   ###   ###   ###   ###   ###   ###   



sleep -s $detikS
Write-Host "`$PSCommandPath   : $PSCommandPath "


#  2025-03-08  
if (($testATTINY -eq $true) -and ($attinyDirSize -gt 100000000))    # Go ahead, build Anduril!
{
    sleep -s $detikS
    Write-Host "Valid dfp-attiny in this repo: " -NoNewline -ForegroundColor Yellow #Yellow #white #Red #Green #Blue

    $lsdfp = ls -path $dfp
    Write-Host $lsdfp.Name -Separator ", "

    Write-Host "dfp-attiny directory size:" -NoNewline
    Write-Host " $attinyDirSizeMB MB." -NoNewline -ForegroundColor Yellow #Yellow #white #Red #Green #Blue

    $dfpStatus = $true

    Write-Host " dfp is good."

    sleep -s $detikS
    EXIT

}



else    # No valid dfp in this repo
{
    sleep -s $detikS
    Write-Host "Valid dfp not found in this repo" -ForegroundColor Yellow   #Yellow #white #Red #Green #Blue

}


# Check dfp, starts from the Root of the Drive
gci -Path $RootDrive -Filter "dfp" -recurse | Function03


sleep -s $detikS
Write-host "`nValid dfp found here: " -NoNewline -ForegroundColor Yellow #Yellow #white #Red #Green #Blue
gci $ATTINYsource


Write-Host "`n`nATTINYsource     : $ATTINYsource"


$testATTINYsource    = (Test-Path $ATTINYsource)
$ATTINYsourceSize    = (gci $ATTINYsource -rec | measure Length -sum).sum
$ATTINYsourceSizeMB  = "{0:N2}" -f ((gci $ATTINYsource -rec | measure Length -sum).sum / 1MB)


Write-Host "Size:" -NoNewline
Write-Host " $ATTINYsourceSizeMB MB" -ForegroundColor Yellow #Yellow #white #Red #Green #Blue


sleep -s $detikS
Write-Host "`nCopy" -NoNewline
Write-Host " $ATTINYsource" -NoNewline -ForegroundColor Yellow #Yellow #white #Red #Green #Blue
Write-Host " into" -NoNewline
Write-Host " $attiny" -NoNewline -ForegroundColor Yellow #Yellow #white #Red #Green #Blue
Write-Host "? " -NoNewline



$confirmation = Read-Host "(Y/N)"

if ($confirmation -ne "Y")
{
    sleep -s $detikS
    Write-Host "No." -ForegroundColor Yellow #Yellow #white #Red #Green #Blue

    $dfpStatus = $false

    sleep -s $detikS
    Write-Host "`ndfpStatus is $dfpStatus"

    sleep -s $detikS
    EXIT

}





elseif ($confirmation -eq 'Y')
{
    sleep -s $detikS
    Write-Host "Yes" -ForegroundColor Cyan #Yellow #white #Red #Green #Blue #Cyan

    #  delete the invalid $dfp first (if any)
    if ($testDFP -eq $true)
    {
        sleep -s $detikS
        Write-Host "`nDelete the invalid" -NoNewline
        Write-Host " dfp" -NoNewline -ForegroundColor Yellow #Yellow #white #Red #Green #Blue
        Write-Host " first ..."

        del -Path $dfp -Recurse
        sleep -s $detikL

        Write-Host "invalid" -NoNewline
        Write-Host " dfp" -NoNewline -ForegroundColor Yellow #Yellow #white #Red #Green #Blue
        Write-Host " is deleted."

    }



    $attiny       = "$PSScriptRoot\arch\dfp\attiny"
    $testATTINY   = Test-Path $attiny



    if ($testATTINY -eq $false)    # then: Copy-Item -Path $ATTINYsource -Destination $attiny -Recurse
    {
        sleep -s $detikS
        Write-Host "`nCopying the valid" -NoNewline
        Write-Host " dfp" -NoNewline -ForegroundColor Yellow #Yellow #white #Red #Green #Blue
        Write-Host " ..."

        sleep -s $detikS
        Copy-Item -Path $ATTINYsource -Destination $attiny -Recurse

    }



    $testATTINY      = Test-Path $attiny
    $attinyDirSize   = (gci $dfp -rec | measure Length -sum).sum



    if (($testATTINY -eq $true) -and ($attinyDirSize -gt 100000000))    # Go ahead, build Anduril!
    {
        sleep -s $detikS
        Write-Host "`nValid dfp-attiny in this repo: " -NoNewline -ForegroundColor Yellow   #Yellow #white #Red #Green #Blue


        sleep -s $detikS
        $gcidfp = gci -path $dfp
        Write-Host $gcidfp.Name -Separator ", "


        sleep -s $detikS
        $dfpStatus = $true


        sleep -s $detikS
        Write-Host "`ndfpStatus is $dfpStatus"


        sleep -s $detikS
        EXIT

    }

}




































###   ###   ###   ###   ###   ###   ###
###   ###   ###   ###   ###   ###   ###   
###   ###   ###   ###   ###   ###   ###   

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


