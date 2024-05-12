$ErrorActionPreference = "Stop"

$script:PrevProcess = . "$PSScriptRoot\activate.ps1"

. "$PSScriptRoot\..\mouse.ps1"

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
