
###   ###   ###   ###   ###   ###   ###

# pwsh.exe

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process pwsh.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

###   ###   ###   ###   ###   ###   ###



$detikS      = 0.1
$detikM      = 0.3
$detikL      = 1
$detikXL     = 2
$detikEXIT   = 1



sleep -s $detikS



Function RKTC    #  ReadKeyToContinue
{
    Write-Host "`n  Press any key to continue..." -NoNewline -ForegroundColor Yellow #Yellow #white #Red #Green #Blue
    $null = $host.UI.RawUI.ReadKey("NoEcho, includeKeyDown")
    Write-Host "  "
}



Function RKTC2    #  ReadKeyToContinue
{
    Write-Host "`n  " -NoNewline -ForegroundColor Yellow #Yellow #white #Red #Green #Blue
    $null = $host.UI.RawUI.ReadKey("NoEcho, includeKeyDown")
    Write-Host "  "
}



Function theEXIT    #  EXIT
{
    Write-Host "`n  Done! Press any key to EXIT..." -NoNewline -ForegroundColor Yellow #Yellow #white #Red #Green #Blue
    $null = $host.UI.RawUI.ReadKey("NoEcho, includeKeyDown")

    Write-Host " EXIT in $detikEXIT second..." -NoNewline -ForegroundColor Yellow #Yellow #white #Red #Green #Blue
    sleep -s $detikEXIT

    Write-Host " " -NoNewline
    EXIT
}



###   ###   ###   ###   ###   ###   ###



# Root of the Drive:
$RootDrive   = Split-Path -Path $PSScriptRoot -Qualifier

$arch        = "$PSScriptRoot\arch"
$dfp         = "$PSScriptRoot\arch\dfp"
$attiny      = "$PSScriptRoot\arch\dfp\attiny"

$testDFP     = (Test-Path $dfp)
$testATTINY  = (Test-Path $attiny)

$attinyDirSize   = (gci $attiny -rec   -errorAction SilentlyContinue | measure Length -sum).sum
$attinyDirSizeMB = "{0:N2}" -f ((gci $attiny -rec   -errorAction SilentlyContinue | measure Length -sum).sum / 1MB)

$TotalDfpDirCount = 0
$FalseDfpDirCount = 0
$TrueDfpDirCount  = 0



###   ###   ###   ###   ###   ###   ###   



Function Function03    #  Function03
{
    Begin
    {
        sleep -s $detikS
        Write-Host "  Searching for dfp..."
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
Write-Host "  `$PSCommandPath   : $PSCommandPath "



#  2025-03-08  
if (($testATTINY -eq $true) -and ($attinyDirSize -gt 100000000))    # Go ahead, build Anduril!
{

    sleep -s $detikS
    Write-Host "  Valid dfp-attiny in this repo: " -NoNewline -ForegroundColor Yellow   #Yellow #white #Red #Green #Blue

    sleep -s $detikS
    $lsdfp = ls -path $dfp
    Write-Host $lsdfp.Name -Separator ", "


    Write-Host "  dfp-attiny directory size:" -NoNewline
    Write-Host " $attinyDirSizeMB MB." -NoNewline -ForegroundColor Yellow #Yellow #white #Red #Green #Blue


    $dfpStatus = $true
    #    sleep -s $detikS
    Write-Host " dfp is good."


    sleep -s $detikS
    EXIT
}





else    # No valid dfp in this repo
{
    sleep -s $detikS
    Write-Host "  Valid dfp not found in this repo" -ForegroundColor Yellow   #Yellow #white #Red #Green #Blue

}





# Check dfp, starts from the Root of the Drive
gci -Path $RootDrive -Filter "dfp" -recurse | Function03


sleep -s $detikS
Write-host "`n  Valid dfp found here: " -NoNewline -ForegroundColor Yellow #Yellow #white #Red #Green #Blue
gci $ATTINYsource


Write-Host "`n`n  ATTINYsource        = $ATTINYsource  "





$testATTINYsource    = (Test-Path $ATTINYsource)
$ATTINYsourceSize    = (gci $ATTINYsource -rec | measure Length -sum).sum
$ATTINYsourceSizeMB  = "{0:N2}" -f ((gci $ATTINYsource -rec | measure Length -sum).sum / 1MB)


Write-Host "`n`n  Size:" -NoNewline
Write-Host " $ATTINYsourceSizeMB MB" -ForegroundColor Yellow #Yellow #white #Red #Green #Blue
#  Write-Host " $ATTINYsourceSize bytes ($ATTINYsourceSize MB)" -ForegroundColor Yellow #Yellow #white #Red #Green #Blue





sleep -s $detikS
Write-Host "`n  Copy" -NoNewline
Write-Host " $ATTINYsource" -NoNewline -ForegroundColor Yellow #Yellow #white #Red #Green #Blue
Write-Host " into" -NoNewline
Write-Host " $attiny" -NoNewline -ForegroundColor Yellow #Yellow #white #Red #Green #Blue
Write-Host " ?"





sleep -s $detikS
$confirmation = Read-Host "  (Y/N)"



if ($confirmation -ne "Y")
{
    sleep -s $detikS
    Write-Host "  No." -ForegroundColor Red #Yellow #white #Red #Green #Blue


    sleep -s $detikS
    $dfpStatus = $false


    sleep -s $detikS
    Write-Host "`n  `$dfpStatus is $dfpStatus"


    sleep -s $detikS
    EXIT

}





elseif ($confirmation -eq 'Y')
{
    sleep -s $detikS
    Write-Host "  Yes" -ForegroundColor Yellow #Yellow #white #Red #Green #Blue



    #  delete the invalid $dfp first (if any)
    if ($testDFP -eq $true)
    {
        sleep -s $detikS
        Write-Host "`n  Delete the invalid" -NoNewline
        Write-Host " dfp" -NoNewline -ForegroundColor Yellow #Yellow #white #Red #Green #Blue
        Write-Host " first ..."

        del -Path $dfp -Recurse
        sleep -s $detikL


        Write-Host "  invalid" -NoNewline
        Write-Host " dfp" -NoNewline -ForegroundColor Yellow #Yellow #white #Red #Green #Blue
        Write-Host " is deleted."
    }



    $attiny       = "$PSScriptRoot\arch\dfp\attiny"

    $testATTINY   = Test-Path $attiny



    if ($testATTINY -eq $false)    # then: Copy-Item -Path $ATTINYsource -Destination $attiny -Recurse
    {
        sleep -s $detikS
        Write-Host "`n  Copying the valid" -NoNewline
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
        Write-Host "`n  Valid dfp is found in this Repo" -NoNewline -ForegroundColor Yellow   #Yellow #white #Red #Green #Blue


        sleep -s $detikS
        $gcidfp = gci -path $dfp
        Write-Host $gcidfp.Name -Separator ", "



        sleep -s $detikS
        $dfpStatus = $true


        sleep -s $detikS
        Write-Host "`n`n  `$dfpStatus is $dfpStatus"


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



<#    VARIABLES



#  $checkDFPdir = (Test-Path $dfp)
#  $testDFPdir  = (Test-Path $dfp)
#  2025-03-08:  
#  $CheckSlimDfp = (Test-Path $dfp) -and (Test-Path $dfpAttiny)
#  2025-03-09:  
#  $checkDFPattiny  = (Test-Path $dfpAttiny)
#  $checkATTINY
#  $CheckSlimDfp
#  $testattiny     = (Test-Path $attiny)



#>




<#



    sleep -s $detikS
    Write-Host "    Searching for dfp\attiny..."
    sleep -s $detikS



    # Check dfp in the Root of the Drive
    # $global:TestDfpSource = (Test-Path "$_\attiny")

    #  $global:DfpSource = "dfp\attiny"
    #  $DfpSource = "dfp\attiny"
    #  $DfpSource = "dfp\attiny"
    # $TestDfpSource = Test-Path -Path $DfpSource
    #  $attinySourceDirSize  = (gci $DfpSource -rec | measure Length -sum).sum

    #  gci -Path $RootDrive -recurse -directory "dfp\attiny" | Function03




#>




<#




# Root of the Drive:
$RootDrive   = Split-Path -Path $PSScriptRoot -Qualifier



$arch        = "$PSScriptRoot\arch"

$dfp         = "$PSScriptRoot\arch\dfp"
$dfpAttiny   = "$PSScriptRoot\arch\dfp\attiny"
$dfpAvrdd    = "$PSScriptRoot\arch\dfp\avrdd"
$dfpZip      = "$PSScriptRoot\arch\dfp\zip"




#>



<#


    #  $DirSize = (gci $DfpSource -rec | measure Length -sum).sum

    #  $DirSizeMB = "{0:N2}" -f ((gci $DfpSource -rec | measure Length -sum).sum / 1MB)

    #  Write-Host "`n`n    ###   ###   ###   ###   ###   ###   ###   ###   ###   ### `n"

    #  Write-Host "    dfp directory size : $AttinyDirSize BYTES" -ForegroundColor Yellow #Yellow #white #Red #Green #Blue

    #  RKTC


#>




<#


        Write-Host "`n`n    size : $DirSizeMB MB" -NoNewline
        Write-Host " ($DirSize BYTES)" -NoNewline -ForegroundColor Yellow #Yellow #white #Red #Green #Blue
        Write-Host " (Very Large BYTES) "

        Write-host "    This one is a" -NoNewline
        Write-host " $TestPathDfp" -NoNewline -ForegroundColor Yellow #Yellow #white #Red #Green #Blue
        Write-host " dfp directory"

        Write-Host "`n    ###   ###   ###   ###   ###   ###   ###   ###   ###   ### `n"

        RKTC

        #  break


#>


<#


# dfp in Root of the Drive (e.g. Drive D:\) :
$Ddfp        = "$RootDrive\dfp"
$DdfpAttiny  = "$RootDrive\dfp\attiny"
$DdfpAvrdd   = "$RootDrive\dfp\avrdd" 
$DdfpZip     = "$RootDrive\dfp\zip"



#>



<#


#  Write-Host "`n`n    ###   ###   ###   ###   ###   ###   ###   ###   ###   ### `n`n"



#  theDFP
function theDFP
{

    Write-host "`n    Limited search of dfp directories in Drive $RootDrive\" 
    Write-host "    TOTAL   : $TrueDfpDirCount" -ForegroundColor Yellow #Yellow #white #Red #Green #Blue
    Write-host "    VALID   : $TrueDfpDirCount of $TrueDfpDirCount" -ForegroundColor Yellow #Yellow #white #Red #Green #Blue
    # Write-host "    INVALID : $FalseDfpDirCount" -ForegroundColor Yellow #Yellow #white #Red #Green #Blue

    # RKTC

}



#  $TotalDfpDirCount = 0
#  $TrueDfpDirCount = 0
#  $FalseDfpDirCount = 0
#  $TestPathDfp = (Test-Path "$_\attiny") -and (Test-Path "$_\avrdd" ) -and (Test-Path "$_\zip") 


#>



<#




# $FindDfp   = gci -Path $RootDrive -recurse -filter -directory 

# $FindDfp   = gci -Path $PSScriptRoot -recurse -filter -directory 

# $FindDfp | myFilter

# gci -Path $PSScriptRoot -recurse -directory | myFilter

# gci -Path $PSScriptRoot -recurse | myFilter



#>


<#



#  gci -Path $RootDrive -recurse -file "dfp" | DfpFilter

gci -Path $RootDrive -recurse -directory "dfp" | DfpFilter

theDFP

Write-host "`n    what's next?" 

theEXIT




#>


<#


    $global:TotalDfpDirCount++
    Write-host "`n    Found dfp directory No. $TotalDfpDirCount : " -NoNewline
    Write-host "    $_" -ForegroundColor Yellow #Yellow #white #Red #Green #Blue



    Write-Host "    size =   $DirSizeMB MB "
    Write-Host "    size =   $DirSize BYTES"


    if($DirSize -gt 190000000)
    {

        Write-Host "    (Very Large BYTES) "

    }


#>



<#



    if($TestPathDfp -eq $false)
    {

        $global:FalseDfpDirCount++



        Write-host "    This is a" -NoNewline
        Write-host " $TestPathDfp" -NoNewline -ForegroundColor Yellow #Yellow #white #Red #Green #Blue
        Write-host " dfp directory"

        gci $_


        Write-Host "`n`n    ###   ###   ###   ###   ###   ###   ###   ###   ###   ### `n`n"

    }


#>


<#




    Write-Host "    size =   $DirSizeMB MB "

    $DirSizeMB


    if($DirSizeMB -gt 190000000)
    {

        Write-Host "    (Large MEGABYTES directories) "

    }



#>



<#


    #  $sizeofdir = gci $_ -rec | measure Length -sum
    #  $sizeofdir = (gci $_ -rec | measure Length -sum).sum / 1MB

    $sizeofdir = "{0:N2}" -f ((gci $_ -rec | measure Length -sum).sum / 1MB)

    Write-Host "    size =   $sizeofdir MB"

    Write-Host "`n"



#>


<#








    if (($_.Name -eq "dfp") -and ($TrueDfpDirCount -gt 3))
    {
        break
        
    }















RKTC

RKTC

Break

RKTC

RKTC

RKTC



#>



<#


$global:DfpDirCount = 0
$global:TrueDfpDirCount = 0
$global:FalseDfpDirCount = 0


#>




<#


Write-host "    dfp directories in Drive $RootDrive\" 
Write-host "    TOTAL   : $TotalDfpDirCount" -ForegroundColor Yellow #Yellow #white #Red #Green #Blue
Write-host "    VALID   : $TrueDfpDirCount" -ForegroundColor Yellow #Yellow #white #Red #Green #Blue
Write-host "    INVALID : $FalseDfpDirCount" -ForegroundColor Yellow #Yellow #white #Red #Green #Blue



#>


<#







        if($TrueDfpDirCount -eq 3)
        {
            theDFP
        }





        if($TestPathDfp -eq $true)
        {

            $global:TrueDfpDirCount++

            Write-host "    $TestPathDfp" -ForegroundColor Yellow #Yellow #white #Red #Green #Blue
            Write-host "    This is a" -NoNewline
            Write-host " VALID" -NoNewline -ForegroundColor Yellow #Yellow #white #Red #Green #Blue
            Write-host " dfp directory"

            gci $_

        }

















            #  if($TrueDfpDirCount -eq 5)
            if($TrueDfpDirCount -eq 3)
            {

                Write-host "`n`n    so far, we have found" -NoNewline
                Write-host " $TrueDfpDirCount VALID dfp directories" -NoNewline -ForegroundColor Yellow #Yellow #white #Red #Green #Blue
                Write-host " in Drive $RootDrive\" 

                RKTC

            }


#>
















