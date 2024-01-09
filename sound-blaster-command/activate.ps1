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

Function GetSBCommandProcesses {
    Process {
        return Get-Process | Where-Object { "Creative.SBCommand" -eq $_.ProcessName }
    }
}

$processes = GetSBCommandProcesses
$running = 0 -ne $processes.length
if($running -and (0 -ne $processes[0].MainWindowHandle)) {
    [Microsoft.VisualBasic.Interaction]::AppActivate($processes[0].Id)
    exit
}

[Microsoft.VisualBasic.Interaction]::Shell(
    "C:\Program Files (x86)\Creative\Sound Blaster Command\Creative.SBCommand.exe",
    [Microsoft.VisualBasic.AppWinStyle]::NormalFocus
)

# Wait creating application window
while ((GetSBCommandProcesses)[0].MainWindowHandle -eq 0) {
    Start-Sleep -Milliseconds 500
}

# Wait initialization
if(-not $running) {
    Start-Sleep 5
}
