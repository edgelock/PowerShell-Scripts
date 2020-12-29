#Checks for Admin Before Running

Set-ExecutionPolicy -Scope Jhante -ExecutionPolicy Unrestricted

param([switch]$Elevated)
function Check-Admin {
    $currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
    $currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}
if ((Check-Admin) -eq $false) {
    if ($elevated)
{
    # could not elevate, quit
}else {
    Start-Process powershell.exe -Verb RunAs -ArgumentList ('-noprofile -noexit -file "{0}" -elevated' -f ($myinvocation.MyCommand.Definition))
    }
    exit
}

#RTI Install

<#

#How to Run .exe/.msi

Start-Process -FilePath "C:\Users\Jhante\OneDrive - Georgia State University\AA-Win10 Builds\RTI Everything 2015-04-15\RTIc Install\RTIconnect Installer.msi" 

#How to select a specific window to run commands on

$wshell = New-Object -ComObject wscript.shell;
$wshell.AppActivate('RTIconnect Setup')

#Hit Tab 4 times
#Hit Space
#Hit Enter

Sleep 1
$wshell.SendKeys('{TAB}')
Sleep 1
$wshell.SendKeys('{TAB}')
Sleep 1
$wshell.SendKeys('{TAB}')
Sleep 1
$wshell.SendKeys('{TAB}')
Sleep 1
$wshell.SendKeys('{ }')
Sleep 1
$wshell.SendKeys('{ENTER}')
Sleep 3 #You may need to edit this timer for testing purposes depending on the machine you're running the script on.
$wshell.SendKeys('{ENTER}')

#How to move item from A to B
#This is where I move the .cofig file
#The only thing you'll need o edit is the start path from your OneDrive to the actual location on the USB. The move path can stay. 

Copy-Item 'C:\Users\Test\OneDrive - Georgia State University\AA-Win10 Builds\RTI Everything 2015-04-15\RTIc Install\Launch.exe.config' -Destination 'C:\Program Files (x86)\RTI\RTIconnect\NewLaunch' -Force
Sleep 1
Copy-Item 'C:\Users\Test\OneDrive - Georgia State University\AA-Win10 Builds\RTI Everything 2015-04-15\RTIc Install\Launch.exe.config' -Destination 'C:\Program Files (x86)\RTI\RTIconnect\RunLaunch' -Force

#>

<#

#AnyConnect Install
Start-Process -FilePath "C:\Users\Test\OneDrive - Georgia State University\AA-Win10 Builds\Anyconnect\anyconnect-win-4.8.03036-predeploy-k9\Setup.exe"

$wshell = New-Object -ComObject wscript.shell;
$wshell.AppActivate('Cisco AnyConnect Secure Mobility Client Install Selector')

#Key presses to select the items needed for installation
Sleep 1
$wshell.SendKeys('{TAB}')
Sleep 1
$wshell.SendKeys('{TAB}')
Sleep 1
$wshell.SendKeys('{TAB}')
Sleep 1
$wshell.SendKeys('{TAB}')
Sleep 1
$wshell.SendKeys('{TAB}')
Sleep 1
$wshell.SendKeys('{TAB}')
Sleep 1
$wshell.SendKeys('{TAB}')
Sleep 1
$wshell.SendKeys('{TAB}')
Sleep 1
$wshell.SendKeys('{TAB}')
Sleep 1
$wshell.SendKeys('{ }')
Sleep 1
$wshell.SendKeys('{TAB}')
Sleep 1
$wshell.SendKeys('{ }')
Sleep 1
$wshell.SendKeys('{TAB}')
Sleep 1
$wshell.SendKeys('{TAB}')
Sleep 1
$wshell.SendKeys('{TAB}')
Sleep 1
$wshell.SendKeys('{ }')
Sleep 1
$wshell.SendKeys('{TAB}')
Sleep 1
$wshell.SendKeys('{ }')

Sleep 1
$wshell.SendKeys('{TAB}')
Sleep 1
$wshell.SendKeys('{TAB}')
Sleep 1
$wshell.SendKeys('{TAB}')
Sleep 1
$wshell.SendKeys('{TAB}')
Sleep 1
$wshell.SendKeys('{TAB}')
Sleep 1
$wshell.SendKeys('{TAB}')
Sleep 1
$wshell.SendKeys('{ }')

Sleep 1
$wshell.SendKeys('{TAB}')
Sleep 1
$wshell.SendKeys('{TAB}')
Sleep 1
$wshell.SendKeys('{TAB}')
Sleep 1
$wshell.SendKeys('{TAB}')
Sleep 1
$wshell.SendKeys('{TAB}')
Sleep 1
$wshell.SendKeys('{ENTER}')
Sleep 1
$wshell.SendKeys('{ENTER}')

$wshell = New-Object -ComObject wscript.shell;
$wshell.AppActivate('Cisco AnyConnect Secure Mobility Client EULA')
Sleep 1
$wshell.SendKeys('{ENTER}')
Sleep 20
$wshell.SendKeys('{ENTER}') #You may need to edit this time (the install time) for slower machines. 


#Remember you have to change your paths just like last time.
Copy-Item 'C:\Users\Test\OneDrive - Georgia State University\AA-Win10 Builds\Anyconnect\OrgInfo.json' -Destination 'C:\ProgramData\Cisco\Cisco AnyConnect Secure Mobility Client\Umbrella' -Force

#>

<#

#Cisco Jabber Install

Start-Process -FilePath 'C:\Users\Test\OneDrive - Georgia State University\AA-Win10 Builds\CiscoJabber-Install-ffr.12-6-0\CiscoJabberSetup.msi'
Sleep 2 

$wshell = New-Object -ComObject wscript.shell;
$wshell.AppActivate('Cisco Jabber')
Sleep 1
$wshell.SendKeys('{ENTER}')
Sleep 20 #You may need to edit this timer for testing purposes depending on the machine you're running the script on.
$wshell.SendKeys('{TAB}')
Sleep 1
$wshell.SendKeys('{ }')
Sleep 1
$wshell.SendKeys('{TAB}')
Sleep 1
$wshell.SendKeys('{TAB}')
Sleep 1
$wshell.SendKeys('{ENTER}')

#>

#Adobe Install

<#

Start-Process -FilePath 'C:\Users\Test\OneDrive - Georgia State University\AA-Win10 Builds\AcroRdrDC1902120047_en_US.exe'
Sleep 30 #You may need to edit this timer for testing purposes depending on the machine you're running the script on.

$wshell = New-Object -ComObject wscript.shell;
$wshell.AppActivate('Adobe Acrobat Reader DC (Continuous) - Setup')
Sleep 1
$wshell.SendKeys('{ENTER}')
Sleep 30 #You may need to edit this timer for testing purposes depending on the machine you're running the script on.

$wshell = New-Object -ComObject wscript.shell;
$wshell.AppActivate('Adobe Acrobat Reader DC (Continuous) - Setup')
Sleep 1
$wshell.SendKeys('{ENTER}')

#>

#Fire-Eye Install

<#

#Remember you will have to change this filepath.
Start-Process -FilePath 'C:\Users\jcharles\OneDrive - Georgia State University\AA-Win10 Builds\FireEye\xagtSetup_32.30.0_universal.msi'
Sleep 2
$wshell = New-Object -ComObject wscript.shell;
$wshell.AppActivate('FireEye Agent Setup')
Sleep 2
$wshell.SendKeys('{ENTER}')
Sleep 2
$wshell.SendKeys('{ }')
Sleep 2
$wshell.SendKeys('{TAB}')
Sleep 2
$wshell.SendKeys('{TAB}')
Sleep 2
$wshell.SendKeys('{TAB}')
Sleep 2
$wshell.SendKeys('{ENTER}')
Sleep 2
$wshell.SendKeys('{ENTER}')
Sleep 2
$wshell.SendKeys('{ENTER}')
Sleep 40 #You may need to edit this timer for testing purposes depending on the machine you're running the script on.
$wshell.SendKeys('{ENTER}')

#>