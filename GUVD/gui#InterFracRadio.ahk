; Script powered in 2021 by Techno's studio
; All rights reserwed

#SingleInstance Force

FRACTIONS=ГИБДД-М||ГИБДД-П|ГИБДД-Н|ГУ МВД-М|ГУ МВД-П|ГУ МВД-Н|ОКБ-М|ЦГБ-П|ЦГБ-Н|Армия|РЖД
LEVEL=db


Gui, Margin, +5, +5

; Левый блок

Gui, Add, Text, x5 y5 w100 h15, Фракция
Gui, Add, DropDownList, x5 y20 w100 r12 h100 vFracTo, % FRACTIONS

Gui, Add, Text, x5 y50 w100 h15, Рация
Gui, Add, Radio, x5 y65 w100 h15 Group Checked vRadioRO, /ro
Gui, Add, Radio, x5 y85 w100 h15 vRadioD, /d

Gui, Add, Text, x5 y110 w100 h15, Сообщение
Gui, Add, Edit, x5 y125 w270 h20 vEditMsg
Gui, Add, Button, x280 y124 w65 h22 Default gSendMsg, Отправить 
; Правый блок

Gui, Add, Text, x175 y5 w100 h15, Другой тег отпр.
Gui, Add, Edit, x175 y20 w100 h21 vEditCustomFracFrom

Gui, Add, Text, x175 y50 w100 h15, Другой тег получ.
Gui, Add, Edit, x175 y65 w100 h21 vEditCustomFracTo


Gui, Show, h150 w350, TechnoAHK : Fraction

Gui, Submit, NoHide
Return

SendMsg:
    Gui, Submit
    if(RadioD==1) 
        LEVEL=d
    else 
        LEVEL=ro
    
    FracFrom=ГУ МВД-М
    
    if(EditCustomFracFrom<>"")
        FracFrom:=RegExReplace(EditCustomFracFrom,"!", "{!}")
        
    if(EditCustomFracTo<>""){
        FracTo:=RegExReplace(EditCustomFracTo,"!", "{!}")
        }
    
    Msg:=RegExReplace(EditMsg,"!", "{!}")
    
    
    SendInput {F8}%LEVEL% [%FracFrom%][%FracTo%] %Msg%{Enter}{F8}
ExitApp

CloseGui:
ExitApp
