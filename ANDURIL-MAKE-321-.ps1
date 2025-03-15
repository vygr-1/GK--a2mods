 
###   ###   ###   ###   ###   ###   ###   ###   ###   ###

# 2025-02-06

# 2025-02-09

# 2025/02/10 

# 2025-02-22

# 2025/02/25 

# 2025-03-09

# 2025-03-16



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



Write-Host "`n  ###   ###   ###   ###   ###   ###   ### `n"
Write-Host "  ANDURIL2 WITH WSL `n" -ForegroundColor Yellow #Yellow #white #Red #Green #Blue

sleep -s $detikS
$DateHMS1 = get-date -format "yyyy-MM-dd HH.mm.ss" 
Write-Host "  `$DateHMS1        : $DateHMS1"

sleep -s $detikS
Write-Host "  `$PSScriptRoot    : $PSScriptRoot " -ForegroundColor Yellow #Yellow #white #Red #Green #Blue

sleep -s $detikS
Write-Host "  `$PSCommandPath   : $PSCommandPath "



###   ###   ###   ###   ###   ###   ###   ###   ###



sleep -s $detikS
Write-Host "`n  WSL: " -ForegroundColor Yellow #Yellow #white #Red #Green #Blue
wsl -l -v



sleep -s $detikS
Write-Host "`n`n  GET-DFP" -ForegroundColor Blue #Yellow #white #Red #Green #Blue

$GetDfp = "$PSScriptRoot\GET-DFP-.ps1"    # This path works. Use "$PSScriptRoot"

# Dot sourcing the DFP script
. $GetDfp    # "waiting" for info if $dfpStatus = $true



sleep -s $detikS



if ($dfpStatus -eq $true)    #  Let's build Anduril!
{

    CD $PSScriptRoot

    sleep -s $detikS
    Write-Host "`n`n`n  ANDURIL MAKE " -ForegroundColor Blue #Yellow #white #Red #Green #Blue

    Write-Host "  a build helper tool for Anduril flashlight firmware " -ForegroundColor Yellow #Yellow #white #Red #Green #Blue

    Write-Host "  
    Usage: ./make TASK

    ... where TASK is:

    anduril         Compile all build targets
    COMPILE-ALL     Compile all build targets
    all             Compile all build targets
    (nothing)       Compile all build targets
    flash FILE      Flash firmare FILE to a hardware device
    clean           Delete generated files
    dfp             Download and install Atmel DFPs
    docs            Convert all .md files to .html
    models          Generate the MODELS file
    release         Zip up all .hex files to prep for publishing a release
    version         Show the current version string
    todo            Show tasks noted in source code files

    ... or TASK can be the name of a build target.
    "



    #  Examples:

    # ./make clean          get rid of old clutter files
    # ./make anduril        compile all anduril build targets
    # ./make emisar nofet   compile all builds matching "emisar" AND "nofet"
    # ./make q8             compile all builds matching "q8" (i.e. Sofirn BLF Q8)
    # ./make flash          '"Not implemented yet."'

    # ./make flash hex/sofirn-blf-q8.hex    '"Not implemented yet."'
    #  Flash the Q8 firmware built in the previous command    '"Not implemented yet."'
    #  (copy/paste the file path printed by the build script)    '"Not implemented yet."'



    ###   ###   ###   ###   ###   ###   ###



    $TASKS       = @(
    'anduril'
    'flash'
    'clean'
    'dfp'
    'docs'
    'models'
    'release'
    'version'
    'todo'

    'COMPILE-ALL'

    )



    ###   ###   ###   ###   ###   ###   ###


    Write-Host "`n`n  TASKS (./make TASK):"
    Write-Host "  " -NoNewline
    Write-Host $TASKS -Separator ", " -ForegroundColor Yellow #Yellow #white #Red #Green #Blue


    $Units      = gci -Path "$PSScriptRoot\hw" -directory -recurse
    Write-Host "`n`n  ALL BUILD TARGETS: "
    Write-Host "  " -NoNewline
    Write-Host $Units.Name -Separator ", " -ForegroundColor Yellow #Yellow #white #Red #Green #Blue


    $ALLTASKS     = $TASKS + $Units.Name


    ###   ###   ###   ###   ###   ###   ###



    Write-Host "`n`n  Choose a TASK or build target on the next screen"

    RKTC2

    Write-host "  " -NoNewline
    $theTASK   = ($ALLTASKS | out-gridview -outputMode Single)



    if ($null -eq $theTASK)    #  TASK is NULL. EXIT!
    {
        $theTASK      = 'null'

        Write-Host "TASK             :" $theTASK -NoNewline -ForegroundColor Yellow #Yellow #white #Red #Green #Blue
        Write-Host ". The TASK is $theTASK. CAN NOT BE PROCESSED!" -ForegroundColor Yellow #Yellow #white #Red #Green #Blue

        theEXIT
    }



    else
    {
        Write-Host "TASK             :" $theTASK -ForegroundColor Yellow #Yellow #white #Red #Green #Blue
        Write-Host "  " -NoNewline
        sleep -s $detikS
        Write-Host "`n==========     WORKING ON IT    ==========`n " -ForegroundColor Yellow #Yellow #white #Red #Green #Blue

        wsl ./make $theTASK
    }

}





else     # ($dfpStatus NOT $true)    # then NO BUILD !
{
    sleep -s $detikS
    Write-Host "`n  NO DFP. NO BUILD!" -ForegroundColor Yellow #Yellow #white #Red #Green #Blue

    sleep -s $detikS
    theEXIT
}



sleep -s $detikS
Write-Host "`n`n  WSL: " -ForegroundColor Yellow #Yellow #white #Red #Green #Blue
wsl -l -v

sleep -s $detikS
$DateHMS2= get-date -format "yyyy-MM-dd HH.mm.ss"
Write-Host "`n  `$DateHMS2        = $DateHMS2 " -NoNewline

theEXIT



































###   ###   ###   ###   ###   ###   ###   ###   ###   ###
###   ###   ###   ###   ###   ###   ###   ###   ###   ###
###   ###   ###   ###   ###   ###   ###   ###   ###   ###

































EXIT

EXIT

EXIT



<#



#>



<#



#>



<#    #  WORKING ON A TASK


    #
    CLS



    Write-Host "`n  TASK             :" $theTASK -ForegroundColor Yellow #Yellow #white #Red #Green #Blue
    Write-Host "  " -NoNewline
    sleep -s $detikS
    Write-Host "`n==========     WORKING ON IT    ==========`n " -ForegroundColor Yellow #Yellow #white #Red #Green #Blue


#>




<#    #  BUILD TARGETS, support file


    sleep -s $detikS
    Write-Host "`n`n  BUILD TARGETS" -ForegroundColor Blue #Yellow #white #Red #Green #Blue

    $getTarget = "$PSScriptRoot\GET-TARGET-383-.ps1"    # This path works. Use "$PSScriptRoot"

    # Dot sourcing the getTarget script
    . $getTarget    #get BUILD TARGETS


#>



<#    #   ALL TASKS
    Write-Host "`n`n  ALL TASKS:"
    Write-Host "  " -NoNewline
    Write-Host $ALLTASKS -Separator ", " -ForegroundColor Yellow #Yellow #white #Red #Green #Blue



    Write-Host "`n`n  ALL TASKS:"
    Write-Host "  " -NoNewline
    Write-Host $ALLTASKS -Separator "`n  " -ForegroundColor Yellow #Yellow #white #Red #Green #Blue
#>



<#    #  TASKS
    Write-Host "`n`n  TASKS:" -ForegroundColor Yellow #Yellow #white #Red #Green #Blue
    Write-Host "  " -NoNewline
    Write-Host $TASKS -Separator ", "


    Write-Host "`n`n  TASKS: "
    Write-Host "  " -NoNewline
    Write-Host $TASKS -Separator "`n  " -ForegroundColor Yellow #Yellow #white #Red #Green #Blue
#>



<#    # Anduril make: a build helper tool for Anduril flashlight firmware



    Write-Host "`n  Anduril make: a build helper tool for Anduril flashlight firmware

  Usage: ./make TASK

  ... where TASK is:

  help            Show this help text
  (nothing)       Compile all build targets
  flash FILE      Flash firmare FILE to a hardware device
  clean           Delete generated files
  dfp             Download and install Atmel DFPs
  docs            Convert all .md files to .html
  models          Generate the MODELS file
  release         Zip up all .hex files to prep for publishing a release
  version         Show the current version string
  todo            Show tasks noted in source code files

  ... or TASK can be the partial name of a build target.

  Examples:

  # get rid of old clutter files
  ./make clean
  # compile all anduril build targets
  ./make anduril
  # compile all builds matching "emisar" AND "nofet"
  ./make emisar nofet
  # compile all builds matching "q8" (i.e. Sofirn BLF Q8)
  ./make q8
  # Flash the Q8 firmware built in the previous command
  # (copy/paste the file path printed by the build script)
  ./make flash hex/sofirn-blf-q8.hex  "




#>



<#

#>


