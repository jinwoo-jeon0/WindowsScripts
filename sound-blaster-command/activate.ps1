# Get cursor position
# Write-Warning ([System.Windows.Forms.Cursor]::Position)

# http://powershellcustoms.com/powershell-functions-to-move-mouse-cursor-and-do-a-click/

# https://superuser.com/questions/1411138/asking-for-a-way-of-taking-screenshot-of-2nd-desktop-when-the-desktop-is-extende/1411215#1411215
# Write-Output ([System.Windows.Forms.SystemInformation]::VirtualScreen)

#
# Activate Sound Blaster Command
#
# https://devblogs.microsoft.com/scripting/provide-input-to-applications-with-powershell/
Add-Type -AssemblyName Microsoft.VisualBasic

# [Microsoft.VisualBasic.Interaction]::AppActivate((Get-Process -Name Creative.SBCommand)[0].Id)
$notepadID = [Microsoft.VisualBasic.Interaction]::Shell("C:\Program Files (x86)\Creative\Sound Blaster Command\Creative.SBCommand.exe", [Microsoft.VisualBasic.AppWinStyle]::NormalFocus)
