# Get cursor position
# Write-Warning ([System.Windows.Forms.Cursor]::Position)

# http://powershellcustoms.com/powershell-functions-to-move-mouse-cursor-and-do-a-click/

# https://superuser.com/questions/1411138/asking-for-a-way-of-taking-screenshot-of-2nd-desktop-when-the-desktop-is-extende/1411215#1411215
# Write-Output ([System.Windows.Forms.SystemInformation]::VirtualScreen)

#
# Activate Sound Blaster Command
#
Add-Type -AssemblyName Microsoft.VisualBasic

Function GetSBCommandProcesses {
    Process {
        return Get-Process | Where-Object { "Creative.SBCommand" -eq $_.ProcessName }
    }
}

# https://learn.microsoft.com/en-us/archive/msdn-technet-forums/4d257c80-557a-4625-aad3-f2aac6e9a1bd
$code = @'
    [DllImport("user32.dll")]
     public static extern IntPtr GetForegroundWindow();
'@
Add-Type $code -Name Utils -Namespace Win32
$local:hwnd = [Win32.Utils]::GetForegroundWindow()
$local:PrevProcess = Get-Process | Where-Object { $_.MainWindowHandle -eq $local:hwnd }

$local:processes = GetSBCommandProcesses
$running = 0 -ne $local:processes.length
if($running -and (0 -ne $local:processes[0].MainWindowHandle)) {
    [Microsoft.VisualBasic.Interaction]::AppActivate($local:processes[0].Id)
    return $local:PrevProcess
}

Start-Process -FilePath "C:\Program Files (x86)\Creative\Sound Blaster Command\Creative.SBCommand.exe"

# Wait creating application window
while ((GetSBCommandProcesses)[0].MainWindowHandle -eq 0) {
    Start-Sleep -Milliseconds 500
}

# Wait initialization
if(-not $running) {
    Start-Sleep 5
}

return $local:PrevProcess
