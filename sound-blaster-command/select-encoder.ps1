$ErrorActionPreference = "Stop"

$script:PrevProcess = . "$PSScriptRoot\activate.ps1"

. "$PSScriptRoot\..\mouse.ps1"

$encoders = @{
    none = @{
        position = New-Object System.Drawing.Point(279, 883)
    }
    dd = @{
        position = New-Object System.Drawing.Point(279, 948)
    }
    dts = @{
        position = New-Object System.Drawing.Point(279, 1031)
    }
}

function SelectEncoderAndFocusBack {
    Param([int]$x, [int]$y)

    Process {
        ClickAndReturn -x 27 -y 1114
        ClickAndReturn -x $x -y $y

        Start-Sleep 1 # Wait for mouse clicks. Sometines prev window is activated before clicks. Maybe click event have to be sent to the Sound Blaster Command directly.
        if(0 -ne $script:PrevProcess[0].MainWindowHandle) {
            [Microsoft.VisualBasic.Interaction]::AppActivate($script:PrevProcess[0].Id)
        }
    }
}
