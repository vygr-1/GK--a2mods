 
###   ###   ###   ###   ###   ###   ###

# 2025-03-16



###   ###   ###   ###   ###   ###   ###


#  BASIC VARIABLES AND FUNCTIONS

$ErrorActionPreference  = 'SilentlyContinue'


###   ###   ###   ###   ###   ###   ###



sleep -s $detikS

#  ANDURIL MAKE

Write-Host "a build helper tool for Anduril flashlight firmware " -ForegroundColor Yellow #Yellow #white #Red #Green #Blue

Write-Host "  
Usage: ./make TASK"

Write-Host "
... where" -NoNewline
Write-Host " TASK" -NoNewline -ForegroundColor Yellow #Yellow #white #Red #Green #Blue
Write-Host " is: "

Write-Host "
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
  "


#  ... or TASK can be the name of a BUILD TARGET.
Write-Host "... or" -NoNewline
Write-Host " TASK" -NoNewline -ForegroundColor Yellow #Yellow #white #Red #Green #Blue
Write-Host " can be the name of a" -NoNewline
Write-Host " BUILD TARGET" -ForegroundColor Yellow #Yellow #white #Red #Green #Blue



    ###   ###   ###   ###   ###   ###   ###


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



Write-Host "`n`nTASKS:"

Write-Host $TASKS -Separator ", " -ForegroundColor Yellow #Yellow #white #Red #Green #Blue



$Units         = gci -Path "$PSScriptRoot\hw" -directory -recurse

Write-Host "`n`nBUILD TARGETS: "

Write-Host $Units.Name -Separator ", " -ForegroundColor Yellow #Yellow #white #Red #Green #Blue



$ALLTASKS      = $TASKS + $Units.Name



###   ###   ###   ###   ###   ###   ###



Write-Host "`n`nChoose a TASK or BUILD TARGET on the next screen"

RKTC2

$theTASK   = ($ALLTASKS | out-gridview -Title "ANDURIL MAKE, TASKS, BUILD TARGETS" -PassThru)


Write-Host "`n==========================================" -ForegroundColor Yellow #Yellow #white #Red #Green #Blue

Write-Host "`nSELECTED TASK    :" $theTASK -ForegroundColor Yellow #Yellow #white #Red #Green #Blue

Write-Host "`n==========================================" -ForegroundColor Yellow #Yellow #white #Red #Green #Blue



###   ###   ###   ###   ###   ###   ###



#  EXIT



###   ###   ###   ###   ###   ###   ###
###   ###   ###   ###   ###   ###   ###
###   ###   ###   ###   ###   ###   ###

































<#



#>



<#



#>





<#

#>


