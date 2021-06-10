#SingleInstance Force

Gui, Add, Button, r1 w250 gPPS, Патрульно-постовая служба
Gui, Add, Button, r1 w250 gP, ОСН "БАРС" / станд. форма
Gui, Add, Button, r1 w250 gS, ОСН "БАРС" / спецформа
Gui, Add, Button, r1 w250 gL, Лекции ГУ МВД
Gui, Add, Button, r1 w250 gOtlov, Доклады для отлова ОСН "БАРС"
Gui, Add, Button, r1 w250 gGov, Государственные новости
Gui, Show, , Выберите скрипт
Return

P:
{
Run %A_WorkingDir%\bind#BARSPatrol.ahk
ExitApp
}

S:
{
Run %A_WorkingDir%\bind#BARSSpets.ahk
ExitApp
}

PPS:
{
Run %A_WorkingDir%\bind#GUVD.ahk
ExitApp
}

L:
{
Run %A_WorkingDir%\bind#Lections.ahk
ExitApp
}

Otlov:
{
Run %A_WorkingDir%\Otlov.ahk
ExitApp
}

Gov:
{
Run %A_WorkingDir%\bind#gov.ahk
}

GuiClose:
ExitApp