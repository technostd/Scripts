; Script powered in 2021 by Techno's studio
; All rights reserwed
; vk.com/technostd

#SingleInstance Force
Global DataPath := A_WorkingDir "\prv.ini"
Global DataSection := "GuvdData"

Global LecturesPath := A_WorkingDir "\lectures\"
Global Lectures := []

{ ; -------------------------------------------------- Variables --------------------------------------------
Global Version := "0.1.1"
Global Developers := "by Sokol && techno | AHK Province ©2021"
Global DataFields := ["City", "License", "Surname", "Name", "SecondName", "Nickname", "Rank", "Post"]
; City: город трудоустройства
; License: удостоверение
; Surname: фамилия
; Name: имя
; SecondName: отчество
; Nickname: позывной
; Rank: звание
; Post: должность
Global DataControls := ["ChooseCity", "EditLicense", "EditSurname", "EditName", "EditSecondName", "EditNickname", "ChooseRank", "EditPost"]
Global HotkeyControls := ["l000", "l001", "l010", "l012", "l013", "l020", "l021", "l030", "l040", "l041", "l050", "l051", "l052", "l053", "l060", "l061"]

Global InputType := True ; True - GUI, False - console

Global Cities := "Мирный||Приволжск|Невский"
Global Ranks := "Рядовой||Сержант|Старшина|Прапорщик|Лейтенант|Старший лейтенант|Капитан|Майор|Подполковник|Полковник|Генерал-майор|Генерал-лейтенант|Генерал-полковник|Генерал МВД"

Global City
Global License
Global Surname
Global Name
Global SecondName
Global Nickname
Global Rank
Global Post
Global Struct
Global Tag
}

{ ; -------------------------------------------------- Control variables ------------------------------------

{ ; GUI GetData
Global ChooseCity
Global EditLicense
Global EditSurname
Global EditName
Global EditSecondName
Global EditNickname
Global ChooseRank
Global EditPost
}
}

{ ; -------------------------------------------------- URL's ------------------------------------------------
Global URLVkGroup      := "https://vk.com/provinceahk"
Global URLForumMVD     := "https://forum.gtaprovince.ru/forum/404-министерство-внутренних-дел/"
Global URLForumGUVDM   := "https://forum.gtaprovince.ru/forum/417-гувд-мирного/"
Global URLForumGUVDP   := "https://forum.gtaprovince.ru/forum/416-гувд-приволжска/"
Global URLFORUMGUVDN   := "https://forum.gtaprovince.ru/forum/423-гувд-невского/"
Global URLForumFZoP    := "https://forum.gtaprovince.ru/topic/420701-ministerstvo-vnutrennih-del-federalnyy-zakon-o-policii/"
Global URLForumPDD     := "https://forum.gtaprovince.ru/topic/419120-ministerstvo-vnutrennih-del-pravila-dorozhnogo-dvizheniya-respubliki-provinciya/"
Global URLForumUPK     := "https://forum.gtaprovince.ru/topic/384057-ministerstvo-vnutrennih-del-ugolovno-processualnyy-kodeks/"
Global URLForumKoAP    := "https://forum.gtaprovince.ru/topic/384052-ministerstvo-vnutrennih-del-kodeks-ob-administrativnyh-pravonarusheniyah/"
Global URLForumOSN     := "https://forum.gtaprovince.ru/topic/358817-province-rp-5-reglament-raboty-osn-wip/"
}

RefreshData()
{
    for Num, Field in DataFields
    {
        IniRead %Field%, %DataPath%, %DataSection%, %Field%
       
        if(%Field%=="ERROR")
            %Field% := ""
    }
    if(City=="Мирный")
    {
        Struct=ГУ МВД по г. Мирный и МО
        Tag=ГУ МВД-М    
    }

    if(City=="Приволжск")
    {
        Struct=ГУ МВД по г. Приволжск
        Tag=ГУ МВД-П    
    }
    
    if(City=="Невский")
    {
        Struct=ГУ МВД по г. Невский
        Tag=ГУ МВД-Н    
    }
}

CheckData()
{
    for Num, Field in DataFields
    {
        if(%Field%=="ERROR")
            %Field% := ""
        if(%Field%=="")
            Return False
    }
    Return True
}

WriteData()
{
    for Num, Control in DataControls
    {
        Value := %Control%
        DataField := DataFields[Num]
        IniWrite %Value%, %DataPath%, %DataSection%, %DataField%
    }
}

GetLectures()
{
    Loop, LecturePath
    {
        MsgBox A
    }    
}

WriteHotkeys()
{
    for Num, Control in DataControls
    {
        Value := %Control%
        DataField := DataFields[Num]
        IniWrite %Value%, %DataPath%, %DataSection%, %DataField%
    }
}

ShowMainGui()
{ ; ------------------------------------------------ GUI #1 "Main" ------------------------------------------
URLDownloadToFile https://github.com/technostd/Scripts/blob/b6849e4df232b5a72f5a503f81ec269a2d21c8ef/ahk.ico, %A_Temp%\ahk.ico
Gui 1:Destroy

; -------------------------------------------------- Icon ---------------------------------------------------
;Menu, Tray, Icon, %A_WorkingDir%\ahk.ico

; -------------------------------------------------- Font ---------------------------------------------------
Gui 1:Font, s10 CDefault, Trebuchet MS

; -------------------------------------------------- Footer -------------------------------------------------
Gui 1:Font, s10 c545454
Gui 1:Add, Text, x002 y685 w100 h15, v%Version%
Gui 1:Add, Text, x598 y685 w300 h15 Right, %Developers%

Gui 1:Font, s16 c000000
Gui 1:Add, Button, x025 y645 w150 h30 gButtonEdit, Изменить
Gui 1:Add, Button, x200 y645 w150 h30 gButtonData, Анкета
Gui 1:Add, Button, x375 y645 w150 h30 gButtonHelp, Помощь
Gui 1:Add, Button, x550 y645 w150 h30 gButtonReload, Перезапуск
Gui 1:Add, Button, x725 y645 w150 h30 gButtonClose, Закрыть


Gui 1:Add, Tab, x200 y-1 h35 w920 Bottom, Основное|Документы|Рация|Дополнительно

Gui 1:Tab, 1

Gui 1:Add, GroupBox, x015 y050 w290 h550, [ Основное ]
Gui 1:Add, GroupBox, x305 y050 w290 h550, [ Задержание ]
Gui 1:Add, GroupBox, x595 y050 w290 h550, [ Команды ]

; Основное
Gui 1:Font, s10
Gui 1:Add, Text, x020 y080 w150 h20, Воинское приветствие
Gui 1:Add, Text, x020 y100 w150 h20, Приветствие
Gui 1:Add, Text, x020 y120 w150 h20, Нагрудный знак
Gui 1:Add, Text, x020 y140 w150 h20, Достать КПК
Gui 1:Add, Text, x020 y160 w150 h20, Убрать КПК
Gui 1:Add, Text, x020 y180 w150 h20, Передать ориентировку
Gui 1:Add, Text, x020 y200 w150 h20, Взять рацию
Gui 1:Add, Text, x020 y220 w150 h20, Убрать рацию
Gui 1:Add, Text, x020 y240 w150 h20, Предупреждение 1
Gui 1:Add, Text, x020 y260 w150 h20, Предупреждение 2
Gui 1:Add, Text, x020 y280 w150 h20, Предупреждение 3
Gui 1:Add, Text, x020 y300 w150 h20, Предупреждение пешее
Gui 1:Add, Text, x020 y320 w150 h20, Одеть наручники
Gui 1:Add, Text, x020 y340 w150 h20, Снять наручники

Gui 1:Font, Bold с540000
Gui 1:Add, Text, x200 y080 w100 h20, Ctrl + Num*
Gui 1:Add, Text, x200 y100 w100 h20, Alt + 1
Gui 1:Add, Text, x200 y120 w100 h20, Ctrl + 1
Gui 1:Add, Text, x200 y140 w100 h20, Ctrl + Ё
Gui 1:Add, Text, x200 y160 w100 h20, Alt + Ё
Gui 1:Add, Text, x200 y180 w100 h20, Ctrl + 5
Gui 1:Add, Text, x200 y200 w100 h20, Ctrl + [-]
Gui 1:Add, Text, x200 y220 w100 h20, Ctlr + [+]
Gui 1:Add, Text, x200 y240 w100 h20, Ctrl + Num7
Gui 1:Add, Text, x200 y260 w100 h20, Ctrl + Num8
Gui 1:Add, Text, x200 y280 w100 h20, Ctrl + Num9
Gui 1:Add, Text, x200 y300 w100 h20, Ctrl + Num4
Gui 1:Add, Text, x200 y320 w100 h20, Ctrl + 2
Gui 1:Add, Text, x200 y340 w100 h20, Ctrl + 3

Gui 1:Tab, 2


Gui 1:Tab, 3

Gui 1:Tab, 4



Global ChooseCity
Global EditLicense
Global EditSurname
Global EditName
Global EditSecondName
Global EditNickname
Global ChooseRank
Global EditPost


Gui 1:Show, h700 w900, ГУ МВД | AHK Province
Return

ButtonEdit:
MsgBox, 16, Ошибка, Функция недоступна, находится в разработке.
Return

ButtonData:
Gui 1:+Disabled
ShowGetDataGui()
Return

ButtonHelp:
ShowHelpGui()
Return

ButtonReload:
ShowMainGui()
Return

ButtonClose:
Gui 1:Cancel
Return

1GuiClose:
Gui 1:Cancel
Return

}

ShowHelpGui() ; GD
{ ; ------------------------------------------------ GUI #2 "GetData" ---------------------------------------

Gui 3:Destroy

; -------------------------------------------------- Icon ---------------------------------------------------
;Menu, Tray, Icon, C:\Scripts\ahk.ico

; -------------------------------------------------- Font ---------------------------------------------------
Gui 2:Font, s18 CDefault, Trebuchet MS

; -------------------------------------------------- Title --------------------------------------------------

Gui 2:Add, Text, x000 y000 w500 h40 +Center, Полезные ссылки

; -------------------------------------------------- Fields -------------------------------------------------

Gui 2:Font, s14
Gui 2:Add, Button, x015 y040 w200 r1 gButtonURLVkGroup, AHK Province
Gui 2:Add, Button, x015 y080 w200 r1 gButtonURLForumMVD, МВД
Gui 2:Add, Button, x015 y120 w200 r1 gButtonURLForumGUVDM, ГУ МВД-М
Gui 2:Add, Button, x015 y160 w200 r1 gButtonURLForumGUVDP, ГУ МВД-П
Gui 2:Add, Button, x015 y200 w200 r1 gButtonURLForumGUVDN, ГУ МВД-Н
Gui 2:Add, Button, x015 y240 w200 r1 gButtonURLForumFZoP, ФЗоП
Gui 2:Add, Button, x015 y280 w200 r1 gButtonURLForumPDD, ПДД
Gui 2:Add, Button, x015 y320 w200 r1 gButtonURLForumUPK, УПК
Gui 2:Add, Button, x015 y360 w200 r1 gButtonURLForumKoAP, КоАП
Gui 2:Add, Button, x015 y400 w200 r1 gButtonURLForumOSN, ОСН

Gui 2:Font, s12 C540000 Italic
Gui 2:Add, Text, x220 y045 w300 r01, Наша группа ВК
Gui 2:Add, Text, x220 y085 w300 r01, Форумный раздел МВД
Gui 2:Add, Text, x220 y125 w300 r01, Форумный раздел Мирного
Gui 2:Add, Text, x220 y165 w300 r01, Форумный раздел Приволжска
Gui 2:Add, Text, x220 y205 w300 r01, Форумный раздел Невского
Gui 2:Add, Text, x220 y245 w300 r01, Федеральный закон "О полиции"
Gui 2:Add, Text, x220 y285 w300 r01, Правила дорожного движения
Gui 2:Add, Text, x220 y325 w300 r01, Уголовно-процессуальный кодекс
Gui 2:Add, Text, x220 y365 w300 r01, Кодекс об адм. правонарушениях
Gui 2:Add, Text, x220 y405 w300 r01, Регламент ОСН

; -------------------------------------------------- Footer -------------------------------------------------
Gui 2:Font, s10 c545454
Gui 2:Add, Text, x002 y485 w100 h15, v%Version%
Gui 2:Add, Text, x198 y485 w300 h15 Right, %Developers%

Gui 2:Show, h500 w500, ГУ МВД | AHK Province
Return

ButtonURLVkGroup:
Run % URLVkGroup
Return
ButtonURLForumMVD:
Run % URLForumMVD
Return
ButtonURLForumGUVDM:
Run % URLForumGUVDM
Return
ButtonURLForumGUVDP:
Run % URLForumGUVDP
Return
ButtonURLForumGUVDN:
Run % URLForumGUVDN
Return
ButtonURLForumFZoP:
Run % URLForumFZoP
Return
ButtonURLForumPDD:
Run % URLForumPDD
Return
ButtonURLForumUPK:
Run % URLForumUPK
Return
ButtonURLForumKoAP:
Run % URLForumKoAP
Return
ButtonURLForumOSN:
Run % URLForumOSN
Return

}

ShowGetDataGui() ; GD
{ ; ------------------------------------------------ GUI #2 "GetData" ---------------------------------------

Gui 2:Destroy

if(City=="")
    City := "Мирный"
if(Rank=="")
    Rank := "Рядовой"

; -------------------------------------------------- Icon ---------------------------------------------------
;Menu, Tray, Icon, C:\Scripts\ahk.ico

; -------------------------------------------------- Font ---------------------------------------------------
Gui 2:Font, s18 CDefault, Trebuchet MS

; -------------------------------------------------- Title --------------------------------------------------

Gui 2:Add, Text, x000 y000 w500 h40 +Center, Изменение личных данных

; -------------------------------------------------- Fields -------------------------------------------------
Gui 2:Font, s14
Gui 2:Add, DropDownList, x015 y040 w200 r3 vChooseCity, %Cities%
Gui 2:Add, Edit, x015 y080 w200 r1 vEditSurname, %Surname%
Gui 2:Add, Edit, x015 y120 w200 r1 vEditName, %Name%
Gui 2:Add, Edit, x015 y160 w200 r1 vEditSecondName, %SecondName%
Gui 2:Add, Edit, x015 y200 w200 r1 vEditNickname, %Nickname%
Gui 2:Add, Edit, x015 y240 w200 r1 vEditLicense, %License%
Gui 2:Add, ComboBox, x015 y280 w200 r11 vChooseRank, %Ranks%
Gui 2:Add, Edit, x015 y320 w200 r1 vEditPost, %Post%

GuiControl 2:ChooseString, ChooseCity, %City%
GuiControl 2:Text, ChooseRank, %Rank%

Gui 2:Font, s12 C540000 Italic
Gui 2:Add, Text, x220 y045 w300 r03, Город трудоустройства
Gui 2:Add, Text, x220 y085 w300 r01, Фамилия | *Иванов*
Gui 2:Add, Text, x220 y125 w300 r01, Имя | *Иван*
Gui 2:Add, Text, x220 y165 w300 r01, Отчество | *Иванович*
Gui 2:Add, Text, x220 y205 w300 r01, Позывной | *Бизон*
Gui 2:Add, Text, x220 y245 w300 r01, Удостоверение | *УР-01*
Gui 2:Add, Text, x220 y285 w300 r11, Звание | *Старшина*
Gui 2:Add, Text, x220 y325 w300 r01, Должность | *Сотрудник ППС*

Gui 2:Font, s16 C000000 Norm Bold
Gui 2:Add, Button, x035 y400 w120 h50 gButtonReset, Сбросить
Gui 2:Add, Button, x190 y400 w120 h50 gButtonSave Default, Сохранить
Gui 2:Add, Button, x345 y400 w120 h50 gButtonCancel, Отменить


; -------------------------------------------------- Footer -------------------------------------------------
Gui 2:Font, s10 c545454
Gui 2:Add, Text, x002 y485 w100 h15, v%Version%
Gui 2:Add, Text, x198 y485 w300 h15 Right, %Developers%

Gui 2:Show, h500 w500, ГУ МВД | AHK Province
Return

ButtonReset:
Gui 2:Submit, NoHide

GuiControl 2:ChooseString, ShooseCity, Мирный
GuiControl 2:ChooseString, ChooseRank, Рядовой
GuiControl 2:Text, EditSurname
GuiControl 2:Text, EditName
GuiControl 2:Text, EditSecondName
GuiControl 2:Text, EditNickname
GuiControl 2:Text, EditLicense
GuiControl 2:Text, EditPost

Return

ButtonSave:
Gui 1:-Disabled
Gui 2:Submit
WriteData()
RefreshData()
Return

2GuiClose:
Gui 1:-Disabled
Gui 2:Cancel
Return

ButtonCancel:
Gui 1:-Disabled
Gui 2:Cancel
Return

}

SendChat(TextBind, SleepBind := 0)
{
SendInput {F8}%TextBind%{Enter}{F8}
Sleep %SleepBind%
}

SendForCommand(Command)
{
SendInput {F6}
Sleep 200
SendInput /%Command%{Space}
Input var, v, {Enter} 
;SendInput {F8}%Command% %var%{Enter}{F8}
}

SendCommand(TextBind)
{
SendInput {F6}
Sleep 150
SendInput %TextBind%{Space}
}

SendForInput(Command, GuiText, GuiTitle)
{
    if(InputType)
    {
        SendForCommand(Command)
    }
    else
    {
;        InputBox
    }
}

RefreshData()

ShowMainGui()


if(not CheckData())
{
    ShowGetDataGui()
}

{
Hotkey ^NumpadMult, l000
Hotkey !1, l001
Hotkey ^1, l010
Hotkey ^9, l012
Hotkey ^0, l013
Hotkey ^vkC0, l020
Hotkey !vkC0, l021
Hotkey ^5, l030
Hotkey ^-, l040
Hotkey ^=, l041
Hotkey ^Numpad7, l050
Hotkey ^Numpad8, l051
Hotkey ^Numpad9, l052
Hotkey ^Numpad4, l053
Hotkey ^2, l060
Hotkey ^3, l061
}
Return

^Numpad1:
GetLectures()
Return

l000: ; Воинское приветствие
{
    SendChat("say Здравия желаю{!}", "50")
    SendChat("animarmy 3")
}
Return

l001:
{
    SendChat("say Здравия желаю, " Rank " " Surname ", " Struct ".", "50")
    SendChat("animarmy 3")
}
Return

l010:
{
    SendChat("do На груди закреплен знак с номером " License " [" Struct "].")
}
Return

l012:
{
    SendChat("do Удостоверение в нагрудном кармане.", "50")
    SendChat("me достал удостоверение и развернул его", "50")
    SendChat("do [Удостоверение] " License " | " Surname " " Name " " SecondName " | " Rank " | " Post " [" Struct "].", "50")
    SendChat("do [Удостоверение] Фотография | Печать | Подись начальника ГУ МВД [" Struct "].")
}
Return

l013:
{
    SendChat("me закрыл удостоверение и убрал в нагрудном кармане")
}
Return

l020:
{
    SendChat("me достал КПК из кармана и включил его")
}
Return

l021:
{
    SendChat("me выключил КПК и убрал в карман")
}
Return

l030:
{
    SendChat("me открыл базу данных преступников и внёс ориентировку", "50")
    SendForCommand("su")
}
Return

l040:
{
    SendChat("me снял рацию с нагрудного кармана и зажал кнопку переговоров")
}
Return

l041:
{
    SendChat("me отпустил кнопку и закрепил рацию на нагрудном кармане")
}
Return

l050:
{
    SendChat("s {#}4169DF[Мегафон]: {#}00FF00Водитель, принимаем крайнее правое положение и останавливаемся{!}")
}
Return

l051:
{
    SendChat("s {#}4169DF[Мегафон]: {#}00FF00Водитель, принимаем крайнее правое положение и останавливаемся{!}")
}
Return

l052:
{
    SendChat("s {#}4169DF[Мегафон]: {#}FF0000Останавливаемся! Повторяю, останавливаемся! Начинаем огонь на поражение{!}")
}
Return

l053:
{
    SendChat("s {#}00FF00Стоять, руки вверх{!} {#}FF0000Буду стрелять по ногам{!}")
}
Return

l060:
{
    SendChat("do Наручники закреплены на поясном ремне.", "50")
    SendChat("me снял наручники с пояса", "50")
    SendChat("me завел руки преступника за спину и надел на него наручники", "50")
    SendForCommand("cuff")
}
Return

l061:
{
    SendChat("do Ключ от наручников в кармане.", "50")
    SendChat("me достал ключ и снял с гражданина наручники", "50")
    SendChat("me закрепил наручники за поясом и убрал ключ в карман", "50")
    SendForCommand("uncuff")
}
Return
