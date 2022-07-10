Gui, Add, Button, x12 y29 w60 h30 gP, Button
Gui, Add, Button, x82 y29 w60 h30 gS, Button
Gui, Add, Button, x152 y29 w60 h30 gPPS, Button
Gui, Add, Button, x222 y29 w60 h30 gL, Button
Gui, Add, Button, x292 y29 w60 h30 gOtlov, Button
Gui, Add, Text, x12 y9 w60 h20 , Patrol
Gui, Add, Text, x82 y9 w60 h20 , Spets
Gui, Add, Text, x152 y9 w60 h20 , PPS
Gui, Add, Text, x222 y9 w60 h20 , Lectsii
Gui, Add, Text, x292 y9 w60 h20 , Otlov
; Generated using SmartGUI Creator 4.0
Gui, Show, x772 y478 h77 w369, Select script
Return

P:
{
Run,C:\Scripts\AlphaP.ahk
ExitApp
}

S:
{
Run,C:\Scripts\AlphaS.ahk
ExitApp
}

PPS:
{
Run,C:\Scripts\GUVD.ahk
ExitApp
}

L:
{
Run,C:\Scripts\LectsiiGUVD.ahk
ExitApp
}

Otlov:
{
Run,C:\Scripts\Otlov.ahk
ExitApp
}

GuiClose:
ExitApp