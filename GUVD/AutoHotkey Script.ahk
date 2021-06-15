; Script powered in 2021 by Techno's studio
; All rights reserwed
; vk.com/technostd

#SingleInstance Force
Global DataPath := A_WorkingDir "\guvd.ini"
Global Section := "GuvdData"

; -------------------------------------------------- Variables ----------------------------------------------
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

; -------------------------------------------------- Control variables --------------------------------------

; GUI GetData
Global ChooseCity
Global EditLicense
Global EditSurname
Global EditName
Global EditSecondName
Global EditNickname
Global ChooseRank
Global EditPost


; -------------------------------------------------- URL's --------------------------------------------------
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

RefreshData()
{
    for Num, Field in DataFields
    {
        IniRead %Field%, %DataPath%, %Section%, %Val%
        
        if(%Field%=="")
        {
            ; RunWait %A_WorkingDir%\gui#GetUserData.ahk
            ;GuiGetUserData()
            
            Reload
        }
    }
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
Gui 1:Add, Button, x025 y645 w150 h30, Изменить
Gui 1:Add, Button, x200 y645 w150 h30, Анкета
Gui 1:Add, Button, x375 y645 w150 h30, Помощь
Gui 1:Add, Button, x550 y645 w150 h30, Перезапуск
Gui 1:Add, Button, x725 y645 w150 h30, Закрыть


Gui 1:Add, Tab, x200 y-1 h35 w920 Bottom, Основное|Документы|Рация|Дополнительно


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
}

ShowGetDataGui()
{ ; ------------------------------------------------ GUI #2 "GetData" ---------------------------------------

Gui 2:Destroy

for Val, Field in DataFields
{
    if(%Field%=="")
        City := "Мирный"
}
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
Gui 2:Add, Text, x220 y045 w300 r3, Город трудоустройства
Gui 2:Add, Text, x220 y085 w300 r1, Фамилия | *Иванов*
Gui 2:Add, Text, x220 y125 w300 r1, Имя | *Иван*
Gui 2:Add, Text, x220 y165 w300 r1, Отчество | *Иванович*
Gui 2:Add, Text, x220 y205 w300 r1, Позывной | *Бизон*
Gui 2:Add, Text, x220 y245 w300 r1, Удостоверение | *УР-01*
Gui 2:Add, Text, x220 y285 w300 r11, Звание | *Старшина*
Gui 2:Add, Text, x220 y325 w300 r1, Должность | *Сотрудник ППС*

Gui 2:Font, s16 C000000 Norm Bold
Gui 2:Add, Button, x50 y400 w150 h50 gButtonSave, Сохранить
Gui 2:Add, Button, x300 y400 w150 h50 gButtonCancel, Отменить


; -------------------------------------------------- Footer -------------------------------------------------
Gui 2:Font, s10 c545454
Gui 2:Add, Text, x002 y485 w100 h15, v%Version%
Gui 2:Add, Text, x198 y485 w300 h15 Right, %Developers%

Gui 2:Show, h500 w500, ГУ МВД | AHK Province
Return

ButtonSave:
Gui 2:Submit
WriteData()
Return


ButtonCancel:
Gui 2:Cancel
Return


Return
}
ShowGetDataGui()
Return

^1::
; ShowMainGui()
ShowGetDataGui()
Return