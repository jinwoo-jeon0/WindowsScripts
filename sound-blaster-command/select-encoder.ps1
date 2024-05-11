$ErrorActionPreference = "Stop"

$script:PrevProcess = . "$PSScriptRoot\activate.ps1"

. "$PSScriptRoot\..\mouse.ps1"

function SelectEncoderAndFocusBack {
    Param([int]$x, [int]$y)

    Process {
        ClickAndReturn -x 27 -y 1114
        ClickAndReturn -x $x -y $y

        if(0 -ne $processes[0].MainWindowHandle) {
            [Microsoft.VisualBasic.Interaction]::AppActivate($script:PrevProcess[0].Id)
        }
    }
}
