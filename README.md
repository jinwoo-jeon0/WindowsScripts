# Try to control Sound Blaster Command

Supporting command line? cannot find

Mouse?

## [Search "powershell send mouse click"](https://www.google.com/search?q=powershell+send+mouse+click&newwindow=1&sca_esv=593400454&sxsrf=AM9HkKmPTbUyEcKSPyUJ9tvr7YIdRkoqsQ%3A1703415191788&ei=lw2IZZPZL5e0oATNsIewBw&oq=powershell+send+mou&gs_lp=Egxnd3Mtd2l6LXNlcnAiE3Bvd2Vyc2hlbGwgc2VuZCBtb3UqAggAMgoQIxiABBiKBRgnMgYQABgWGB4yBhAAGBYYHjIGEAAYFhgeSLISUABY2wtwAHgBkAEBmAHLAaAB_guqAQUwLjkuMbgBA8gBAPgBAcICChAAGIAEGIoFGEPCAg0QABiABBgUGIcCGLEDwgIIEAAYgAQYsQPCAgUQABiABMICCxAAGIAEGIoFGJECwgIKEAAYgAQYFBiHAuIDBBgAIEGIBgE&sclient=gws-wiz-serp)

### Activate window

```PowerShell
Get-Process -Name Creative.SBCommand | Format-List *

(Get-Process -Name Creative.SBCommand).GetType()
```

Call [ShowWindowAsync function(Call native Windows APIs)](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/add-type?view=powershell-7.3&WT.mc_id=ps-gethelp#example-4-call-native-windows-apis)

### [Move mouse and click using powershell?](https://www.reddit.com/r/PowerShell/comments/m1hztx/move_mouse_and_click_using_powershell/)

```PowerShell
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($x, $y)
```

* [Get-Help AddType](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/add-type?view=powershell-7.3&WT.mc_id=ps-gethelp)

### [wasp: Windows Automation Snapin for PowerShell](https://github.com/mavaddat/wasp)

Is `Wasp.dll` safe?

## [Is it possible to position a window when starting a process with PowerShell (Start-Process)?](https://stackoverflow.com/questions/41229932/is-it-possible-to-position-a-window-when-starting-a-process-with-powershell-sta)

## Etc

* [class Window](https://learn.microsoft.com/en-us/dotnet/api/system.windows.window?view=windowsdesktop-8.0)
* [mouse_event function (winuser.h)](https://learn.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-mouse_event)
* [SendKeys Method in Powershell](https://superuser.com/questions/1249976/sendkeys-method-in-powershell)