﻿#SingleInstance Force
#NoEnv
#Include %A_Temp%\TP\Hotkey.ahk
FileEncoding UTF-8
; Script powered in 2024 by AHK Province & Techno's studio (techno)
; All rights reserwed
; vk.com/technostd
; vk.com/provinceahk

; MsgBox %A_ScriptFullPath%`n%A_IsAdmin%`n%0% %1% %2% %3%


{ ; Основные переменные
Global WorkingDir := A_Temp "\TP"
Global DataPath := WorkingDir "\tp.prv"
Global DefaultHotkeysPath := A_Temp "\default.tp.prv"
Global DefaultProvLogPath := "C:\Province Games\MTA\logs"
Global DataSection := "TPData"
Global HotkeySection := "TPHotkeys"
Global HIDDEN_NOW := False

Hotkey_IniPath(DataPath)
Hotkey_IniSection("TPHotkeys")

Global Version := "2.30"  
Global GuiVersion := "2.4.0"
Global TextCreator = techno & Sokol
Global TextGroup = AHK Province
Global TextFooter := "by techno && Sokol ft. Madjit_Martinez | AHK Province ©2022-2024"
Global DataFields := ["City", "License", "Surname", "Name", "SecondName", "Rank", "Post", "Signature", "ProvLogPath", "Gender", "MB"]

Global HotkeysEnabled := False

Global HotkeyFields := {"00Knock": ["1", "Постучать в окно"], "01CivilianGreeting": ["1", "Приветствие гражд."], "02PoliceBadge": ["1", "Полицейский значок"], "03ColleagueGreeting": ["1", "Воинское приветствие"],  "04LicenseOpen": ["1", "Удостоверение+"], "05LicenseClose": ["1", "Удостоверение-"], "06TakeDocuments": ["1", "Взять документы"], "07ReturnDocuments": ["1", "Вернуть документы"], "08PDAOn": ["1", "КПК+"], "09PDAOff": ["1", "КПК-"], "10Skan": ["1", "Пробить по базе"], "11Protocol": ["1", "Составить протокол"], "12GiveProtocolForSignature": ["1", "Протокол на подпись"], "13GiveProtocolCopyReject": ["1", "Метка о несогласии"], "14GiveProtocolCuffed": ["1", "Копия на колени"], "15GiveProtocolCopy": ["1", "Копия протокола"], "16Tsu": ["1", "Выписать штраф"], "17Takecarlic": ["1", "Аннулировать ВУ"], "18RadioOn": ["1", "Рация+"], "19RadioOff": ["1", "Рация-"], "20MegafonOn": ["1", "Мегафон+"], "21MegafonOff": ["1", "Мегафон-"], "22WalkWarn": ["1", "Пешее предупр."], "23SkipWarn": ["1", "Пропуск сл. авто"], "24Wanted": ["1", "/wanted"], "25FirstColumn": ["1", "Колонна 1"], "26SecondColumn": ["1", "Колонна 2"], "27ThirdColumn": ["1", "Колонна 3"], "28FirstWarn": ["1", "Предупреждение 1"], "29SecondWarn": ["1", "Предупреждение 2"], "30ThirdWarn": ["1", "Предупреждение 3"], "31TaumetrOn": ["1", "Достать тауметр"], "32Taumetr": ["1", "Измерить тонировку"], "33TaumetrOff": ["1", "Убрать тауметр"], "01BreakGlass": ["2", "Сломать стекло"], "02OpenDoor": ["2", "Открыть дверь"], "03PullCivilian": ["2", "Вытащить из машины"], "04Cuff": ["2", "Наручники+"], "05Uncuff": ["2", "Наручники-"], "06Arr": ["2", "Конвой+"], "07Dearr": ["2", "Конвой-"], "08Putpl": ["2", "Посадить в ПА"], "09Eject": ["2", "Высадить из ПА"]}



Global HotkeyValues := Object()
; Global HotkeyHWNDs := Object()

; City: город трудоустройства
; License: удостоверение
; Surname: фамилия
; Name: имя
; SecondName: отчество
; Nickname: позывной
; Rank: звание
; Post: должность
; Gender: пол

Global DataControls := ["ChooseCity", "EditLicense", "EditSurname", "EditName", "EditSecondName", "ChooseRank", "EditPost", "EditSignature", "EditProvLogPath", "Gender", "CheckMB"]

Global InputType := False ; True - GUI, False - console

Global Cities := "Мирный||Приволжск|Невский"
Global Ranks := "рядовой||сержант|старшина|прапорщик|лейтенант|старший лейтенант|капитан|майор|подполковник|полковник|генерал-майор|генерал-лейтенант|генерал-полковник|генерал МВД"
Global RanksArr := {"рядовой": "do На плечах закреплены пустые погоны.", "сержант": "do На плечах закреплены погоны с тремя лычками поперек погон.", "старшина": "do На плечах погоны с одной лычкой вдоль погон.", "прапорщик": "do На плечах погоны с двумя звездами вдоль по он.", "лейтенант": "do На плечах погоны с двумя звездами и просветом.", "старший лейтенант": "do На плечах погоны с тремя звездами и просветом.", "капитан": "do На плечах погоны с четырьмя звездами и просветом.", "майор": "do На плечах погоны с одной звездой и двумя просветами.", "подполковник": "do На плечах погоны с двумя звездами и двумя просветами.", "Полковник": "do На плечах погоны с тремя звездами и двумя просветами.", "генерал-майор": "do На плечах погоны с одной большой звездой.", "генерал-лейтенант": "do На плечах погоны с двумя большими звездами.", "генерал-полковник": "do На плечах погоны с тремя большими звездами.", "генерал МВД": "do На плечах погоны с одной большой звездой и гербом МВД."}

Global PogonArr := {"рядовой": "пустые погоны", "сержант": "погоны с тремя лычками поперек погон", "старшина": "погоны с одной лычкой вдоль погон", "прапорщик": "погоны с двумя звездами вдоль погон", "лейтенант": "погоны с двумя звездами и просветом", "старший лейтенант": "погоны с тремя звездами и просветом", "капитан": "погоны с четырьмя звездами и просветом", "майор": "погоны с одной звездой и двумя просветами", "подполковник": "погоны с двумя звездами и двумя просветами", "Полковник": "погоны с тремя звездами и двумя просветами", "генерал-майор": "погоны с одной большой звездой", "генерал-лейтенант": "погоны с двумя большими звездами", "генерал-полковник": "погоны с тремя большими звездами", "генерал МВД": "погоны с одной большой звездой и гербом МВД"}

Global City
Global License
Global Surname
Global Name
Global SecondName
Global Rank
Global Post
Global Signature
Global ProvLogPath
Global Gender
Global lla
Global la
Global kca
Global kuce
Global syaas
Global kaci
Global Struct
Global Tag


;Global Label
}

{ ; -------------------------------------------------- Control variables ------------------------------------
Global ChooseCity
Global EditLicense
Global EditSurname
Global EditName
Global EditSecondName
Global ChooseRank
Global EditPost
Global EditSignature
Global EditProvLogPath
Global RadioMale
Global RadioFemale
Global CheckMB
Global ButtonEditText

}


CheckAdmin()
{

    if(not A_IsAdmin and %0% == 0)
    {
        try
        {
            if(A_IsCompiled)
                Run *RunAs "%A_ScriptFullPath%" /restart
            else
                Run *RunAs "%A_AhkPath%" /restart "%A_ScriptFullPath%"
        }
        ExitApp
    }

}

CheckUIA()
{
    if (!A_IsCompiled && !InStr(A_AhkPath, "_UIA")) {
        Run % "*uiAccess " A_ScriptFullPath
        ExitApp
    }
}

SetLocaleRu()
{
    SendMessage, 0x50,, 0x4190419,, A ;
}

SetLocaleEn()
{
    SendMessage, 0x50,, 0x4090409,, A ;
}

SetCapsOff()
{
    SetCapsLockState Off
}


CheckUpdate()
{
	FileDelete, %A_Temp%\update.ahk
	Http := ComObjCreate("WinHttp.WinHttpRequest.5.1")
    Http.Open("GET", "https://github.com/sookolin/profile.tp/raw/main/version.profile.md")
    Http.Send()
    Versions := StrSplit(Http.ResponseText, "`n")
    NewVersion := Versions[1]
    GuiNewVersion := Versions[2]
    for Num, Value in Versions
        if(Num>=3)
            ChangeList = %Changelist%`n• %Value%
	if(NewVersion <= Version)
    {
		StartScript()
        Return
    }
    Gui Upd:Destroy
    
    Gui Upd:Font, s12 c000000 Bold, Bahnschrift
    Gui Upd:Add, Text, , Вышла новая версия! Обновить с %GuiVersion% на %GuiNewVersion%?
    Gui Upd:Font, s16
    Gui Upd:Add, Link, xp yp+40, Список изменений (<a href="https://vk.com/@provinceahk-changelogtp">ChangeLog</a>):
    Gui Upd:Font, s12 
    for Num, Value in Versions
        if(Num>=3)
            Gui Upd:Add, Text, xp yp+30, • %Value%
    Gui Upd:Add, Button, xp yp+30 w145 gUpdate Default, Обновить
    Gui Upd:Add, Button, xp+150 yp w145 gSkipUpdate, Не обновлять
    Gui Upd:Add, Button, xp+150 yp w145 gClose, Закрыть скрипт
    

    Gui Upd:Show,, AHK ГИБДД #5 | AHK Province
    Return
    
    Update:    
    URL = https://raw.githubusercontent.com/sookolin/profile.tp/main/tp.ahk
    ;URL = https://my-files.su/Save/d6bcxl/ahk.tp.exe
	URLDownloadToFile, %URL%, %A_Temp%\update.ahk
    MsgBox %A_Temp%\update.ahk
	PID := DllCall("GetCurrentProcessId")

	;Run % "*uiAccess " "%A_Temp%\update.ahk" /update "%PID%" "%A_ScriptFullPath%"
    str = "*uiAccess " %A_Temp%"\update.ahk /update "%PID%" "%A_ScriptFullPath%
    ; MsgBox % str
    Run % str
	ExitApp
    
    SkipUpdate:
    StartScript()
    Return
    
    GuiClose:
    ExitApp
    
    Close:
    ExitApp
}



Update(PID, Path) {
	Process, Close, %PID%
	Process, WaitClose, %PID%, 3
	If ErrorLevel
	{
		MsgBox, % 16, Ошибка, Не удаётся закрыть процесс`nКод ошибки: 1.
		ExitApp
	}
	FileCopy, %A_ScriptFullPath%, %Path%, 1
	If ErrorLevel
	{
		MsgBox, % 16, Ошибка, Не удалось выполнить копирование, возможно были запущены несколько экземпляров программы.`nКод ошибки: 2.
		ExitApp
	}
	PID := DllCall("GetCurrentProcessId")
	Run %Path% /tempdelete "%PID%" "%A_ScriptFullPath%"
	ExitApp
}

TempDelete(PID, Path) {
	Process, Close, %PID%
	Process, WaitClose, %PID%, 2
	FileDelete, %Path%
	Return
}

ParamCheck()
{   
    ;ComParam1 := %0%
    ;MsgBox % ComParam1
        if(A_Args[1]=="/update")
        {
            Update(A_Args[2], A_Args[3])
            Return
        }   
        if(A_Args[1]=="/tempdelete")
        {
            TempDelete(A_Args[2], A_Args[3])
            StartScript()
            Return
        }
 
        CheckAdmin()
        CheckUpdate()
;        StartScript()
}


RefreshTray() ; Трэй
{
TrayTip, AHK ГИБДД #5 (%GuiVersion%), Скрипт успешно запущен.
IM = %WorkingDir%\ahk.ico
IfExist, %IM%
Menu, Tray, Icon, %IM%
Menu, Tray, NoStandard
Menu, Tray, Add, VKowner
Menu, Tray, Rename, VKowner, AHK Province
Menu, Tray, Add ; SEPARATOR
Menu, Tray, Add, VKmemo
Menu, Tray, Rename, VKmemo, Памятка
Menu, Tray, Add ; SEPARATOR
Menu, Tray, Add, ReloadMenu
Menu, Tray, Rename, ReloadMenu, Перезапуск
Menu, Tray, Add, HideShowMenu
Menu, Tray, Rename, HideShowMenu, Свернуть
Menu, Tray, Add, ExitMenu
Menu, Tray, Rename, ExitMenu, Закрыть
Menu, Tray, Tip, AHK ГИБДД #5 (%GuiVersion%)
Return

VKowner:
Run, https://vk.com/provinceahk
Return

VKmemo:
Run, https://vk.com/@provinceahk-pamyatkaahk
Return

ReloadMenu:
Reload
ExitApp 

HideShowMenu:
If HIDDEN_NOW
{
Menu, Tray, Rename, Развернуть, Свернуть
Gui Show
}
Else
{
Menu, Tray, Rename, Свернуть, Развернуть
Gui Hide
}
HIDDEN_NOW := !HIDDEN_NOW
Return

ExitMenu:
ExitApp
Reload

YesUpdate:
Return
}

{ ; -------------------------------------------------- URL's ------------------------------------------------
Global URLVkGroup       := "https://vk.com/provinceahk"
Global URLForumMVD      := "https://forum.gtaprovince.ru/forum/404-министерство-внутренних-дел/"
Global URLForumGIBDDM   := "https://forum.gtaprovince.ru/forum/419-гибдд-мирного/"
Global URLForumGIBDDP   := "https://forum.gtaprovince.ru/forum/418-гибдд-приволжска/"
Global URLFORUMGIBDDN   := "https://forum.gtaprovince.ru/forum/424-гибдд-невского/"
Global URLForumFZoP     := "https://forum.gtaprovince.ru/topic/456451-ministerstvo-vnutrennih-del-federalnyy-zakon-o-policii/"
Global URLForumPDD      := "https://forum.gtaprovince.ru/topic/639262-pravila-dorozhnogo-dvizheniya-respubliki/"
Global URLForumUPK      := "https://forum.gtaprovince.ru/topic/639258-ugolovnyy-kodeks-respubliki/"
Global URLForumKoAP     := "https://forum.gtaprovince.ru/topic/639260-kodeks-ob-administrativnyh-pravonarusheniyah-respubliki/"
Global URLMetodGIBDD    := "https://forum.gtaprovince.ru/topic/810654-metodicheskoe-posobie-ugibdd/"
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
        Struct=УГИБДД по г. Мирный
        Tag=УГИБДД-М    
    }

    if(City=="Приволжск")
    {
        Struct=УГИБДД по г. Приволжск
        Tag=УГИБДД-П    
    }
    
    if(City=="Невский")
    {
        Struct=УГИБДД по г. Невский
        Tag=УГИБДД-Н    
    }
    
    if(Gender=="Male"){
		lla = л
        la =
		kca = к
        kuce = ку
		syaas = ся
		kaci = ка
	}
	else if(Gender=="Female"){
		lla = ла
        la = ла
		kca = ца
        kuce = це
		syaas = ась
		kaci = цы
	}
    
}

RefreshHotkeys()
{
    for KeyName in Hotkey_Arr("AllHotkeys")
	{
		if Reset
			Hotkey % Hotkey_Value(KeyName), Off, UseErrorLevel
		else
			Hotkey % Hotkey_Write(KeyName), %KeyName%, UseErrorLevel On
        Hotkey_Disable(KeyName)
	}
    /*
    for Field, Value in HotkeyFields
    {
        Label := SubStr(Field, 3)
        IniRead %Label%, %DataPath%, %HotkeySection%, %Label%
        HotkeyValues[Label] := %Label%
    }
    */
}
/*
SetHotkeys()
{
    for Label, Value in HotkeyValues
    {
        Value := EncodeHotkey(HotkeyValues[Label])
        if((Value<>"") and (Value<>"ERROR"))
            Hotkey %Value%, %Label%
    }
}
*/
GetHotkeys()
{
    for Field, Value in HotkeyFields
    {
        Label := SubStr(Field, 3)
        IniRead %Label%, %DataPath%, %HotkeySection%, %Label%
        
        HotkeyValues[Label] := %Label%
        ; HotkeyValues[Label] := Hotkey_Read(Label)
    }
}

GetDefaultHotkeys()
{
    ; DefaultHotkeysPath = %%\default.tp.prv
    URLDownloadToFile https://raw.githubusercontent.com/sookolin/profile.tp/main/default.tp.prv, %DefaultHotkeysPath%
	PID := DllCall("GetCurrentProcessId")
    
    for Field, Value in HotkeyFields
    {
        Label := SubStr(Field, 3)
        IniRead %Label%, %DefaultHotkeysPath%, %HotkeySection%, %Label%
        if(EncodeDelete(HotkeyValues[Label])=="ERROR")
        {
            HotkeyValues[Label] := %Label%
            Key := %Label%
            IniWrite %Key%, %DataPath%, %HotkeySection%, %Label%
        } else {
            IniRead %Label%, %DataPath%, %HotkeySection%, %Label%
            HotkeyValues[Label] := %Label%
        }
    }
    
    
    RefreshHotkeys()
    ;MsgBox Writed
    FileDelete, %DefaultHotkeysPath%
    ; TempDelete(PID, DefaultHotkeysPath)
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

CheckHotkeys()
{
    for Field, Value in HotkeyFields
    {
        Label := SubStr(Field, 3)
        HotkeyValue := EncodeDelete(HotkeyValues[Label])
        if(HotkeyValue=="ERROR")
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

/*
WriteHotkeys()
{
    for Label, Value in HotkeyValues
    {
        ; Label := SubStr(Field, 3)
        IniWrite %Value%, %DataPath%, %HotkeySection%, %Label%
    }
}
*/
ShowMainGui()
{ ; ------------------------------------------------ GUI #1 "Main" ------------------------------------------
; URLDownloadToFile https://github.com/technostd/Scripts/blob/b6849e4df232b5a72f5a503f81ec269a2d21c8ef/ahk.ico, %A_Temp%\ahk.ico
Gui 1:Destroy

; -------------------------------------------------- Icon ---------------------------------------------------
;Menu, Tray, Icon, %A_WorkingDir%\ahk.ico
;Menu Actions, 

;Gui 1:Menu, 
; -------------------------------------------------- Font ---------------------------------------------------
Gui 1:Font, s10 CDefault, Bahnschrift

; -------------------------------------------------- Footer -------------------------------------------------
Gui 1:Font, s10 c545454
Gui 1:Add, Text, x002 y790 w100 h15, v%GuiVersion%
Gui 1:Add, Text, x598 yp w400 h15 Right, %TextFooter%

Gui 1:Font, s16 c000000 Bold
Gui 1:Add, Button, x950 y70 w30 h220 gButtonEdit vButtonEditText , И`nз`nм`nе`nн`nи`nт`nь
Gui 1:Add, Button, xp yp+235 w30 h220 gButtonData, А`nн`nк`nе`nт`nа
Gui 1:Add, Button, xp yp+235 w30 h220 gButtonHelp, П`nо`nм`nо`nщ`nь
;Gui 1:Add, Button, xp yp+215 w30 h200 gButtonReload, Перезапуск
;Gui 1:Add, Button, xp yp+215 w30 h200 gButtonClose, Закрыть




Gui 1:Add, Tab2, x-1 y200 h920 w35 Right +Multi 0x8, Основное|Документы|Рация ;|Дополнительно
; Gui 1:Add, Text, x0 y5 h35 w920 Center, Здесь скоро появятся разделы
Gui 1:Tab, 1

Gui 1:Add, GroupBox, x065 y000 w290 h790, [ Основное ]
Gui 1:Add, GroupBox, xp+290 y000 w290 h280, [ Задержание ]
Gui 1:Add, GroupBox, xp y265 w290 h525, [ Оружие ]
Gui 1:Add, GroupBox, xp+290 y000 w290 h790, [ Команды ]

Gui 1:Font, Bold C000000 s7

Hotkey_Arr("OnlyEngSym", True)

Gui 1:Add, Text, x230 y010 Hidden
for Field, Value in HotkeyFields
{   
    if(Value[1]=="1")
    {
        Desc := Value[2]
        Label := SubStr(Field, 3)
        HotkeyValue := HotkeyValues[Label]
        Gui 1:Font, C000000 s10
        Gui 1:Add, Text, xp-160 yp+22 w150 h26 , % Desc
        Gui 1:Font, C540000 s8
        Hotkey_Add("xp+160 yp w120 -Center", Label, "KMJNDG1", Hotkey_Read(Label), "Save")
        
        Hotkey_Disable(Label)
        ; Gui 1:Add, Hotkey, xp+180 yp w100 h20 Disabled hwndhwnd, % HotkeyValue
        ; HotkeyHWNDs[Label] := hwnd
    }

}

Gui 1:Add, Text, x520 y010 Hidden
for Field, Value in HotkeyFields
{   
    if(Value[1]=="2")
    {
        Desc := Value[2]
        Label := SubStr(Field, 3)
        HotkeyValue := HotkeyValues[Label]
        Gui 1:Font, C000000 s10
        Gui 1:Add, Text, xp-160 yp+22 w150 h26 , % Desc
        Gui 1:Font, C540000 s8
        Hotkey_Add("xp+160 yp w120 -Center", Label, "KMJNDG1", Hotkey_Read(Label), "Save")
        
        Hotkey_Disable(Label)
        ; Gui 1:Add, Hotkey, xp+180 yp w100 h20 Disabled hwndhwnd, % HotkeyValue
        ; HotkeyHWNDs[Label] := hwnd
    }

}

Gui 1:Add, Text, x520 y275 Hidden
for Field, Value in HotkeyFields
{   
    if(Value[1]=="3")
    {
        Desc := Value[2]
        Label := SubStr(Field, 3)
        HotkeyValue := HotkeyValues[Label]
        Gui 1:Font, C000000 s10
        Gui 1:Add, Text, xp-160 yp+22 w150 h26, % Desc
        Gui 1:Font, C540000 s8
        Hotkey_Add("xp+160 yp w120 -Center", Label, "KMJNDG1", Hotkey_Read(Label), "Save")
        
        Hotkey_Disable(Label)
        ; Gui 1:Add, Hotkey, xp+180 yp w100 h20 Disabled hwndhwnd, % HotkeyValue
        ; HotkeyHWNDs[Label] := hwnd
    }

}

Gui 1:Font, Bold C540000 s10
Gui 1:Add, Text, x650 y030 w100 h20, /грз <Номер>
Gui 1:Add, Text, xp yp+20 w100 h20, /р+
Gui 1:Add, Text, xp yp+20 w100 h20, /р-
Gui 1:Add, Text, xp yp+20 w100 h20, /м <Сообщение>
Gui 1:Add, Text, xp yp+20 w100 h20, /т<1-3>
Gui 1:Add, Text, xp yp+20 w100 h20, /тс<1-3>
Gui 1:Add, Text, xp yp+20 w100 h20, /двр<1-4>
Gui 1:Add, Text, xp yp+20 w100 h20, /алко<1-6>
Gui 1:Add, Text, xp yp+20 w100 h20, /дтпфото
Gui 1:Add, Text, xp yp+20 w100 h20, /дтпторм
Gui 1:Add, Text, xp yp+20 w100 h20, /дтппротокол
Gui 1:Add, Text, xp yp+20 w100 h20, /камеры
Gui 1:Add, Text, xp yp+20 w100 h20, /файнс
Gui 1:Add, Text, xp yp+20 w100 h20, /удо+
Gui 1:Add, Text, xp yp+20 w100 h20, /удо-
Gui 1:Add, Text, xp yp+20 w100 h20, /рейд+
Gui 1:Add, Text, xp yp+20 w100 h20, /рейд-
Gui 1:Add, Text, xp yp+20 w100 h20, /кпк+
Gui 1:Add, Text, xp yp+20 w100 h20, /кпк-
Gui 1:Add, Text, xp yp+20 w100 h20, /доки
Gui 1:Add, Text, xp yp+20 w100 h20, /доки+
Gui 1:Add, Text, xp yp+20 w100 h20, /доки-
Gui 1:Add, Text, xp yp+20 w100 h20, /скан <ID>
Gui 1:Add, Text, xp yp+20 w100 h20, /кримрек <ID>
Gui 1:Add, Text, xp yp+20 w100 h20, /протокол
Gui 1:Add, Text, xp yp+20 w100 h20, /подпись
Gui 1:Add, Text, xp yp+20 w100 h20, /несогл
Gui 1:Add, Text, xp yp+20 w100 h20, /копиянаруч
Gui 1:Add, Text, xp yp+20 w100 h20, /копия
Gui 1:Add, Text, xp yp+20 w100 h20, /копияназад
Gui 1:Add, Text, xp yp+20 w100 h20, /штраф <ID...>
Gui 1:Add, Text, xp yp+20 w100 h20, /лишправ <ID...>
Gui 1:Add, Text, xp yp+20 w100 h20, /конвой <ID>
Gui 1:Add, Text, xp yp+20 w100 h20, /конвой-
Gui 1:Add, Text, xp yp+20 w100 h20, /впа <ID>
Gui 1:Add, Text, xp yp+20 w100 h20, /изпа <ID>

Gui 1:Font, c000000
Gui 1:Add, Text, x760 y030 w170 h20, Пробить номер (КПК)
Gui 1:Add, Text, xp yp+20 w170 h20, Подключиться к рации
Gui 1:Add, Text, xp yp+20 w170 h20, Отключиться от рации
Gui 1:Add, Text, xp yp+20 w170 h20, Крикнуть в мегафон
Gui 1:Add, Text, xp yp+20 w170 h20, Тауметр
Gui 1:Add, Text, xp yp+20 w170 h20, Свид. о поверке тауметра
Gui 1:Add, Text, xp yp+20 w170 h20, Видеорегистратор
Gui 1:Add, Text, xp yp+20 w170 h20, Алкотестер
Gui 1:Add, Text, xp yp+20 w170 h20, Фотофиксация ДТП
Gui 1:Add, Text, xp yp+20 w170 h20, Изм. торм. путей ДТП
Gui 1:Add, Text, xp yp+20 w170 h20, Протокол ДТП
Gui 1:Add, Text, xp yp+20 w170 h20, Запись с камеры (КПК)
Gui 1:Add, Text, xp yp+20 w170 h20, База данных Fines (КПК)
Gui 1:Add, Text, xp yp+20 w170 h20, Показать УДО
Gui 1:Add, Text, xp yp+20 w170 h20, Убрать УДО
Gui 1:Add, Text, xp yp+20 w170 h20, Показать приказ о рейде
Gui 1:Add, Text, xp yp+20 w170 h20, Убрать приказ о рейде
Gui 1:Add, Text, xp yp+20 w170 h20, Достать КПК
Gui 1:Add, Text, xp yp+20 w170 h20, Убрать КПК
Gui 1:Add, Text, xp yp+20 w170 h20, Попросить документы
Gui 1:Add, Text, xp yp+20 w170 h20, Взять документы
Gui 1:Add, Text, xp yp+20 w170 h20, Вернуть документы
Gui 1:Add, Text, xp yp+20 w170 h20, Пробить по базе (КПК)
Gui 1:Add, Text, xp yp+20 w170 h20, Сов. преступл. (КПК)
Gui 1:Add, Text, xp yp+20 w170 h20, Составить протокол
Gui 1:Add, Text, xp yp+20 w170 h20, Дать на подпись
Gui 1:Add, Text, xp yp+20 w170 h20, Поставить метку о несогл.
Gui 1:Add, Text, xp yp+20 w170 h20, Поставить метку о невозм.
Gui 1:Add, Text, xp yp+20 w170 h20, Дать копию
Gui 1:Add, Text, xp yp+20 w170 h20, Забрать копию
Gui 1:Add, Text, xp yp+20 w170 h20, Выписать штраф (КПК)
Gui 1:Add, Text, xp yp+20 w170 h20, Аннулировать ВУ (КПК)
Gui 1:Add, Text, xp yp+20 w170 h20, Конвоировать
Gui 1:Add, Text, xp yp+20 w170 h20, Прекратить конвой
Gui 1:Add, Text, xp yp+20 w170 h20, Посадить в ПА
Gui 1:Add, Text, xp yp+20 w170 h20, Высадить из ПА


Gui 1:Font, s16 c000000 
Gui 1:Tab, 2
Gui 1:Add, GroupBox, x065 y000 w290 h790, [ КоАП ]
Gui 1:Add, GroupBox, xp+290 y000 w290 h790, [ ФЗоП ]
Gui 1:Add, GroupBox, xp+290  y000 w290 h790, [ УПК ]

Gui 1:Font, s12 

Gui 1:Add, Text, x070 y030 w280 r20, Для всех статей КоАП предусмотрена команда вида /коапX.Y, где X.Y - номер статьи`n`nВыдает только расшифровку статьи.

Gui 1:Add, Text, x360 y030 w280 r20, Для ФЗоП команд на данный момент не предусмотрено.

Gui 1:Add, Text, x650 y030 w280 r20, Для УПК команд на данный момент не предусмотрено.

Gui 1:Font, s16 c000000 
Gui 1:Tab, 3
Gui 1:Add, GroupBox, x065 y000 w870 h790, [ Рация ]
Gui 1:Font, s12 
Gui 1:Font, Bold C540000 s10
Gui 1:Add, Text, x070 y032 w100 h20, /пппсн
Gui 1:Add, Text, xp yp+20 w100 h20, /пппсм
Gui 1:Add, Text, xp yp+20 w100 h20, /пппсп
Gui 1:Add, Text, xp yp+20 w100 h20, /пдпсн
Gui 1:Add, Text, xp yp+20 w100 h20, /пдпсм
Gui 1:Add, Text, xp yp+20 w100 h20, /пдпсп
Gui 1:Add, Text, xp yp+20 w100 h20, /пк <Тег>
Gui 1:Add, Text, xp yp+20 w100 h20, /пдк <Тег>
Gui 1:Add, Text, xp yp+20 w100 h20, /наряд <Местоположение>
Gui 1:Add, Text, xp yp+20 w100 h20, /нарядкдчн
Gui 1:Add, Text, xp yp+20 w100 h20, /нарядкдчм
Gui 1:Add, Text, xp yp+20 w100 h20, /нарядкдчп

Gui 1:Font, c000000

Gui 1:Add, Text, xp yp+20 w300 h20, В ближайшее время раздел дополнится
Gui 1:Add, Text, x180 y032 w500 h20, Принять вызов от ГУ МВД-Н
Gui 1:Add, Text, xp yp+20 w500 h20, Принять вызов от ГУ МВД-М
Gui 1:Add, Text, xp yp+20 w500 h20, Принять вызов от ГУ МВД-П
Gui 1:Add, Text, xp yp+20 w500 h20, Принять вызов от ГИБДД-Н
Gui 1:Add, Text, xp yp+20 w500 h20, Принять вызов от ГИБДД-М
Gui 1:Add, Text, xp yp+20 w500 h20, Принять вызов от ГИБДД-П
Gui 1:Add, Text, xp yp+20 w500 h20, Принять вызов от [<Тег>] в /ro (IC рация МВД)
Gui 1:Add, Text, xp yp+20 w500 h20, Принять вызов от [<Тег>] в /d (IC рация департамента) (с 7 ранга (капитан))
Gui 1:Add, Text, xp yp+20 w500 h20, Вызвать наряд ППС к <Местоположение>
Gui 1:Add, Text, xp yp+20 w500 h20, Вызвать наряд ППС к ДЧ г. Невский
Gui 1:Add, Text, xp yp+20 w500 h20, Вызвать наряд ППС к ДЧ г. Мирный
Gui 1:Add, Text, xp yp+20 w500 h20, Вызвать наряд ППС к ДЧ г. Приволжск


; Gui 1:Tab, 4



Global ChooseCity
Global EditLicense
Global EditSurname
Global EditName
Global EditSecondName
Global EditNickname
Global ChooseRank
Global EditPost
Global EditProvLogPath


Gui 1:Show, h805 w1000, ГИБДД #5 | AHK Province
Return

ButtonEdit:
; MsgBox, 16, Ошибка, Функция недоступна, находится в разработке.
if(HotkeysEnabled)
{
    
    for KeyName in Hotkey_Arr("AllHotkeys")
	{
		if Reset
			Hotkey % Hotkey_Value(KeyName), Off, UseErrorLevel
		else
			Hotkey % Hotkey_Write(KeyName), %KeyName%, UseErrorLevel On
        Hotkey_Disable(KeyName)
	}
    HotkeysEnabled := False
    GuiControl 1:Text, ButtonEditText, И`nз`nм`nе`nн`nи`nт`nь
}    
else
{

    /*
    for Label, Value in HotkeyHWNDs
    {
        GuiControl 1:Enable, % Value
        HotkeyValue := HotkeyValues[Label]
        if(HotkeyValue<>"")
            Hotkey %HotkeyValue%, Off
    }
    */
    
    for KeyName in Hotkey_Arr("AllHotkeys")
    {
        Hotkey % Hotkey_Value(KeyName), Off, UseErrorLevel
        Hotkey_Disable(KeyName, false)
    }
    HotkeysEnabled := True
    GuiControl 1:Text, ButtonEditText, С`nо`nх`nр`nа`nн`nи`nт`nь
}
Return

ButtonData:
Gui 1:+Disabled
ShowGetDataGui()
Return

ButtonHelp:
ShowHelpGui()
Return

ButtonReload:
Reload
ExitApp 

ButtonClose:
Gui 1:Cancel
Return

1GuiClose:
Gui 1:Cancel
Return

}

ShowGetDataGui() ; GD
{ ; ------------------------------------------------ GUI #2 "GetData" ---------------------------------------

Gui 2:Destroy

if(City=="")
    City := "Мирный"
if(Rank=="")
    Rank := "Рядовой"

if(Gender=="Male"){
	CheckedMale = Checked
	CheckedFemale = 
}
if(Gender=="Female"){
	CheckedMale = 
	CheckedFemale = Checked
}
if(MB)
    CheckedMB = Checked

; -------------------------------------------------- Icon ---------------------------------------------------
;Menu, Tray, Icon, C:\Scripts\ahk.ico

; -------------------------------------------------- Font ---------------------------------------------------
Gui 2:Font, s18 CDefault, Bahnschrift

; -------------------------------------------------- Title --------------------------------------------------

Gui 2:Add, Text, x000 y000 w500 h40 +Center, Изменение личных данных

; -------------------------------------------------- Fields -------------------------------------------------
Gui 2:Font, s14
Gui 2:Add, DropDownList, x015 y040 w300 r3 vChooseCity, %Cities%
Gui 2:Add, Edit, xp y080 w300 r1 vEditSurname, %Surname%
Gui 2:Add, Edit, xp yp+40 w300 r1 vEditName, %Name%
Gui 2:Add, Edit, xp yp+40 w300 r1 vEditSecondName, %SecondName%
Gui 2:Add, Edit, xp yp+40 w300 r1 vEditLicense, %License%
Gui 2:Add, ComboBox, xp yp+40 w300 r11 vChooseRank, %Ranks%
Gui 2:Add, Edit, xp yp+40 w300 r1 vEditPost, %Post%
Gui 2:Add, Edit, xp yp+40 w300 r1 vEditSignature, %Signature%
Gui 2:Add, Edit, xp yp+40 w300 h40 ReadOnly vEditProvLogPath, %ProvLogPath%
Gui 2:Add, Button, xp+305 yp w100 h40 gButtonChangePath, Изменить
Gui 2:Add, Radio, xp-220 yp+40 h15 Group %CheckedMale% vRadioMale, Мужской
Gui 2:Add, Radio, xp yp+40 h15 %CheckedFemale% vRadioFemale, Женский
Gui 2:Add, CheckBox, xp+200 yp-20 h15 %CheckedMB% vCheckMB, Мотобатальон


GuiControl 2:ChooseString, ChooseCity, %City%
GuiControl 2:Text, ChooseRank, %Rank%

Gui 2:Font, s12 C540000 Bold
Gui 2:Add, Text, x320 y045 w300 r03, Город трудоустройства
Gui 2:Add, Text, x320 yp+40 w300 r01, Фамилия | *Иванов*
Gui 2:Add, Text, x320 yp+40 w300 r01, Имя | *Иван*
Gui 2:Add, Text, x320 yp+40 w300 r01, Отчество | *Иванович*
Gui 2:Add, Text, x320 yp+40 w300 r01, Удостоверение | *77-123456*
Gui 2:Add, Text, x320 yp+40 w300 r01, Звание | *Старшина*
Gui 2:Add, Text, x320 yp+40 w300 r01, Должность | *Инспектор ДПС*
Gui 2:Add, Text, x320 yp+40 w300 r01, Подпись | *ИвановИИ*
Gui 2:Add, Text, x420 yp+40 w300 r01, Путь до папки с логами

Gui 2:Font, s16 C000000 Norm Bold
Gui 2:Add, Button, x060 y465 w120 h50 gButtonReset, Сбросить
Gui 2:Add, Button, x240 y465 w120 h50 gButtonSave Default, Сохранить
Gui 2:Add, Button, x420 y465 w120 h50 gButtonCancel, Отменить


; -------------------------------------------------- Footer -------------------------------------------------
Gui 2:Font, s10 c545454
Gui 2:Add, Text, x002 y515 w100 h15, v%GuiVersion%
Gui 2:Add, Text, x198 y515 w400 h15 Right, %TextFooter%

Gui 2:Show, h530 w600, ГИБДД #5 | AHK Province
Return

ButtonChangePath:
FileSelectFolder EditProvLogPath, *%ProvLogPath%, 3, Выберите папку "..\MTA\logs\"
GuiControl 2:Text, EditProvLogPath, %EditProvLogPath%
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
GuiControl 2:Text, EditSignature

Return

ButtonSave:
Gui 1:-Disabled
Gui 2:Submit
if(RadioMale=="1")
	Gender = Male
if(RadioFemale=="1")
	Gender = Female
if(CheckMB=="1")
    MB := True

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

ShowHelpGui() ; GD
{ ; ------------------------------------------------ GUI #3 "Help" ---------------------------------------

Gui 3:Destroy

; -------------------------------------------------- Icon ---------------------------------------------------
;Menu, Tray, Icon, C:\Scripts\ahk.ico

; -------------------------------------------------- Font ---------------------------------------------------
Gui 3:Font, s18 CDefault, Bahnschrift

; -------------------------------------------------- Title --------------------------------------------------

Gui 3:Add, Text, x000 y000 w500 h40 +Center, Полезные ссылки

; -------------------------------------------------- Fields -------------------------------------------------

Gui 3:Font, s14 Bold
Gui 3:Add, Button, x015 y040 w200 r1 gButtonURLVkGroup, AHK Province
Gui 3:Add, Button, x015 y080 w200 r1 gButtonURLForumMVD, МВД
Gui 3:Add, Button, x015 y120 w200 r1 gButtonURLForumGIBDDM, ГИБДД-М
Gui 3:Add, Button, x015 y160 w200 r1 gButtonURLForumGIBDDP, ГИБДД-П
Gui 3:Add, Button, x015 y200 w200 r1 gButtonURLFORUMGIBDDN, ГИБДД-Н
Gui 3:Add, Button, x015 y240 w200 r1 gButtonURLForumFZoP, ФЗоП
Gui 3:Add, Button, x015 y280 w200 r1 gButtonURLForumPDD, ПДД
Gui 3:Add, Button, x015 y320 w200 r1 gButtonURLForumUPK, УПК
Gui 3:Add, Button, x015 y360 w200 r1 gButtonURLForumKoAP, КоАП
Gui 3:Add, Button, x015 y400 w200 r1 gButtonURLMetodGIBDD, Методичка

Gui 3:Font, s12 C540000 Bold
Gui 3:Add, Text, x220 y045 w300 r01, Наша группа ВК
Gui 3:Add, Text, x220 y085 w300 r01, Форумный раздел МВД
Gui 3:Add, Text, x220 y125 w300 r01, Форумный раздел Мирного
Gui 3:Add, Text, x220 y165 w300 r01, Форумный раздел Приволжска
Gui 3:Add, Text, x220 y205 w300 r01, Форумный раздел Невского
Gui 3:Add, Text, x220 y245 w300 r01, Федеральный закон "О полиции"
Gui 3:Add, Text, x220 y285 w300 r01, Правила дорожного движения
Gui 3:Add, Text, x220 y325 w300 r01, Уголовно-процессуальный кодекс
Gui 3:Add, Text, x220 y365 w300 r01, Кодекс об адм. правонарушениях
Gui 3:Add, Text, x220 y405 w300 r01, Методичка ГИБДД

; -------------------------------------------------- Footer -------------------------------------------------
Gui 3:Font, s10 c545454 Norm
Gui 3:Add, Text, x002 y445 w100 h15, v%GuiVersion%
Gui 3:Add, Text, x98 y445 w400 h15 Right, %TextFooter%

Gui 3:Show, h460 w500, ГИБДД #5 | AHK Province
Return

ButtonURLVkGroup:
Run % URLVkGroup
Return
ButtonURLForumMVD:
Run % URLForumMVD
Return
ButtonURLForumGIBDDM:
Run % URLForumGIBDDM
Return
ButtonURLForumGIBDDP:
Run % URLForumGIBDDP
Return
ButtonURLFORUMGIBDDN:
Run % URLFORUMGIBDDN
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
ButtonURLMetodGIBDD:
Run % URLMetodGIBDD
Return

}

Encoded(Target)
{
    Target := StrReplace(Target, "#", "{#}")
    Target := StrReplace(Target, "!", "{!}")
    Target := StrReplace(Target, "^", "{^}")
    Target := StrReplace(Target, "+", "{+}")
    Target := StrReplace(Target, "&", "{&}")
	
	Return Target
}

EncodeDelete(Target)
{
    for Key, Value in ["#", "!", "^", "+", "&", "``", ",", ".", ";", "'", "/", "\", "-", "="]
        Target := StrReplace(Target, Value, "")
	Return Target
}

SendChat(TextBind, SleepBind)
{
    SetLocaleRu()
    SetCapsOff()
    TextBind := Encoded(TextBind)
    Clipboard :=
    SendPlay {F8}^A{Delete}%TextBind%{Enter}{F8}
    Sleep %SleepBind%
} 

GetInput(Target, GUIText, ConsoleText)
{
    SetLocaleRu()
    SetCapsOff()
    if(InputType){
        InputBox %Target%, TechnoAHK:Input, % GUIText
        if ErrorLevel
            Return
        else if %Target% =
            Return
    } else {
        SendPlay {F8}%ConsoleText%{Space}
        Input %Target%, V, {Enter} 
        SendPlay {F8}
    }
}

GetTryRes()
{
    Sleep 100
    Loop, read, %ProvLogPath%\console.log
        LastLine := A_LoopReadLine
    
    IfInString LastLine, РќРµСѓРґР°С‡РЅРѕ
    {
        Return False
    }
    IfInString LastLine, РЈРґР°С‡РЅРѕ
    {
        Return True
    }
    if(InputType){
        MsgBox, 36, Результат, Удачно?
        IfMsgBox, Yes
            Return True
        IfMsgBox, No
            Return False
    } else {
    SendPlay {F8}Удачно? введите "да" или "нет" (в любой раскладке):{Space}
    Input TryRes, V, {Enter} 
    SendPlay {F8}
    if(TryRes=="да")||(TryRes=="lf")||(TryRes=="ДА")||(TryRes=="LF")
        Return True
    if(TryRes=="нет")||(TryRes=="ytn")||(TryRes=="НЕТ")||(TryRes=="YTN")
        Return False
    else
        Return False
    }
}

ReadComFile(FileName){
    Loop, read, %FileName%
        SendChat(Encoded(A_LoopReadLine), ComFileDelay)
}

GetArgsForHotstring(Hotstring, Target)
{
    SendPlay SendPlay ^A{Delete}/%Hotstring%{Space}
    Input %Target%, V, {Enter}
}

StartScript()
{
    
    
    
    RefreshTray()
    
    GetHotkeys()
    
    ch := CheckHotkeys()
    if(!ch)
        GetDefaultHotkeys()

    RefreshData()
    
    ShowMainGui()
    
    RefreshHotkeys()
    
    if(not CheckData())
        ShowGetDataGui()
}

; CheckAdmin()

CheckUIA()

ParamCheck()

Return

{ ; Hotstrings - строки автозамены


{
    
        ; #include NPD\KoAP.ahk
{ ; #include prisyaga.ahk
        :?:/присяга+::
SendPlay {Enter}
SendChat("do В руках папка с присягой МВД.", "500")
SendChat("me переда" lla " папку с присягой сотруднику МВД", "0")
Return

:?:/присяга::
SendPlay {Enter}
SendChat("me взя" lla " папку с присягой, затем открыл её", "2000")
SendChat("me положив правую руку к сердцу, нача" lla " читать присягу вслух", "2000")
SendChat("say Я, " Surname " " Name " " SecondName ", поступая на службу в органы внутренних дел,", "2000")
SendChat("say торжественно присягаю на верность Республике Провинции и ее народу!", "2000")
SendChat("say Клянусь при осуществлении полномочий сотрудника органов внутренних дел", "2000")
SendChat("say уважать и защищать права и свободы человека и гражданина,", "2000")
SendChat("say свято соблюдать Конституцию Республики Провинции и федеральные законы!", "2000")
SendChat("say Быть мужественным, честным и бдительным, не щадить своих сил в борьбе с преступностью,", "2000")
SendChat("say достойно исполнять свой служебный долг и возложенные на меня обязанности", "2000")
SendChat("say по обеспечению безопасности,законности и правопорядка,", "2000")
SendChat("хранить государственную и служебную тайну.", "2000")
SendChat("say Служу Провинции, служу Закону!", "2000")
SendChat("me закрыв папку с присягой, переда" lla " ее генералу", "0")
Return

:?:/присяга-::
SendPlay {Enter}
SendChat("me взя" lla " папку с присягой у сотрудника МВД", "0")
Return
        }
{ ; #include radio.ahk
        :?:/пппсн::
SendPlay {Enter}
SendChat("ro [" Tag "][ГУ МВД-Н] Принято.", "0")
Return

:?:/пппсм::
SendPlay {Enter}
SendChat("ro [" Tag "][ГУ МВД-М] Принято.", "0")
Return

:?:/пппсп::
SendPlay {Enter}
SendChat("ro [" Tag "][ГУ МВД-П] Принято.", "0")
Return

:?:/пдпсн::
SendPlay {Enter}
SendChat("ro [" Tag "][ГИБДД-Н] Принято.", "0")
Return

:?:/пдпсм::
SendPlay {Enter}
SendChat("ro [" Tag "][ГИБДД-М] Принято.", "0")
Return

:?:/пдпсп::
SendPlay {Enter}
SendChat("ro [" Tag "][ГИБДД-П] Принято.", "0")
Return

:?:/пк::
GetArgsForHotstring("пк", "ToTag")
SendPlay {Enter}
SendChat("ro [" Tag "][" ToTag "] Принято.", "0")
Return

:?:/пдк::
GetArgsForHotstring("пк", "ToTag")
SendPlay {Enter}
SendChat("d [" Tag "][" ToTag "] Принято.", "0")
Return

:?:/наряд::
GetArgsForHotstring("наряд", "Place")
SendPlay {Enter}
SendChat("ro [" Tag "][ГУ МВД] Требуется наряд ППС. Местоположение: " Place ".", "0")
Return

:?:/нарядкдчм::
SendPlay {Enter}
SendChat("ro [" Tag "][ГУ МВД] Требуется сотрудник ППС к дежурной части города Мирный.", "0")
Return

:?:/нарядкдчп::
SendPlay {Enter}
SendChat("ro [" Tag "][ГУ МВД] Требуется сотрудник ППС к дежурной части города Невский.", "0")
Return

:?:/нарядкдчн::
SendPlay {Enter}
SendChat("ro [" Tag "][ГУ МВД] Требуется сотрудник ППС к дежурной части города Приволжск.", "0")
Return

:?:/врозыск::
GetArgsForHotstring("врозыск", "Pass")
SendPlay {Enter}
SendChat("ro [" Tag "][ГУ МВД] Объявите в розыск гражданина с серией паспорта " Pass ".", "0")
Return

:?:/об+::
SendPlay {Enter}
SendChat("ro [" Tag "][МВД] Выехал в областное патрулирование.", "0")
Return

:?:/обп::
SendPlay {Enter}
SendChat("ro [" Tag "][МВД] Контролирую город [П].", "0")
Return

:?:/обм::
SendPlay {Enter}
SendChat("ro [" Tag "][МВД] Контролирую город [М].", "0")
Return

:?:/обн::
SendPlay {Enter}
SendChat("ro [" Tag "][МВД] Контролирую город [Н].", "0")
Return

:?:/об-::
SendPlay {Enter}
SendChat("ro [" Tag "][МВД] Закончил областное патрулирование.", "0")
Return

:?:/вп+::
SendPlay {Enter}
SendChat("ro [" Tag " ВП][МВД] Начал воздушное патрулирование.", "0")
Return

:?:/вп::
SendPlay {Enter}
SendChat("ro [" Tag " ВП][МВД] Продолжаю воздушное патрулирование.", "0")
Return

:?:/вп-::
SendPlay {Enter}
SendChat("ro [" Tag " ВП][МВД] Закончил воздушное патрулирование. Иду на посадку.", "0")
Return

:?:/сб+::
SendPlay {Enter}
SendChat("ro [" Tag " СБ][МВД] Начали спецоперацию по отлову граждан с большим количеством неоплаченных штрафов.", "0")
Return

:?:/сб::
SendPlay {Enter}
SendChat("ro [" Tag " СБ][МВД] Продолжаем спецоперацию по отлову граждан с большим количеством неоплаченных штрафов.", "0")
Return

:?:/сб-::
SendPlay {Enter}
SendChat("ro [" Tag " СБ][МВД] Закончили спецоперацию по отлову граждан с большим количеством неоплаченных штрафов.", "0")
Return

:?:/код0::
GetArgsForHotstring("код0", "Place")
SendPlay {Enter}
SendChat("ro [" Tag "][МВД] Код-0. Местоположение: " Place ".", "0")
Return

:?:/код0п::
GetArgsForHotstring("код0п", "Place")
SendPlay {Enter}
SendChat("me нажа" lla " кнопку тревоги на панели управления системы ""Око""", "0")
SendChat("do Сигнал тревоги с координатами отправлен в дежурную часть управления.", "0")
Sleep 15000
SendChat("ro [Система ""Око""][МВД] Код-0. Активирована кнопка тревоги. Местоположение: " Place ".", "0")
Return

:?:/код0с::
GetArgsForHotstring("код0с", "Place")
SendPlay {Enter}
SendChat("me незаметно нажа" lla " кнопку тревоги, вшитую в форму и подключённую к планшету марки ""MIG LT11i""", "0")
SendChat("do Сигнал тревоги с координатами отправлен в дежурную часть управления.", "0")
Sleep 15000
SendChat("ro [MIG LT11i " License "][МВД] Код-0. Активирована кнопка тревоги. Местоположение: " Place ".", "0")
Return

:?:/асмп::
GetArgsForHotstring("асмп", "Place")
SendPlay {Enter}
SendChat("d [" Tag "][МЗ] Требуется АСМП. Местоположение: " Place ".", "0")
Return


/*
:?:/::
SendPlay {Enter}
SendChat("", "0")
Return
*/
        }
        ; #include cam.ahk
    
        :?:/грз::
        GetArgsForHotstring("грз", "GovNumber")
        SendPlay {Enter}
        Gosub Findcar
        Return
        
        :?:/р+::
        SendPlay {Enter}
        Gosub RadioEnable
        Return
        
        :?:/р-::
        SendPlay {Enter}
        Gosub RadioDisable
        Return
        
        :?:/м::
        GetArgsForHotstring("м", "Message")
        SendPlay {Enter}
        Gosub Megafon
        Return
        
        :?:/т1::
        SendPlay {Enter}
        Gosub TaumetrOn
        Return
        
        :?:/т2::
        SendPlay {Enter}
        Gosub Taumetr
        Return
        
        :?:/т3::
        SendPlay {Enter}
        Gosub TaumetrOff
        Return
        
        :?:/тс1::
        SendPlay {Enter}
        Gosub TaumetrSertOn
        Return
        
        :?:/тс2::
        SendPlay {Enter}
        Gosub TaumetrSert
        Return
        
        :?:/тс3::
        SendPlay {Enter}
        Gosub TaumetrSertOff
        Return
        
        :?:/двр1::
        SendPlay {Enter}
        Gosub DVRGet
        Return
        
        :?:/двр2::
        SendPlay {Enter}
        Gosub DVROn
        Return
    
        :?:/двр3::
        SendPlay {Enter}
        Gosub DVROff
        Return
        
        :?:/двр4::
        SendPlay {Enter}
        Gosub DVRSet
        Return
        
        :?:/нк::
        SendPlay {Enter}
        SendChat("", "0")
        Return
        
        :?:/алко1::
        SendPlay {Enter}
        Gosub AlcoGet
        Return
        
        :?:/алко2::
        SendPlay {Enter}
        Gosub AlcoSertOn
        Return
        
        :?:/алко3::
        SendPlay {Enter}
        Gosub AlcoSertOff
        Return
        
        :?:/алко4::
        SendPlay {Enter}
        Gosub AlcoPipe
        Return
        
        :?:/алко5::
        SendPlay {Enter}
        Gosub AlcoOn
        Return
        
        :?:/алко6::
        SendPlay {Enter}
        Gosub AlcoOff
        Return
        
        :?:/дтпфото::
        SendPlay {Enter}
        Gosub DTPPhotoFix
        Return
        
        :?:/дтпторм::
        SendPlay {Enter}
        Gosub DTPBrakeDist
        Return
    
        :?:/дтппротокол::
        SendPlay {Enter}
        Gosub DTPProtocol
        Return
        
        :?:/камеры::
        SendPlay {Enter}
        Gosub StreetCameras
        Return
        
        :?:/файнс::
        SendPlay {Enter}
        Gosub Fines
        Return
        
        :?:/удо+::
        GetArgsForHotstring("удо{+}", "ID")
        SendPlay {Enter}
        Gosub LicenseOpenCom
        Return
    
        :?:/удо-::
        SendPlay {Enter}
        Gosub LicenseClose
        Return
        
        :?:/кпк+::
        SendPlay {Enter}
        Gosub PDAOn
        Return
    
        :?:/кпк-::
        SendPlay {Enter}
        Gosub PDAOff
        Return
        
        :?:/доки::
        SendPlay {Enter}
        Gosub AskDocuments
        Return
        
        :?:/доки+::
        SendPlay {Enter}
        Gosub TakeDocuments
        Return
    
        :?:/доки-::
        SendPlay {Enter}
        Gosub ReturnDocuments
        Return
    
        :?:/скан::
        GetArgsForHotstring("скан", "ID")
        SendPlay {Enter}
        Gosub SkanCom
        Return
        
        :?:/кримрек::
        GetArgsForHotstring("скан", "ID")
        SendPlay {Enter}
        Gosub CrimrecCom
        Return
    
        :?:/протокол::
        SendPlay {Enter}
        Gosub Protocol
        Return
    
        :?:/подпись::
        SendPlay {Enter}
        Gosub GiveProtocolForSignature
        Return
    
        :?:/несогл::
        SendPlay {Enter}
        Gosub GiveProtocolCopyReject
        Return
    
        :?:/копиянаруч::
        SendPlay {Enter}
        Gosub GiveProtocolCuffed
        Return
    
        :?:/копия::
        SendPlay {Enter}
        Gosub GiveProtocolCopy
        Return
        
        :?:/копияназад::
        SendPlay {Enter}
        Gosub CopyReject
        Return
    
        :?:/штраф::
        GetArgsForHotstring("штраф", "ID")
        SendPlay {Enter} 
        Gosub TsuCom
        Return
    
        :?:/лишправ::
        GetArgsForHotstring("лишправ", "ID")
        SendPlay {Enter}
        Gosub TakecarlicCom
        Return
    
        :?:/конвой::
        GetArgsForHotstring("конвой", "ID")
        SendPlay {Enter}
        Gosub ArrCom
        Return
    
        :?:/конвой-::
        GetArgsForHotstring("конвой-", "ID")
        SendPlay {Enter}
        Gosub Dearr
        Return
    
        :?:/впа::
        GetArgsForHotstring("впа", "ID")
        SendPlay {Enter}
        Gosub PutplCom
        Return
    
        :?:/изпа::
        GetArgsForHotstring("изпа", "ID")
        SendPlay {Enter}
        Gosub EjectCom
        Return
    
        :?:/рейд+::
        SendPlay {Enter}
        Gosub RaidOrderOn
        Return
    
        :?:/рейд-::
        SendPlay {Enter}
        Gosub RaidOrderOff
        Return
        }
         ; Текстовые бинды с метками
    Knock:
    SendChat("me постуча" lla " в окно", "0")
    Return
    
    ColleagueGreeting:
    SendChat("animarmy 3", "500")
    SendChat("say Здравия желаю!", "0")
    Return
    
    CivilianGreeting:
    SendChat("animarmy 3", "500")
    SendChat("say Здравия желаю, " Post ", " Rank " полиции " Surname ". ", "500")
    
    PoliceBadge:
    SendChat("do На груди закреплен полицейский знак с личным номером: " License ".", "500")
    
    Pogon:
    SendChat("do На плечах " PogonArr[Rank] ".", "500")
    Return
    
    LicenseOpen:
    GetInput("ID", "Показать удостоверение.`nВведите ID гражданина:", "Показать удостоверение. Введите ID гражданина:")
    LicenseOpenCom:
    ;SendChat("do Удостоверение лежит в нагрудном кармане.", "500")
    ;SendChat("me доста" lla " удостоверение из нагрудного кармана и разверну" lla " его", "500")
    ; SendChat("do Удостоверение №" License ": " Rank ", " Post ", " Surname " " Name " " SecondName " [УГИБДД г. Мирный].", "500")
    SendChat("ud " ID, "0")
    Return
    
    LicenseClose:
    SendChat("me закры" lla " удостоверение и убра" lla " его в нагрудный карман", "0")
    Return
    
    AskDocuments:
    SendChat("say Гражданин, передайте ваше водительское удостоверение,", "500")
    SendChat("say а также паспорт технического средства.", "500")
    SendChat("b /me передал(-а) документы инспектору ДПС", "500")
    SendChat("b /lic [Мой ID] || F3 → Показать ПТС", "500")
    Return
    
    TakeDocuments:
    SendChat("me протяну" lla " правую руку и взя" lla " документы гражданина", "5000")
    SendChat("me изучив документы гражданина, убра" lla " их в нагрудный карман", "0")
    Return
    
    Protocol:
    if (MB) {
        SendChat("do На боковой части мотоцикла закреплена пластиковая кофра.", "2500")
        SendChat("me откры" lla " кофру и доста" lla " из нее планшетку с бланками протоколов и ручкой", "2500")
    } else {
        SendChat("do Планшетка с бланками протокола и ручкой на торпеде патрульного автомобиля.", "2500")
        SendChat("me взя" lla " планшетку с бланками протокола и ручкой с торпеды патрульного автомобиля", "2500")
    }
    SendChat("me взя" lla " ручку с планшетки и нача" lla " оформлять протокол", "2500")
    SendChat("me заполни" lla " личные данные водителя", "2500")
    SendChat("me заполни" lla " статью, нарушенную водителем", "2500")
    SendChat("me постави" lla " дату " A_DD "." A_MM "." A_YYYY " и подпись '" Signature "'", "2500")
    SendChat("do Протокол составлен.", "0")
    Return
    
    GiveProtocolForSignature:
    SendChat("me переда" lla " планшетку с бланками протоколов и ручкой гражданину", "500")   
    SendChat("say Уважаемый, ознакомьтесь с протоколом и поставьте Вашу подпись, если согласны.", "500")
    SendChat("b /me расписался(-ась) в протоколе", "0")
    Return
    
    GiveProtocolCuffed:
    SendChat("me постави" lla " метку о невозможности получения подписи", "500")
    SendChat("me вырва" lla " копию протокола и положи" lla " ее на колени задержанному", "0")
    Return
    
    GiveProtocolCopyReject:
    SendChat("me постави" lla " отметку о несогласии", "500")
    SendChat("me вырва" lla " копию протокола и переда" lla " ее гражданину", "500")
    SendChat("say Уважаемый, возьмите, пожалуйста, копию протокола.", "500")
    SendChat("say Без копии протокола вы не сможете обжаловать мое решение.", "500")
    SendChat("b /me взял(-а) копию", "0")
    Return
    
    CopyReject:
    SendChat("me вложи" lla " копию обратно в планшетку", "0")
    Return
    
    GiveProtocolCopy:
    SendChat("me взя" lla " планшетку с бланками протокола и ручкой у гражданина", "500")
    SendChat("me вырва" lla " копию протокола и переда" lla " ее гражданину", "500")
    SendChat("say Уважаемый, возьмите, пожалуйста, копию протокола.", "500")
    SendChat("say Без копии протокола вы не сможете обжаловать мое решение.", "500")
    SendChat("b /me взял(-а) копию", "0")
    Return
    
    ReturnDocuments:
    SendChat("do Документ гражданина в нагрудном кармане.", "500")
    SendChat("me доста" lla " документы из нагрудного кармана и верну" lla " гражданину", "500")
    SendChat("say Уважаемый, держите ваши документы. Удачи на дорогах, соблюдайте ПДД.", "500")
    SendChat("b /me взял(-а) документы", "0")
    Return
    
    Cuff:
    GetInput("ID", "Надеть наручники.`nВведите ID подозреваемого:", "Надеть наручники. Введите ID подозреваемого:")
    SendChat("say Гражданин, вы имеете право хранить молчание!", "5")
    SendChat("me сня" lla " наручники с пояса и застегну" lla " их на нарушителе", "5")
    SendChat("cuff " ID, "0")
    Return
    
    Uncuff:
    GetInput("ID", "Снять наручники.`nВведите ID подозреваемого:", "Снять наручники. Введите ID подозреваемого:")
    SendChat("me сня" lla " наручники с нарушителя и закрепи" lla " их за поясом", "500")
    SendChat("uncuff " ID, "0")
    Return
    
    Putpl:
    GetInput("ID", "Посадить в ПА.`nВведите ID задержанного:", "Посадить в ПА. Введите ID задержанного:")
    
    PutplCom:
    SendChat("say Берегите голову при посадке в автомобиль!", "500")
    SendChat("me взя" lla " нарушителя за руки и посади" lla " в служебный автомобиль", "5000")
    SendChat("putpl" ID, "0")
    Return
    
    Eject:
    GetInput("ID", "Высадить из ПА.`nВведите ID задержанного:", "Высадить из ПА. Введите ID задержанного:")
    
    EjectCom:
    SendChat("me вытащи" lla " задержанного из автомобиля", "500")
    ; SendChat("do Задержанный стоит на улице.", "5000")
    SendChat("eject" ID, "0")
    Return
    
    Arr:
    GetInput("ID", "Конвоировать нарушителя.`nВведите ID подозреваемого:", "Конвоировать нарушителя. Введите ID подозреваемого:")
    
    ArrCom:
    SendChat("me залома" lla " задержанного и пове" lla " его за собой", "500")
    SendChat("arr " ID, "0")
    Return
    
    Dearr:
    SendChat("me ослаби" lla " хват и отпусти" lla " задержанного", "500")
    SendChat("dearr", "0")
    Return
    
    RadioEnable:
    SendChat("me включи" lla " звук на рации", "5")
    SendChat("fracvoice 2", "0")
    Return
    
    RadioOn:
    SendChat("do Рация ТАКТ-363 П45 закреплена на нагрудном кармане.", "5")
    SendChat("me сня" lla " рацию с нагрудного кармана и нажа" lla " кнопку для переговоров", "5")
    SendChat("fracvoice 1", "0")
    Return
    
    RadioOff:
    SendChat("me закончив переговоры, повеси" lla " рацию на нагрудный карман", "5")
    SendChat("fracvoice 2", "0")
    Return    

    RadioDisable:
    SendChat("me отключи" lla " звук на рации", "5")
    SendChat("fracvoice 0", "0")
    Return
    
    MegafonOn:
    if (MB) {
        SendChat("do Переговорное устройство закреплено на руле.", "5")
        SendChat("me активирова" lla " переговорное устройство", "5")
    } else {
        SendChat("do Тангета СГУ ""Ермак"" закреплена на торпеде.", "5")
        SendChat("me сня" lla " тангету с крепления и, зажав кнопку звукоусиления, прислони" lla " ко рту", "5")
    }
    Return
    
    MegafonOff:
    if (MB) 
        SendChat("me сказав что-то в микрофон, выключи" lla " переговорное устройство", "0")
    else 
        SendChat("me отпусти" lla " кнопку и верну" lla " тангету на крепление", "0")
    Return
    
    Megafon:
    Gosub MegafonOn
    SendChat("m " Message, "5")
    Gosub MegafonOff
    Return
    
    FirstColumn:
    Gosub MegafonOn
    SendChat("m Водители, внимание, движется организованная колонна!", "5")
    Gosub MegafonOff
    Return
    
    SecondColumn:
    Gosub MegafonOn
    SendChat("m Водители, внимание! Движется организованная колонна, останавливаемся!", "5")
    Gosub MegafonOff
    Return
    
    ThirdColumn:
    Gosub MegafonOn
    SendChat("m Водители, внимание! Продолжаем движение! Организованная колонна проехала!", "5")
    Gosub MegafonOff
    Return
    
    FirstWarn:
    Gosub MegafonOn
    SendChat("m #99ff33 Водитель, примите крайнее правое положение и остановитесь!", "5")
    Gosub MegafonOff
    Return
    
    SecondWarn:
    Gosub MegafonOn
    SendChat("m Повторяю, водитель, прижмитесь вправо и остановитесь!", "5")
    Gosub MegafonOff
    Return
    
    ThirdWarn:
    Gosub MegafonOn
    SendChat("m #e74c3c Останавливайтесь! В случае отказа откроем огонь!", "5")
    Gosub MegafonOff
    Return
    
    SkipWarn:
    Gosub MegafonOn
    if (MB) 
        SendChat("m Уступите дорогу служебному мотоциклу!", "5")
    else 
        SendChat("m Уступите дорогу служебному автомобилю!", "5")
    Gosub MegafonOff
    Return
    
    WalkWarn:
    SendChat("s Гражданин, немедленно остановитесь, иначе откроем огонь!", "0")
    Return
    
    PDAOn:
    SendChat("do Планшет марки “MIG LT11i” в кармане.", "500")
    SendChat("me доста" lla " планшет из кармана и запусти" lla " его", "500")
    Return
    
    PDAOff:
    SendChat("me выключи" lla " планшет и убра" lla " в карман", "500")
    Return
    
    Fines:
    SendChat("me подключи" lla syaas " к базе данных", "5")
    SendChat("me запроси" lla " данные гражданских с неоплаченными штрафами в реальном времени", "5")
    SendChat("do Данные получены в реальном времени.", "5")
    SendChat("fines", "0")
    Return
    
    Wanted:
    SendChat("me подключи" lla syaas " к базе данных", "5")
    SendChat("me запроси" lla " данные гражданских в федеральном розыске в реальном времени", "5")
    SendChat("do Данные получены в реальном времени.", "5")
    SendChat("wanted", "0")
    Return
    
    Skan:
    GetInput("ID", "Пробить водителя по базе на штрафы.`nВведите ID водителя:", "Пробить водителя на штрафы.`nВведите ID водителя:")
    
    SkanCom:
    SendChat("me откры" lla " базу данных неоплаченных штрафов", "500")
    SendChat("me ввё" lla " данные водителя в строку поиска и нажа" lla " кнопку 'Запросить'", "500")
    SendChat("do Информация о водителе высветилась на экране.", "500")
    SendChat("skan " ID, "0")
    Return
    
    Crimrec:
    GetInput("ID", "Пробить водителя по базе нарушений.`nВведите ID водителя:", "Пробить водителя по базе нарушений.`nВведите ID водителя:")
    CrimrecCom:
    SendChat("me откры" lla " базу данных правонарушений", "500")
    SendChat("me ввё" lla " данные водителя в строку поиска и нажа" lla " кнопку 'Запросить'", "500")
    SendChat("do Информация о водителе высветилась на экране.", "500")
    SendChat("crimrec " ID, "0")
    Return
    
    Tsu:
    GetInput("ID", "Выписать штраф.`nВведите [ID сумма причина]:", "Выписать штраф.`nВведите [ID сумма причина]:")
    TsuCom:
    SendChat("me внес" la " данные о нарушении водителя в базу", "500")
    SendChat("do Данные введены.", "500")
    SendChat("tsu " ID, "0")
    Return
    
    Takecarlic:
    GetInput("ID", "Аннулировать ВУ.`nВведите [ID срок]:", "Аннулировать ВУ. Введите [ID срок]:")
    TakecarlicCom:
    SendChat("me внес" la " данные о недействительности ВУ водителя", "500")
    SendChat("do Данные введены.", "500")
    SendChat("say Ваши права больше недействительны. Идите на пересдачу в автошколу!", "500")
    SendChat("takecarlic " ID, "0")
    Return
    
    Findcar:
    ; GetInput("GovNumber", "Пробить гос. номер по базе.`nВведите номер:", "Пробить гос. номер. Введите номер:")
    SendChat("me откры" lla " базу данных автомобильных номеров", "500")
    SendChat("me вве" lla " номер автомобиля в базу данных и узна" lla " данные владельца автомобиля", "500")
    SendChat("do Информация о владельце автомобиля высветилась на экране.", "500")
    SendChat("findcar " GovNumber, "0")
    Return
    
    BreakGlass:
    SendChat("me замахну" lla syaas " дубинкой и удари" lla " по стеклу", "5")
    SendChat("try разби" lla " стекло дубинкой", "5")
    if(GetTryRes())
        SendChat("do Стекло разбито.", "0")
    else
        SendChat("do Сотрудни" kuce " не удалось разбить стекло.", "0")
    Return
    
    OpenDoor:
    SendChat("me потяну" lla syaas " рукой до дверного замка и откры" lla " его изнутри", "5")
    SendChat("me откры" lla " дверь", "0")
    Return
    
    PullCivilian:
    SendChat("try вытащи" lla " гражданина напротив из автомобиля", "5")
    if(GetTryRes())
        SendChat("do Гражданин на земле.", "0")
    else
        SendChat("do Сотрудни" kuce " не удалось вытащить гражданина из автомобиля.", "0")
    Return
    
    DTPPhotofix:
    SendChat("do Фотоаппарат в кармане.", "5000")
    SendChat("me доста" lla " из кармана фотоаппарат, зафиксирова" lla " место ДТП", "5000")
    SendChat("me выключив фотоаппарат, убра" lla " его в карман", "0")
    Return
    
    DTPBrakeDist:
    SendChat("do Рулетка в кармане.", "5000")
    SendChat("me достав рулетку, нача" lla " измерения тормозных путей", "5000")
    SendChat("do Измерение завершено.", "5000")
    SendChat("me собрав рулетку, убра" lla " её в карман", "0")
    Return
    
    DTPProtocol:
    ; SendChat("do На поясе у инспектора висит сумка с бланками.", "5000")
    SendChat("me доста" lla " бланк осмотра места ДТП, зарисова" lla " схему ДТП", "5000")
    SendChat("me сдела" lla " на схеме пометки со слов граждан", "5000")
    SendChat("me нанес" la " на схему значения, измеренные рулеткой, положи" lla " бланк в сумку", "5000")
    SendChat("me закончи" lla " заполнять схему ДТП, затем убра" lla " схему в сумку", "0")
    Return
    
    StreetCameras:
    SendChat("me откры" lla " базу данных камер видеонаблюдения и запроси" lla " запись с нужной камеры", "500")
    SendChat("me отмота" lla " запись на нужный момент и включи" lla " воспроизведение", "500")
    SendChat("do Запись с камеры воспроизводится на экране планшета.", "0")
    Return
    
    AlcoGet:
    SendChat("do Алкотестер в кармане.", "500")
    SendChat("me доста" lla " из кармана опломбированный электронный алкотестер с клеймом и показал его человеку напротив", "0")
    Return
    
    AlcoSertOn:
    SendChat("do В нагрудном кармане сотрудни" kaci " акт о техническом состоянии алкотестера с его пригодности к эксплуатации по назначению.", "500")
    SendChat("me доста" lla " акт из нагрудного кармана и передал человеку напротив", "500")
    SendChat("do Акт о техническом состоянии алкотестера: Алкотестер марки 'AlcoHunter' прошел полную проверку на достоверность измерений. ", "0")
    Return
    
    AlcoSertOff:
    SendChat("me взял акт и убра" lla " его в нагрудный карман", "500")
    Return
    
    AlcoPipe:
    SendChat("do В кармане одноразовый мундштук в герметичной упаковке.", "500")
    SendChat("me доста" lla " из кармана одноразовый мундштук и протянул его человеку напротив", "500")
    Return
    
    AlcoOn:
    SendChat("me протяну" lla " алкотестер ко рту гражданина напротив", "500")
    SendChat("say Дыхните в трубочку.", "0")
    Return
    
    AlcoOff:
    SendChat("me посмотре" lla " показания алкотестера", "500")
    SendChat("do Результат на экране алкотестера.", "500")
    SendChat("me выключи" lla " алкотестер и убра" lla " его в карман", "0")
    Return
    
    TaumetrOn:
    if(MB)
    {
        SendChat("do Тауметр в кофре патрульного мотоцикла.", "500")
        SendChat("me доста" lla " тауметр из кофры патрульного мотоцикла", "0")
    } else {
        SendChat("do Тауметр в бардачке патрульного автомобиля.", "500")
        SendChat("me доста" lla " тауметр из бардачка патрульного автомобиля", "0")
    }
    Return
 
    Taumetr:
    SendChat("me включи" lla " тауметр", "5000")
    SendChat("me произвё" lla " калибровку тауметра", "5000")
    SendChat("me нача" lla " измерять тонировку на лобовом стекле и передних боковых стеклах", "5000")
    SendChat("do Прибор показывает текущую светопропускаемость.", "0")
    Return
    
    TaumetrOff:
    if(MB)
    {
        SendChat("me выключи" lla " тауметр", "500")
        SendChat("me убра" lla " тауметр в кофру патрульного мотоцикла", "0")
    } else {
        SendChat("me выключи" lla " тауметр", "500")
        SendChat("me убра" lla " тауметр в бардачок патрульного автомобиля", "0")
    }
    Return
    
    TaumetrSertOn:
    if(MB)
    {
        SendChat("do Свидетельство о поверке прибора лежит в кофре патрульного мотоцикла.", "500")
        SendChat("me доста" lla " свидетельство из кофры патрульного мотоцикла", "0")
    } else {
        SendChat("do Свидетельство о поверке прибора лежит в бардачке патрульного автомобиля.", "500")
        SendChat("me доста" lla " свидетельство из бардачка патрульного автомобиля", "0")
    }
    Return
 
    TaumetrSert:
    SendChat("me показа" lla " свидетельство гражданину напротив", "500")
    SendChat("do Свидетельство о поверке: устройство для измерения светопропускаемости тонировки ""Тоник"", действительно до 31.12." A_YYYY ".", "0")
    Return
    
    TaumetrSertOff:
    if(MB)
    {
        SendChat("me убра" lla " свидетельство о поверке прибора в кофру патрульного мотоцикла", "0")
    } else {
        SendChat("me убра" lla " свидетельство о поверке прибора в бардачок патрульного автомобиля", "0")
    }
    Return

    DVRGet:
    if (MB) {
        SendChat("do На шлеме закреплен видеорегистратор.", "500")
        SendChat("me протяну" lla " руку и сня" lla " видеорегистратор", "0")
    } else {
        SendChat("do Видеорегистратор закреплен на лобовом стекле.", "500")
        SendChat("me сня" lla " видеорегистратор с крепления", "0")
    }
    Return
    
    DVROn:
    SendChat("me откры" lla " нужный файл и подготови" lla " его к просмотру", "5000")
    SendChat("me повернув видеорегистратор в сторону гражданина, запусти" lla " запись", "0")
    Return
    
    DVROff:
    SendChat("me выключи" lla " воспроизведение видеофайла", "0")
    Return
    
    DVRSet:
    if (MB)
        SendChat("me выключи" lla " воспроизведение записи и закрепи" lla " его на шлеме", "0")
    else
        SendChat("me закрепи" lla " видеорегистратор на крепление", "0")
    Return
    
    RaidOrderOn:
    SendChat("do В нагрудном кармане лежит приказ о проведении рейда.", "500")
    SendChat("me доста" lla " приказ, разверну" lla " его и показа" lla " гражданину напротив", "500")
    SendChat("do Приказ №098: гербовая печать, подпись начальника " Struct " МВД РП [от " A_DD "." A_MM "." A_YYYY "].", "0")
    Return
    
    RaidOrderOff:
    SendChat("me сложи" lla " приказ и убра" lla " в нагрудный карман", "0")
    Return
    
    SayPogon:
    SendChat("say Снимайте старые погоны и сдайте удостоверение.", "500")
    Return

    GivePogon:
    SendChat("me забра" lla " погоны и удостоверение сотрудника и убра" lla " их в нижний ящик стола", "500")
    SendChat("do Новые погоны и пустые удостоверения с подписью начальника УГИБДД в верхнем ящике стола.", "500")
    SendChat("me доста" lla " " PogonArr[Rank] " и положи" lla " перед сотрудником", "500")
    SendChat("me доста" lla " пустое удостоверение и заполни" lla " данные сотрудника", "500")
    SendChat("me вклеи" lla " фотографию сотрудника и постави" lla " гербовую печать управления", "500")
    SendChat("me закры" lla " удостоверение и положи" lla " перед сотрудником", "500")
    SendChat("say Закрепляйте погоны, забирайте удостоверение. Поздравляю с повышением!", "0")
    Return
    
    ReadLection:
    ReadComFile(FileForRead)
    Return


}   