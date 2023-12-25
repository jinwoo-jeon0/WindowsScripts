# Get cursor position
# Write-Warning ([System.Windows.Forms.Cursor]::Position)

# http://powershellcustoms.com/powershell-functions-to-move-mouse-cursor-and-do-a-click/

Add-Type -AssemblyName System.Windows.Forms

Function MoveMouse {
    Param ([int]$x, [int]$y)

    Process {
        [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($x, $y)
    }
}

$Mouse=@'
[DllImport("user32.dll",CharSet=CharSet.Auto, CallingConvention=CallingConvention.StdCall)]
public static extern void mouse_event(long dwFlags, long dx, long dy, long cButtons, long dwExtraInfo);
'@

$SendMouseClick = Add-Type -memberDefinition $Mouse -name "Win32MouseEventNew" -namespace Win32Functions -passThru

Function Click {
    Process {
        $SendMouseClick::mouse_event(0x00000002, 0, 0, 0, 0);
        $SendMouseClick::mouse_event(0x00000004, 0, 0, 0, 0);
    }
}

MoveMouse -x 27 -y 1104
Click

MoveMouse -x 279 -y 883
Click

# Dolby Audio
# MoveMouse -x 279 -y 948
# Click

# DTS
# MoveMouse -x 279 -y 1031
# Click
