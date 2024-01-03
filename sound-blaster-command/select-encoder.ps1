$ErrorActionPreference = "Stop"

. "$PSScriptRoot\activate.ps1"

. "$PSScriptRoot\..\mouse.ps1"

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
