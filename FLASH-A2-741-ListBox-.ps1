
###   ###   ###   ###   ###   ###   ###
###   ###   ###   ###   ###   ###   ###
###   ###   ###   ###   ###   ###   ###

# pwsh.exe     # "Administrator"

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process pwsh.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

###   ###   ###   ###   ###   ###   ###
###   ###   ###   ###   ###   ###   ###
###   ###   ###   ###   ###   ###   ###



#  BASIC VARIABLES AND FUNCTIONS

#$ErrorActionPreference  = 'SilentlyContinue'
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



Function RKTC1      #  ReadKeyToContinue
{
    Write-Host "`nPress any key to continue..." -NoNewline -ForegroundColor Yellow #Yellow #white #Red #Green #Blue
    $null = $host.UI.RawUI.ReadKey("NoEcho, includeKeyDown")
    Write-Host " "
}



Function RKTC2      #  ReadKeyToContinue
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





Function DateHMS      #  DateHMS:  get-date -format "yyyy-MM-dd HH.mm.ss"
{

    $DateHMS   = get-date -format "yyyy-MM-dd HH.mm.ss" 

    sleep -s $detikS

    Write-Host "`nDateHMS          : $DateHMS "

}



Function DateHMSe      #  DateHMS:  get-date -format "yyyy-MM-dd HH.mm.ss"
{
    $DateHMSe   = get-date -format "yyyy-MM-dd HH.mm.ss" 
    Write-Host "DateHMS          : $DateHMSe"

}






###   ###   ###   ###   ###   ###   ###



Write-Host "`nFLASH ANDURIL2 USING AVRDUDE `n "


$DateHMS1 = get-date -format "yyyy-MM-dd HH.mm.ss" 
Write-Host "DateHMS          : $DateHMS1" 
Write-Host "`$PSScriptRoot    : $PSScriptRoot " -ForegroundColor Yellow #Yellow #white #Red #Green #Blue
Write-Host "`$PSCommandPath   : $PSCommandPath "



###   ###   ###   ###   ###   ###   ###



#  2025/03/05


#  https://learn.microsoft.com/en-us/powershell/scripting/samples/multiple-selection-list-boxes?view=powershell-7.5
#  Multiple-selection list boxes
#  Article
#  12/10/2022


#  LIST BOX


Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = 'FLASH ANDURIL2'
$form.Size = New-Object System.Drawing.Size(900,600)
$form.StartPosition = 'CenterScreen'


$OKButton = New-Object System.Windows.Forms.Button
$OKButton.Location = New-Object System.Drawing.Point(350,520)
$OKButton.Size = New-Object System.Drawing.Size(75,23)
$OKButton.Text = 'OK'
$OKButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $OKButton
$form.Controls.Add($OKButton)


$CancelButton = New-Object System.Windows.Forms.Button
$CancelButton.Location = New-Object System.Drawing.Point(475,520)
$CancelButton.Size = New-Object System.Drawing.Size(75,23)
$CancelButton.Text = 'Cancel'
$CancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$form.CancelButton = $CancelButton
$form.Controls.Add($CancelButton)


$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10,20)
$label.Size = New-Object System.Drawing.Size(280,25)
$label.Text = 'Please make a selection from the list below:'
$form.Controls.Add($label)


$listBox = New-Object System.Windows.Forms.Listbox
$listBox.Location = New-Object System.Drawing.Point(10,50)
$listBox.Size = New-Object System.Drawing.Size(860,450)

#  Specify one of the following enumerator names: 
#  None, One, MultiSimple, MultiExtended""
   $listBox.SelectionMode = 'One'


#  $listBox.Height = 455
$form.Controls.Add($listBox)
$form.Topmost = $true



###   ###   ###   ###   ###   ###   ###   



$HexDir      = "$PSScriptRoot\hex"
$testHexDir  = Test-Path -Path $HexDir






if ($testHexDir -eq $false)    #  there is no hex dir. NO FLASHING!
{
    Write-Host "`nHex dir          :" $testHexDir -ForegroundColor Yellow #Yellow #white #Red #Green #Blue
    Write-Host "`nThere is no 'hex' directory. NO FLASHING!" -ForegroundColor Yellow #Yellow #Green #Blue

    DateHMS

    theEXIT

}





if ($testHexDir -eq $true)
{
    $hexfile     = gci -Path $HexDir -File *.hex
    $counthex    = ($hexfile).Count

}



if (($testHexDir -eq $true) -and ($counthex -eq 0))    #  there is a hex dir, but no hex file: NO FLASHING!
{
    Write-Host "`nHex file count   :" $counthex -ForegroundColor Yellow #Yellow #Green #Blue
    Write-Host "`nThere is no hex file. NO FLASHING!" -ForegroundColor Yellow #Yellow #white #Red #Green #Blue

    DateHMS

    theEXIT

}




if (($testHexDir -eq $true) -and ($counthex -gt 0))    # hex file is available
{

    Write-host "`nHex file count   :" $counthex -ForegroundColor Yellow #Yellow #Green #Blue
    Write-Host "`nSelect a hex file from the next list..." -ForegroundColor Cyan #Yellow #Green #Blue #Cyan



    RKTC1

    $hexfile | 
    Foreach-Object {

        [void] $listBox.Items.Add($_)

    }


    #    $listBox.SetSelected(0, $true)


}




$result = $form.ShowDialog()



if ($result -eq [System.Windows.Forms.DialogResult]::Cancel)
{

    Write-Host "`nCanceled. NO FLASHING!"


    DateHMS

    theEXIT

}





if ($result -eq [System.Windows.Forms.DialogResult]::OK)
{

    $Selected         =  $listBox.SelectedItems
    $TestTheSelected  =  Test-Path -Path "$Selected"

}






if ($TestTheSelected -eq $false)    #  click the OK button without selecting any item
{

    $Selected      = 'null'

    Write-Host "`nSelected file    :" $Selected -ForegroundColor Yellow #Yellow #Green #Blue
    Write-Host "Test path        :" $TestTheSelected -ForegroundColor Yellow

    Write-Host "`ninvalid selection. NO FLASHING!" -ForegroundColor Yellow #Yellow #Green #Blue


    DateHMS

    theEXIT

}






if ($TestTheSelected -eq $true)
{

    Write-Host "`nSelected file    :" $Selected -ForegroundColor Yellow #Yellow #Green #Blue
    Write-Host "Test path        :" $TestTheSelected -ForegroundColor Yellow

    Write-Host "`nFLASH ANDURIL2..." -ForegroundColor Cyan #Yellow #white #Red #Green #Blue #Cyan



    RKTC1

    Write-Host " "

    CD $PSScriptRoot

    .\xAVRDUDE-v8.0\avrdude.exe -p attiny1616 -c serialupdi -P com5 -Uflash:w:$Selected



    DateHMS

    theEXIT

}




DateHMS

theEXIT





EXIT
EXIT
EXIT


###   ###   ###   ###   ###   ###   ###   
###   ###   ###   ###   ###   ###   ###   
###   ###   ###   ###   ###   ###   ###   














<#



#>



<#



#>




<#



#>



<#



#>



<#



#>



<#



#>



<#



#>








