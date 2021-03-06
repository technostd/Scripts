; Script powered in 2021 by Techno's studio
; All rights reserwed
; vk.com/technostd

#SingleInstance Force
Global DataPath := A_WorkingDir "\guvd.prv"
Global Section := "GuvdData"

{ ; -------------------------------------------------- Variables --------------------------------------------
Global Version := "0.1.0"
Global Developers := "by ВИСКАС && techno | AHK Province ©2021"
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
URLVkGroup      := "https://vk.com/provinceahk"
URLForumMVD     := "https://forum.gtaprovince.ru/forum/404-министерство-внутренних-дел/"
URLForumGUVDM   := "https://forum.gtaprovince.ru/forum/417-гувд-мирного/"
URLForumGUVDP   := "https://forum.gtaprovince.ru/forum/416-гувд-приволжска/"
URLFORUMGUVDN   := "https://forum.gtaprovince.ru/forum/423-гувд-невского/"
URLForumFZoP    := "https://forum.gtaprovince.ru/topic/384054-province-rp-5-federalnyy-zakon-o-policii-fzop/"
URLForumPDD     := "https://forum.gtaprovince.ru/topic/384049-province-rp-5-pdd-pravila-dorozhnogo-dvizheniya-respubliki-provinciya-wip/"
URLForumUPK     := "https://forum.gtaprovince.ru/topic/384057-province-rp-5-ugolovno-processualnyy-kodeks-upk/"
URLForumKoAP    := "https://forum.gtaprovince.ru/topic/384052-province-rp-5-koap-wip/"
URLForumOSN     := "https://forum.gtaprovince.ru/topic/358817-province-rp-5-reglament-raboty-osn-wip/"
}

RefreshData()
{
    for Num, Field in DataFields
    {
        IniRead %Field%, %DataPath%, %Section%, %Field%
       
        if(%Field%=="ERROR")
            %Field% := ""
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
        IniWrite %Value%, %DataPath%, %Section%, %DataField%
    }
}

ShowMainGui()
{ ; ------------------------------------------------ GUI #1 "Main" ------------------------------------------

Gui 1:Destroy

; -------------------------------------------------- Icon ---------------------------------------------------
Menu, Tray, Icon, C:\Scripts\ahk.ico

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

ButtonData:
Gui 1:+Disabled
ShowGetDataGui()
Return

ButtonHelp:
Return

ButtonReload:
ShowMainGui()
Return

ButtonClose:
Gui 1:Cancel
Return

1GuiClose:
ExitApp
Return
}

ShowGetDataGui()
{ ; ------------------------------------------------ GUI #2 "GetData" ---------------------------------------

Gui 2:Destroy

if(City=="")
    City := "Мирный"
if(Rank=="")
    Rank:= "Рядовой"

; -------------------------------------------------- Icon ---------------------------------------------------
Menu, Tray, Icon, C:\Scripts\ahk.ico

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
Gui 2:Submit
WriteData()
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

RefreshData()

ShowMainGui()

if(not CheckData())
    ShowGetDataGui()
Return

^1::
RefreshData()
CheckData()
Return