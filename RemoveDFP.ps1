


###   ###   ###   ###   ###   ###   ###   ###   ###   ###



# pwsh.exe


if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process pwsh.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }



###   ###   ###   ###   ###   ###   ###   ###   ###   ###





$date        = Get-Date -format "yyyy-MM-dd"
$dTime       = Get-Date -format "yyyy-MM-dd HH:mm:ss"
$dTimeF      = Get-Date -format "yyMMdd_HHmmss"

$detikS      = 0.1
$detikM      = 0.3
$detikL      = 1
$detikXL     = 2
$detikEXIT   = 1



$PROMPTTT    = 0





#  2025-03-08 07:07
#  copied from `get-targets--v1.73.ps1`  
#  ReadKeyToContinue  
Function ReadKeyToContinue
{
    sleep -s $detikS
    Write-Host "`n    Press any key to continue..." -NoNewline -ForegroundColor Yellow #Yellow #white #Red #Green #Blue

    $null = $host.UI.RawUI.ReadKey("NoEcho, includeKeyDown")

    sleep -s $detikS
    Write-Host ""
}





#  2025-03-08 07:07
#  copied from `get-targets--v1.73.ps1`  
#  theEXIT
Function theEXIT
{
    sleep -s $detikS
    Write-Host "`n    Done!" -NoNewline -ForegroundColor Yellow #Yellow #white #Red #Green #Blue

    sleep -s $detikS
    Write-Host "  Press any key to EXIT..." -NoNewline -ForegroundColor Yellow #Yellow #white #Red #Green #Blue

    $null = $host.UI.RawUI.ReadKey("NoEcho, includeKeyDown")

    sleep -s $detikS
    Write-Host "  EXIT in $detikEXIT second..." -NoNewline -ForegroundColor Yellow #Yellow #white #Red #Green #Blue

    sleep -s $detikEXIT
    Exit
}





###   ###   ###   ###   ###   ###   ###   ###   ###
###   ###   ###   ###   ###   ###   ###   ###   ###
###   ###   ###   ###   ###   ###   ###   ###   ###



Write-Host "`n`n    ###   ###   ###   ###   ###   ###   ###   ###   ###   ### `n"
Write-Host "    REMOVE dfp ... `n "



sleep -s $detikS
$DateHMS = get-date -format "yyyy-MM-dd HH.mm.ss" 
Write-Host "    `$DateHMS         = $DateHMS"


sleep -s $detikS
Write-Host "    `$PSScriptRoot    =" -NoNewline
Write-Host " $PSScriptRoot " -ForegroundColor Yellow #Yellow #white #Red #Green #Blue


sleep -s $detikS
Write-Host "    `$PSCommandPath   = $PSCommandPath  "



###   ###   ###   ###   ###   ###   ###   ###   ###



$dfp         = "$PSScriptRoot\arch\dfp"

$checkDFPdir = (Test-Path $dfp)



###   ###   ###   ###   ###   ###   ###   ###   ###



# sleep -s $detikS

if ($checkDFPdir -eq $false)
{

    sleep -s $detikS
    Write-Host "`n    dfp not found in " -NoNewline
    Write-Host " $PSScriptRoot\arch\" -ForegroundColor Yellow
    Write-Host "    Cannot find path  $dfp  because it does not exist.  LoL!" -ForegroundColor Blue #Yellow #white #Red #Green #Blue
    sleep -s $detikS

}





if ($checkDFPdir -eq $true)
{

    sleep -s $detikS
    Write-Host "`n    dfp found in" -NoNewline
    Write-Host " $PSScriptRoot\arch\" -NoNewline -ForegroundColor Yellow


    sleep -s $detikS
    $lsdfp = ls -path $dfp
    #  Write-Host "  " -NoNewline
    $lsdfp


    sleep -s $detikS
    Write-Host "`n`n    Delete dfp directory..."


    # Remove-Item -Path $dfp -Recurse
    del -Path $dfp -Recurse

    sleep -s $detikM
    sleep -s $detikM



    sleep -s $detikS
    Write-Host "    Recheck dfp ..."



    $checkDFPdir = (Test-Path $dfp)

    if ($checkDFPdir -eq $false)
    {

        sleep -s $detikS
        Write-Host "    dfp has been deleted from" -NoNewline -ForegroundColor Blue #Yellow #white #Red #Green #Blue
        Write-Host " $PSScriptRoot\arch\" -ForegroundColor Yellow #Yellow #white #Red #Green #Blue
        sleep -s $detikS

    }

}





# EXIT . . .
theEXIT










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


