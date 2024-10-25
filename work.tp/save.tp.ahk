#SingleInstance Force
#NoEnv
#Include Hotkey.ahk
; Script powered in 2022 by AHK Province & Techno's studio (techno)
; All rights reserwed
; vk.com/technostd
; vk.com/provinceahk

; MsgBox %A_ScriptFullPath%`n%A_IsAdmin%`n%0% %1% %2% %3%

{ ; Основные переменные
Global DataPath := A_WorkingDir "\tp.prv"
Global DefaultHotkeysPath := A_Temp "\default.tp.prv"
Global DataSection := "TPData"
Global HotkeySection := "TPHotkeys"

Hotkey_IniPath(A_ScriptDir "\tp.prv")
Hotkey_IniSection("TPHotkeys")

Global Version := "2.15"  
Global GuiVersion := "2.1.5"
Global TextCreator = techno & Sokol
Global TextGroup = AHK Province
Global TextFooter := "by techno && Sokol | AHK Province ©2022"
Global DataFields := ["City", "License", "Surname", "Name", "SecondName", "Rank", "Post", "Signature", "Gender", "MB"]

Global HotkeysEnabled := False

Global HotkeyFields := {"00Knock": ["1", "Постучать в окно"], "01CivilianGreeting": ["1", "Приветствие гражд."], "02PoliceBadge": ["1", "Полицейский значок"], "03ColleagueGreeting": ["1", "Воинское приветствие"],  "04LicenseOpen": ["1", "Удостоверение+"], "05LicenseClose": ["1", "Удостоверение-"], "06TakeDocuments": ["1", "Взять документы"], "07ReturnDocuments": ["1", "Вернуть документы"], "08PDAOn": ["1", "КПК+"], "09PDAOff": ["1", "КПК-"], "10Skan": ["1", "Пробить по базе"], "11Protocol": ["1", "Составить протокол"], "12GiveProtocolForSignature": ["1", "Протокол на подпись"], "13GiveProtocolCopyReject": ["1", "Метка о несогласии"], "14GiveProtocolCuffed": ["1", "Копия на колени"], "15GiveProtocolCopy": ["1", "Копия протокола"], "16Tsu": ["1", "Выписать штраф"], "17Takecarlic": ["1", "Аннулировать ВУ"], "18RadioOn": ["1", "Рация+"], "19RadioOff": ["1", "Рация-"], "20MegafonOn": ["1", "Мегафон+"], "21MegafonOff": ["1", "Мегафон-"], "22WalkWarn": ["1", "Пешее предупр."], "23SkipWarn": ["1", "Пропуск сл. авто"], "24Wanted": ["1", "/wanted"], "25FirstColumn": ["1", "Колонна 1"], "26SecondColumn": ["1", "Колонна 2"], "27ThirdColumn": ["1", "Колонна 3"], "28FirstWarn": ["1", "Предупреждение 1"], "29SecondWarn": ["1", "Предупреждение 2"], "30ThirdWarn": ["1", "Предупреждение 3"], "31TaumetrOn": ["1", "Достать тауметр"], "32Taumetr": ["1", "Измерить тонировку"], "33TaumetrOff": ["1", "Убрать тауметр"], "01BreakGlass": ["2", "Сломать стекло"], "02OpenDoor": ["2", "Открыть дверь"], "03PullCivilian": ["2", "Вытащить из машины"], "04Cuff": ["2", "Наручники+"], "05Uncuff": ["2", "Наручники-"], "06Arr": ["2", "Конвой+"], "07Dearr": ["2", "Конвой-"], "08Putpl": ["2", "Посадить в ПА"], "09Eject": ["2", "Высадить из ПА"], "01BatonOn": ["3", "Дубинка+"], "02BatonOff": ["3", "Дубинка-"], "03TaserOn": ["3", "Электрошокер+"], "04TaserOff": ["3", "Электрошокер-"], "05PistolOn": ["3", "Пистолет+"], "06PistolOff": ["3", "Пистолет-"], "07RifleOn": ["3", "АК-74М+"], "08RifleOff": ["3", "АК-74М-"], "09ShotgunOn": ["3", "Дробовик+"], "10ShotgunOff": ["3", "Дробовик-"], "11StickOn": ["3", "Жезл+"], "12StickOff": ["3", "Жезл-"]}



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

Global DataControls := ["ChooseCity", "EditLicense", "EditSurname", "EditName", "EditSecondName", "ChooseRank", "EditPost", "EditSignature", "Gender", "CheckMB"]

Global InputType := False ; True - GUI, False - console

Global Cities := "Мирный||Приволжск|Невский"
Global Ranks := "Рядовой||Сержант|Старшина|Прапорщик|Лейтенант|Старший лейтенант|Капитан|Майор|Подполковник|Полковник|Генерал-майор|Генерал-лейтенант|Генерал-полковник|Генерал МВД"
Global RanksArr := {"Рядовой": "do На плечах закреплены пустые погоны.", "Сержант": "do На плечах закреплены погоны с тремя лычками поперек погон.", "Старшина": "do На плечах погоны с одной лычкой вдоль погон.", "Прапорщик": "do На плечах погоны с двумя звездами вдоль погон.", "Лейтенант": "do На плечах погоны с двумя звездами и просветом.", "Старший лейтенант": "do На плечах погоны с тремя звездами и просветом.", "Капитан": "do На плечах погоны с четырьмя звездами и просветом.", "Майор": "do На плечах погоны с одной звездой и двумя просветами.", "Подполковник": "do На плечах погоны с двумя звездами и двумя просветами.", "Полковник": "do На плечах погоны с тремя звездами и двумя просветами.", "Генерал-майор": "do На плечах погоны с одной большой звездой.", "Генерал-лейтенант": "do На плечах погоны с двумя большими звездами.", "Генерал-полковник": "do На плечах погоны с тремя большими звездами.", "Генерал МВД": "do На плечах погоны с одной большой звездой и гербом МВД."}

Global City
Global License
Global Surname
Global Name
Global SecondName
Global Rank
Global Post
Global Signature
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
Global RadioMale
Global RadioFemale
Global CheckMB
Global ButtonEditText

}


CheckAdmin()
{
/*
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
*/
}

CheckUpdate()
{
	FileDelete, %A_Temp%\update.exe
	Http := ComObjCreate("WinHttp.WinHttpRequest.5.1")
    Http.Open("GET", "https://github.com/sokolin05/profile.tp/raw/main/version.profile.md")
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
    
    Gui Upd:Font, s12 c000000 Bold, Trebuchet MS
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
    URL = https://github.com/sokolin05/profile.tp/raw/main/ahk.tp.exe
    ;URL = https://my-files.su/Save/d6bcxl/ahk.tp.exe
	URLDownloadToFile, %URL%, %A_Temp%\update.exe
	PID := DllCall("GetCurrentProcessId")
	Run %A_Temp%\update.exe /update "%PID%" "%A_ScriptFullPath%"
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
}


RefreshTray() ; Трэй
{
TrayTip, AHK ГИБДД #5 (%GuiVersion%), Скрипт успешно запущен.

Menu, Tray, NoStandard
Menu, Tray, Add, VKowner
Menu, Tray, Rename, VKowner, AHK Province
Menu, Tray, Add ; SEPARATOR
Menu, Tray, Add, VKmemo
Menu, Tray, Rename, VKmemo, Памятка
Menu, Tray, Add ; SEPARATOR
Menu, Tray, Add, ReloadMenu
Menu, Tray, Rename, ReloadMenu, Перезапуск
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
Global URLForumPDD      := "https://forum.gtaprovince.ru/topic/456460-ministerstvo-vnutrennih-del-pravila-dorozhnogo-dvizheniya-respubliki-provinciya/"
Global URLForumUPK      := "https://forum.gtaprovince.ru/topic/456462-министерство-внутренних-дел-уголовно-процессуальный-кодекс/"
Global URLForumKoAP     := "https://forum.gtaprovince.ru/topic/456454-ministerstvo-vnutrennih-del-kodeks-ob-administrativnyh-pravonarusheniyah/"
Global URLMetodGIBDD    := "https://forum.gtaprovince.ru/topic/418696-министерство-внутренних-дел-методичка-гибдд-wip/"
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
        Tag=ГИБДД-М    
    }

    if(City=="Приволжск")
    {
        Struct=УГИБДД по г. Приволжск
        Tag=ГИБДД-П    
    }
    
    if(City=="Невский")
    {
        Struct=УГИБДД по г. Невский
        Tag=ГИБДД-Н    
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
    DefaultHotkeysPath = %A_Temp%\default.tp.prv
    URLDownloadToFile https://raw.githubusercontent.com/sokolin05/profile.tp/main/default.tp.prv, %A_Temp%\default.tp.prv
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
Gui 1:Font, s10 CDefault, Trebuchet MS

; -------------------------------------------------- Footer -------------------------------------------------
Gui 1:Font, s10 c545454
Gui 1:Add, Text, x002 y985 w100 h15, v%GuiVersion%
Gui 1:Add, Text, x598 yp w300 h15 Right, %TextFooter%

Gui 1:Font, s16 c000000
Gui 1:Add, Button, x025 y945 w150 h30 gButtonEdit vButtonEditText, Изменить
Gui 1:Add, Button, xp+175 yp w150 h30 gButtonData, Анкета
Gui 1:Add, Button, xp+175 yp w150 h30 gButtonHelp, Помощь
Gui 1:Add, Button, xp+175 yp w150 h30 gButtonReload, Перезапуск
Gui 1:Add, Button, xp+175 yp w150 h30 gButtonClose, Закрыть


Gui 1:Add, Tab, x200 y-1 h35 w920 Bottom, Основное|Документы ;|Рация|Дополнительно
; Gui 1:Add, Text, x0 y5 h35 w920 Center, Здесь скоро появятся разделы
Gui 1:Tab, 1

Gui 1:Add, GroupBox, x015 y050 w290 h885, [ Основное ]
Gui 1:Add, GroupBox, x305 y050 w290 h280, [ Задержание ]
Gui 1:Add, GroupBox, x305 y315 w290 h620, [ Оружие ]
Gui 1:Add, GroupBox, x595 y050 w290 h885, [ Команды ]

Gui 1:Font, Bold C000000 s7

Hotkey_Arr("OnlyEngSym", True)

Gui 1:Add, Text, x180 y050 Hidden
for Field, Value in HotkeyFields
{   
    if(Value[1]=="1")
    {
        Desc := Value[2]
        Label := SubStr(Field, 3)
        HotkeyValue := HotkeyValues[Label]
        Gui 1:Font, C000000 s9
        Gui 1:Add, Text, xp-160 yp+25 w150 h26 , % Desc
        Gui 1:Font, C540000 s8
        Hotkey_Add("xp+160 yp w120 -Center", Label, "KMJNDG1", Hotkey_Read(Label), "Save")
        
        Hotkey_Disable(Label)
        ; Gui 1:Add, Hotkey, xp+180 yp w100 h20 Disabled hwndhwnd, % HotkeyValue
        ; HotkeyHWNDs[Label] := hwnd
    }

}

Gui 1:Add, Text, x470 y050 Hidden
for Field, Value in HotkeyFields
{   
    if(Value[1]=="2")
    {
        Desc := Value[2]
        Label := SubStr(Field, 3)
        HotkeyValue := HotkeyValues[Label]
        Gui 1:Font, C000000 s9
        Gui 1:Add, Text, xp-160 yp+25 w150 h26 , % Desc
        Gui 1:Font, C540000 s8
        Hotkey_Add("xp+160 yp w120 -Center", Label, "KMJNDG1", Hotkey_Read(Label), "Save")
        
        Hotkey_Disable(Label)
        ; Gui 1:Add, Hotkey, xp+180 yp w100 h20 Disabled hwndhwnd, % HotkeyValue
        ; HotkeyHWNDs[Label] := hwnd
    }

}

Gui 1:Add, Text, x470 y315 Hidden
for Field, Value in HotkeyFields
{   
    if(Value[1]=="3")
    {
        Desc := Value[2]
        Label := SubStr(Field, 3)
        HotkeyValue := HotkeyValues[Label]
        Gui 1:Font, C000000
        Gui 1:Add, Text, xp-160 yp+27 w150 h26, % Desc
        Gui 1:Font, C540000
        Hotkey_Add("xp+160 yp w120 -Center", Label, "KMJNDG1", Hotkey_Read(Label), "Save")
        
        Hotkey_Disable(Label)
        ; Gui 1:Add, Hotkey, xp+180 yp w100 h20 Disabled hwndhwnd, % HotkeyValue
        ; HotkeyHWNDs[Label] := hwnd
    }

}

/*
; Основное
Gui 1:Font, Bold C000000 s10
Gui 1:Add, Text, x020 y080 w150 h20, Воинское приветст.
Gui 1:Add, Text, xp yp+20 w150 h20, Приветствие гражд.
Gui 1:Add, Text, xp yp+20 w150 h20, Удостоверение+
Gui 1:Add, Text, xp yp+20 w150 h20, Удостоверение-
Gui 1:Add, Text, xp yp+20 w150 h20, КПК+
Gui 1:Add, Text, xp yp+20 w150 h20, КПК-
Gui 1:Add, Text, xp yp+20 w150 h20, Взять документы
Gui 1:Add, Text, xp yp+20 w150 h20, Вернуть документы
Gui 1:Add, Text, xp yp+20 w150 h20, Пробить по базе (КПК)
Gui 1:Add, Text, xp yp+20 w150 h20, Составить протокол
Gui 1:Add, Text, xp yp+20 w150 h20, Протокол на подпись
Gui 1:Add, Text, xp yp+20 w150 h20, Метка о несогласии
Gui 1:Add, Text, xp yp+20 w150 h20, Копия протокола
Gui 1:Add, Text, xp yp+20 w150 h20, Копия на колени
Gui 1:Add, Text, xp yp+20 w150 h20, Выписать штраф (КПК)
Gui 1:Add, Text, xp yp+20 w150 h20, Взять рацию
Gui 1:Add, Text, xp yp+20 w150 h20, Убрать рацию
Gui 1:Add, Text, xp yp+20 w150 h20, Мегафон+
Gui 1:Add, Text, xp yp+20 w150 h20, Мегафон-
Gui 1:Add, Text, xp yp+20 w150 h20, Пешее предупр.
Gui 1:Add, Text, xp yp+20 w150 h20, Пропуск сл. авто
Gui 1:Add, Text, xp yp+20 w150 h20, /wanted
Gui 1:Add, Text, xp yp+20 w150 h20, Колонна 1
Gui 1:Add, Text, xp yp+20 w150 h20, Колонна 2
Gui 1:Add, Text, xp yp+20 w150 h20, Колонна 3
Gui 1:Add, Text, xp yp+20 w150 h20, Предупреждение 1
Gui 1:Add, Text, xp yp+20 w150 h20, Предупреждение 2
Gui 1:Add, Text, xp yp+20 w150 h20, Предупреждение 3

Gui 1:Font, Bold C540000
Gui 1:Add, Text, x200 y080 w100 h20, Ctrl + Numpad*
Gui 1:Add, Text, xp yp+20 w100 h20, Alt + 1
Gui 1:Add, Text, xp yp+20 w100 h20, Ctrl + 1
Gui 1:Add, Text, xp yp+20 w100 h20, Ctrl + q
Gui 1:Add, Text, xp yp+20 w100 h20, Ctrl + 3
Gui 1:Add, Text, xp yp+20 w100 h20, Alt + ``(ё)
Gui 1:Add, Text, xp yp+20 w100 h20, Ctrl + 2
Gui 1:Add, Text, xp yp+20 w100 h20, Ctrl + 9
Gui 1:Add, Text, xp yp+20 w100 h20, Ctrl + 4
Gui 1:Add, Text, xp yp+20 w100 h20, Ctrl + 5
Gui 1:Add, Text, xp yp+20 w100 h20, Ctrl + 6
Gui 1:Add, Text, xp yp+20 w100 h20, Ctrl + y
Gui 1:Add, Text, xp yp+20 w100 h20, Ctrl + 7
Gui 1:Add, Text, xp yp+20 w100 h20, Alt + y
Gui 1:Add, Text, xp yp+20 w100 h20, Ctrl + 8
Gui 1:Add, Text, xp yp+20 w100 h20, Ctrl + (-)
Gui 1:Add, Text, xp yp+20 w100 h20, Ctrl + (+)
Gui 1:Add, Text, xp yp+20 w100 h20, Ctrl + ([)
Gui 1:Add, Text, xp yp+20 w100 h20, Ctrl + (])
Gui 1:Add, Text, xp yp+20 w100 h20, Ctrl + Numpad1
Gui 1:Add, Text, xp yp+20 w100 h20, Ctrl + Numpad2
Gui 1:Add, Text, xp yp+20 w100 h20, Ctrl + Numpad3
Gui 1:Add, Text, xp yp+20 w100 h20, Ctrl + Numpad4
Gui 1:Add, Text, xp yp+20 w100 h20, Ctrl + Numpad5
Gui 1:Add, Text, xp yp+20 w100 h20, Ctrl + Numpad6
Gui 1:Add, Text, xp yp+20 w100 h20, Ctrl + Numpad7
Gui 1:Add, Text, xp yp+20 w100 h20, Ctrl + Numpad8
Gui 1:Add, Text, xp yp+20 w100 h20, Ctrl + Numpad9


Gui 1:Font, Bold C000000
Gui 1:Add, Text, x310 y080 w150 h20, Наручники+
Gui 1:Add, Text, xp yp+20 w150 h20, Наручники-
Gui 1:Add, Text, xp yp+20 w150 h20, Конвой+
Gui 1:Add, Text, xp yp+20 w150 h20, Конвой-
Gui 1:Add, Text, xp yp+20 w150 h20, Посадить в ПА
Gui 1:Add, Text, xp yp+20 w150 h20, Высадить из ПА
Gui 1:Add, Text, xp yp+20 w150 h20, Сломать стекло
Gui 1:Add, Text, xp yp+20 w150 h20, Открыть дверь
Gui 1:Add, Text, xp yp+20 w150 h20, Вытащить из машины

Gui 1:Font, Bold C540000
Gui 1:Add, Text, x490 y080 w100 h20, Alt + 2
Gui 1:Add, Text, xp yp+20 w100 h20, Alt + 3
Gui 1:Add, Text, xp yp+20 w100 h20, Alt + 4
Gui 1:Add, Text, xp yp+20 w100 h20, Alt + 5
Gui 1:Add, Text, xp yp+20 w100 h20, Alt + 6
Gui 1:Add, Text, xp yp+20 w100 h20, Alt + 7
Gui 1:Add, Text, xp yp+20 w100 h20, Alt + Numpad7
Gui 1:Add, Text, xp yp+20 w100 h20, Alt + Numpad8
Gui 1:Add, Text, xp yp+20 w100 h20, Alt + Numpad9

Gui 1:Font, Bold C000000 s10
Gui 1:Add, Text, x310 y290 w150 h20, Дубинка+
Gui 1:Add, Text, xp yp+20 w150 h20, Дубинка-
Gui 1:Add, Text, xp yp+20 w150 h20, Электрошокер+
Gui 1:Add, Text, xp yp+20 w150 h20, Электрошокер-
Gui 1:Add, Text, xp yp+20 w150 h20, Пистолет+
Gui 1:Add, Text, xp yp+20 w150 h20, Пистолет-
Gui 1:Add, Text, xp yp+20 w150 h20, АК-74М+
Gui 1:Add, Text, xp yp+20 w150 h20, АК-74М-
Gui 1:Add, Text, xp yp+20 w150 h20, Дробовик+
Gui 1:Add, Text, xp yp+20 w150 h20, Дробовик-
Gui 1:Add, Text, xp yp+20 w150 h20, Жезл+
Gui 1:Add, Text, xp yp+20 w150 h20, Жезл-


Gui 1:Font, Bold C540000
Gui 1:Add, Text, x490 y290 w100 h20, Ctrl + (,)
Gui 1:Add, Text, xp yp+20 w100 h20, Ctrl + (.)
Gui 1:Add, Text, xp yp+20 w100 h20, Alt + (,)
Gui 1:Add, Text, xp yp+20 w100 h20, Alt + (.)
Gui 1:Add, Text, xp yp+20 w100 h20, Ctrl + (;)
Gui 1:Add, Text, xp yp+20 w100 h20, Ctrl + (')
Gui 1:Add, Text, xp yp+20 w100 h20, Alt + (;)
Gui 1:Add, Text, xp yp+20 w100 h20, Alt + (')
Gui 1:Add, Text, xp yp+20 w100 h20, Ctrl + (/)
Gui 1:Add, Text, xp yp+20 w100 h20, Ctrl + (\)
Gui 1:Add, Text, xp yp+20 w100 h20, Alt + (/)
Gui 1:Add, Text, xp yp+20 w100 h20, Alt + (\)
*/

Gui 1:Font, Bold C540000
Gui 1:Add, Text, x600 y080 w100 h20, /госномер <Номер>
Gui 1:Add, Text, xp yp+20 w100 h20, /р+
Gui 1:Add, Text, xp yp+20 w100 h20, /р-
Gui 1:Add, Text, xp yp+20 w100 h20, /м <Сообщение>
Gui 1:Add, Text, xp yp+20 w100 h20, /т<1-3>
Gui 1:Add, Text, xp yp+20 w100 h20, /тс<1-3>
Gui 1:Add, Text, xp yp+20 w100 h20, /двр<1-4>
Gui 1:Add, Text, xp yp+20 w100 h20, /алко<1-3>
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
Gui 1:Add, Text, x710 y080 w170 h20, Пробить номер (КПК)
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
Gui 1:Add, GroupBox, x015 y050 w290 h885, [ КоАП ]
Gui 1:Add, GroupBox, x305 y050 w290 h885, [ ФЗоП ]
Gui 1:Add, GroupBox, x595 y050 w290 h885, [ УПК ]

Gui 1:Font, s12 

Gui 1:Add, Text, x020 y080 w280 r20, Для всех статей КоАП предусмотрена команда вида /коапX.Y, где X.Y - номер статьи`n`nВыдает только расшифровку статьи.

Gui 1:Add, Text, x310 y080 w280 r20, Для ФЗоП команд на данный момент не предусмотрено.

Gui 1:Add, Text, x600 y080 w280 r20, Для УПК команд на данный момент не предусмотрено.


; Gui 1:Tab, 3

; Gui 1:Tab, 4



Global ChooseCity
Global EditLicense
Global EditSurname
Global EditName
Global EditSecondName
Global EditNickname
Global ChooseRank
Global EditPost


Gui 1:Show, h1000 w900, ГИБДД #5 | AHK Province
Return

ButtonEdit:
; MsgBox, 16, Ошибка, Функция недоступна, находится в разработке.
if(HotkeysEnabled)
{
    /*
    ;SetHotkeys()
    for Label, Value in HotkeyHWNDs
    {
        GuiControlGet CurrentHotkey,, % Value
        ; MsgBox %Label% %Value% %CurrentHotkey%
        
        GuiControl 1:Disable, % Value
        HotkeyValue := HotkeyValues[Label]
        if(HotkeyValue<>"") 
            if(CurrentHotkey==HotkeyValue)
                Hotkey %HotkeyValue%, On
            else
            {
                Hotkey %CurrentHotkey%, %Label%
                Hotkey %CurrentHotkey%, %Label%, On
            }
        HotkeyValues[Label] := CurrentHotkey
    }
    WriteHotkeys()
    RefreshHotkeys()
    SetHotkeys()
    */
    
    for KeyName in Hotkey_Arr("AllHotkeys")
	{
		if Reset
			Hotkey % Hotkey_Value(KeyName), Off, UseErrorLevel
		else
			Hotkey % Hotkey_Write(KeyName), %KeyName%, UseErrorLevel On
        Hotkey_Disable(KeyName)
	}
    HotkeysEnabled := False
    GuiControl 1:Text, ButtonEditText, Изменить
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
    GuiControl 1:Text, ButtonEditText, Сохранить
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
Gui 2:Font, s18 CDefault, Trebuchet MS

; -------------------------------------------------- Title --------------------------------------------------

Gui 2:Add, Text, x000 y000 w500 h40 +Center, Изменение личных данных

; -------------------------------------------------- Fields -------------------------------------------------
Gui 2:Font, s14
Gui 2:Add, DropDownList, x015 y040 w200 r3 vChooseCity, %Cities%
Gui 2:Add, Edit, xp y080 w200 r1 vEditSurname, %Surname%
Gui 2:Add, Edit, xp yp+40 w200 r1 vEditName, %Name%
Gui 2:Add, Edit, xp yp+40 w200 r1 vEditSecondName, %SecondName%
Gui 2:Add, Edit, xp yp+40 w200 r1 vEditLicense, %License%
Gui 2:Add, ComboBox, xp yp+40 w200 r11 vChooseRank, %Ranks%
Gui 2:Add, Edit, xp yp+40 w200 r1 vEditPost, %Post%
Gui 2:Add, Edit, xp yp+40 w200 r1 vEditSignature, %Signature%
Gui 2:Add, Radio, xp yp+40 h15 Group %CheckedMale% vRadioMale, Мужской
Gui 2:Add, Radio, xp yp+40 h15 %CheckedFemale% vRadioFemale, Женский
Gui 2:Add, CheckBox, xp+200 yp-20 h15 %CheckedMB% vCheckMB, Мотобатальон

GuiControl 2:ChooseString, ChooseCity, %City%
GuiControl 2:Text, ChooseRank, %Rank%

Gui 2:Font, s12 C540000 Italic
Gui 2:Add, Text, x220 y045 w300 r03, Город трудоустройства
Gui 2:Add, Text, x220 yp+40 w300 r01, Фамилия | *Иванов*
Gui 2:Add, Text, x220 yp+40 w300 r01, Имя | *Иван*
Gui 2:Add, Text, x220 yp+40 w300 r01, Отчество | *Иванович*
Gui 2:Add, Text, x220 yp+40 w300 r01, Удостоверение | *77-123456*
Gui 2:Add, Text, x220 yp+40 w300 r01, Звание | *Старшина*
Gui 2:Add, Text, x220 yp+40 w300 r01, Должность | *Инспектор ДПС*
Gui 2:Add, Text, x220 yp+40 w300 r01, Подпись | *ИвановИИ*

Gui 2:Font, s16 C000000 Norm Bold
Gui 2:Add, Button, x035 y430 w120 h50 gButtonReset, Сбросить
Gui 2:Add, Button, x190 y430 w120 h50 gButtonSave Default, Сохранить
Gui 2:Add, Button, x345 y430 w120 h50 gButtonCancel, Отменить


; -------------------------------------------------- Footer -------------------------------------------------
Gui 2:Font, s10 c545454
Gui 2:Add, Text, x002 y485 w100 h15, v%GuiVersion%
Gui 2:Add, Text, x198 y485 w300 h15 Right, %TextFooter%

Gui 2:Show, h500 w500, ГИБДД #5 | AHK Province
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
Gui 3:Font, s18 CDefault, Trebuchet MS

; -------------------------------------------------- Title --------------------------------------------------

Gui 3:Add, Text, x000 y000 w500 h40 +Center, Полезные ссылки

; -------------------------------------------------- Fields -------------------------------------------------

Gui 3:Font, s14
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

Gui 3:Font, s12 C540000 Italic
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
Gui 3:Add, Text, x198 y445 w300 h15 Right, %TextFooter%

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

EncodeHotkey(Target)
{
 
    ;Target := StrReplace(Target, "^", "`^")
    
	
	Return Target
}

EncodeDelete(Target)
{
    Target := StrReplace(Target, "#", "")
    Target := StrReplace(Target, "!", "")
    Target := StrReplace(Target, "^", "")
    Target := StrReplace(Target, "+", "")
    Target := StrReplace(Target, "&", "")
    Target := StrReplace(Target, "``", "")
    Target := StrReplace(Target, ",", "")
    Target := StrReplace(Target, ".", "")
    Target := StrReplace(Target, ";", "")
    Target := StrReplace(Target, "'", "")
    Target := StrReplace(Target, "/", "")
    Target := StrReplace(Target, "\", "")
    Target := StrReplace(Target, "[", "")
    Target := StrReplace(Target, "]", "")
    Target := StrReplace(Target, "-", "")
    Target := StrReplace(Target, "=", "")
    
	
	Return Target
}

SendChat(TextBind, SleepBind)
{
    TextBind := Encoded(TextBind)
    Clipboard :=
    SendInput {F8}%TextBind%{Enter}{F8}
    Sleep %SleepBind%
} 

GetInput(Target, GUIText, ConsoleText)
{
    if(InputType){
        InputBox %Target%, TechnoAHK:Input, % GUIText
        if ErrorLevel
            Return
        else if %Target% =
            Return
    } else {
        SendInput {F8}%ConsoleText%{Space}
        Input %Target%, V, {Enter} 
        SendInput {F8}
    }
}

GetTryRes()
{
    if(InputType){
        MsgBox, 36, Результат, Удачно?
        IfMsgBox, Yes
            Return True
        IfMsgBox, No
            Return False
    } else {
        SendInput {F8}Удачно? введите "да" или "нет" (в любой раскладке):{Space}
        Input TryRes, V, {Enter} 
        SendInput {F8}
        if(TryRes=="да")||(TryRes=="lf")
            Return True
        if(TryRes=="нет")||(TryRes=="ytn")
            Return False
        else
            Return False
    }
}

GetArgsForHotstring(Hotstring, Target)
{
    SendInput /%Hotstring%{Space}
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
    
    ;if(not CheckData())
    ;    ShowGetDataGui()
}

; CheckAdmin()

ParamCheck()


/*
{  ; Hotkeys
    Hotkey ^vkC0, Knock
    Hotkey !1, CivilianGreeting
    Hotkey ^1, LicenseOpen
    Hotkey ^vk51, LicenseClose
    Hotkey ^2, TakeDocuments
    Hotkey ^3, PDAOn
    Hotkey !vkC0, PDAOff
    Hotkey ^4, Skan
    Hotkey ^5, Protocol
    Hotkey ^6, GiveProtocolForSignature
    Hotkey ^vk59, GiveProtocolCopyReject
    Hotkey !vk59, GiveProtocolCuffed
    Hotkey ^7, GiveProtocolCopy
    Hotkey ^8, Tsu
    Hotkey ^9, ReturnDocuments
    Hotkey !8, Takecarlic
    Hotkey ^vkBD, RadioOn
    Hotkey ^vkBB, RadioOff
    Hotkey ^vkDB, MegafonOn
    Hotkey ^vkDD, MegafonOff
    
    Hotkey ^Numpad1, WalkWarn
    Hotkey ^Numpad2, SkipWarn
    Hotkey ^Numpad3, Wanted
    Hotkey ^Numpad4, FirstColumn
    Hotkey ^Numpad5, SecondColumn
    Hotkey ^Numpad6, ThirdColumn
    Hotkey ^Numpad7, FirstWarn
    Hotkey ^Numpad8, SecondWarn
    Hotkey ^Numpad9, ThirdWarn
    Hotkey ^NumpadMult, ColleagueGreeting

    Hotkey !Numpad7, BreakGlass
    Hotkey !Numpad8, OpenDoor
    Hotkey !Numpad9, PullCivilian
    
    Hotkey !2, Cuff
    Hotkey !3, Uncuff
    Hotkey !4, Arr
    Hotkey !5, Dearr
    Hotkey !6, Putpl
    Hotkey !7, Eject

    Hotkey ^vkBC, BatonOn
    Hotkey ^vkBE, BatonOff
    Hotkey !vkBC, TaserOn
    Hotkey !vkBE, TaserOff
    
    Hotkey ^vkBA, PistolOn
    Hotkey ^vkDE, PistolOff
    Hotkey !vkBA, RifleOn
    Hotkey !vkDE, RifleOff
    
    Hotkey ^vkBF, ShotgunOn
    Hotkey ^vkDC, ShotgunOff
    Hotkey !vkBF, StickOn
    Hotkey !vkDC, StickOff
    
}
*/
Return

{ ; Hotstrings - строки автозамены
    {
    
        #include NPD\KoAP.ahk
    
        :?:/госномер::
        GetArgsForHotstring("госномер", "GovNumber")
        SendInput {Enter}
        Gosub Findcar
        Return
        
        :?:/р+::
        SendInput {Enter}
        Gosub RadioEnable
        Return
        
        :?:/р-::
        SendInput {Enter}
        Gosub RadioDisable
        Return
        
        :?:/м::
        GetArgsForHotstring("м", "Message")
        SendInput {Enter}
        Gosub Megafon
        Return
        
        :?:/т1::
        SendInput {Enter}
        Gosub TaumetrOn
        Return
        
        :?:/т2::
        SendInput {Enter}
        Gosub Taumetr
        Return
        
        :?:/т3::
        SendInput {Enter}
        Gosub TaumetrOff
        Return
        
        :?:/тс1::
        SendInput {Enter}
        Gosub TaumetrSertOn
        Return
        
        :?:/тс2::
        SendInput {Enter}
        Gosub TaumetrSert
        Return
        
        :?:/тс3::
        SendInput {Enter}
        Gosub TaumetrSertOff
        Return
        
        :?:/двр1::
        SendInput {Enter}
        Gosub DVRGet
        Return
        
        :?:/двр2::
        SendInput {Enter}
        Gosub DVROn
        Return
    
        :?:/двр3::
        SendInput {Enter}
        Gosub DVROff
        Return
        
        :?:/двр4::
        SendInput {Enter}
        Gosub DVRSet
        Return
        
        :?:/нк::
        SendInput {Enter}
        SendChat("", "0")
        Return
        
        :?:/алко1::
        SendInput {Enter}
        Gosub AlcoOn
        Return
        
        :?:/алко2::
        SendInput {Enter}
        Gosub AlcoOff
        Return
        
        :?:/дтпфото::
        SendInput {Enter}
        Gosub DTPPhotoFix
        Return
        
        :?:/дтпторм::
        SendInput {Enter}
        Gosub DTPBrakeDist
        Return
    
        :?:/дтппротокол::
        SendInput {Enter}
        Gosub DTPProtocol
        Return
        
        :?:/камеры::
        SendInput {Enter}
        Gosub StreetCameras
        Return
        
        :?:/файнс::
        SendInput {Enter}
        Gosub Fines
        Return
        
        :?:/удо+::
        GetArgsForHotstring("удо{+}", "ID")
        SendInput {Enter}
        Gosub LicenseOpenCom
        Return
    
        :?:/удо-::
        SendInput {Enter}
        Gosub LicenseClose
        Return
        
        :?:/кпк+::
        SendInput {Enter}
        Gosub PDAOn
        Return
    
        :?:/кпк-::
        SendInput {Enter}
        Gosub PDAOff
        Return
        
        :?:/доки::
        SendInput {Enter}
        Gosub AskDocuments
        Return
        
        :?:/доки+::
        SendInput {Enter}
        Gosub TakeDocuments
        Return
    
        :?:/доки-::
        SendInput {Enter}
        Gosub ReturnDocuments
        Return
    
        :?:/скан::
        GetArgsForHotstring("скан", "ID")
        SendInput {Enter}
        Gosub SkanCom
        Return
        
        :?:/кримрек::
        GetArgsForHotstring("скан", "ID")
        SendInput {Enter}
        Gosub CrimrecCom
        Return
    
        :?:/протокол::
        SendInput {Enter}
        Gosub Protocol
        Return
    
        :?:/подпись::
        SendInput {Enter}
        Gosub GiveProtocolForSignature
        Return
    
        :?:/несогл::
        SendInput {Enter}
        Gosub GiveProtocolCopyReject
        Return
    
        :?:/копиянаруч::
        SendInput {Enter}
        Gosub GiveProtocolCuffed
        Return
    
        :?:/копия::
        SendInput {Enter}
        Gosub GiveProtocolCopy
        Return
        
        :?:/копияназад::
        SendInput {Enter}
        Gosub CopyReject
        Return
    
        :?:/штраф::
        GetArgsForHotstring("штраф", "ID")
        SendInput {Enter}
        Gosub TsuCom
        Return
    
        :?:/лишправ::
        GetArgsForHotstring("лишправ", "ID")
        SendInput {Enter}
        Gosub TakecarlicCom
        Return
    
        :?:/конвой::
        GetArgsForHotstring("конвой", "ID")
        SendInput {Enter}
        Gosub ArrCom
        Return
    
        :?:/конвой-::
        GetArgsForHotstring("конвой-", "ID")
        SendInput {Enter}
        Gosub Dearr
        Return
    
        :?:/впа::
        GetArgsForHotstring("впа", "ID")
        SendInput {Enter}
        Gosub PutplCom
        Return
    
        :?:/изпа::
        GetArgsForHotstring("изпа", "ID")
        SendInput {Enter}
        Gosub EjectCom
        Return
    
        :?:/рейд+::
        SendInput {Enter}
        Gosub RaidOrderOn
        Return
    
        :?:/рейд-::
        SendInput {Enter}
        Gosub RaidOrderOff
        Return
        }
        
  ; Текстовые бинды с метками
    Knock:
    SendChat("me постуча" lla " в окно", "500")
    SendChat("do Стук.", "0")
    Return
    
    ColleagueGreeting:
    SendChat("animarmy 3", "500")
    SendChat("say Здравия желаю!", "0")
    Return
    
    CivilianGreeting:
    SendChat("animarmy 3", "500")
    SendChat("say Здравия желаю, " Post ", " Rank " " Surname ". ", "500")
    
    PoliceBadge:
    SendChat("do На груди закреплен полицейский знак с личным номером: " License ".", "500")
    
    Pogon:
    SendChat(RanksArr[Rank], "500")
    Return
    
    LicenseOpen:
    GetInput("ID", "Показать удостоверение.`nВведите ID гражданина:", "Показать удостоверение. Введите ID гражданина:")
    LicenseOpenCom:
    SendChat("do Удостоверение лежит в нагрудном кармане.", "500")
    SendChat("me доста" lla " удостоверение из нагрудного кармана и разверну" lla " его", "500")
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
    SendChat("say Уважаемый, держите ваши документы. Удачи на дорогах, соблюдайте ПДД.", "0")
    Return
    
    Cuff:
    GetInput("ID", "Надеть наручники.`nВведите ID подозреваемого:", "Надеть наручники. Введите ID подозреваемого:")
    SendChat("say Гражданин, Вы имеете право хранить молчание!", "5")
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
    SendChat("do Задержанный стоит на улице.", "5000")
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
        SendChat("do Переговорное устройствозакреплено на руле.", "5")
        SendChat("me активирова" lla " переговорное устройство", "5")
    } else {
        SendChat("do Тангета СГУ ""Топаз"" закреплена на торпеде.", "5")
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
    SendChat("m Водитель, примите крайнее правое положение и остановитесь!", "5")
    Gosub MegafonOff
    Return
    
    SecondWarn:
    Gosub MegafonOn
    SendChat("m Повторяю, водитель, прижмитесь вправо и остановитесь!", "5")
    Gosub MegafonOff
    Return
    
    ThirdWarn:
    Gosub MegafonOn
    SendChat("m Останавливайтесь! В случае отказа откроем огонь!", "5")
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
    SendChat("do КПК в кармане.", "500")
    SendChat("me доста" lla " КПК из кармана и запусти" lla " его", "500")
    Return
    
    PDAOff:
    SendChat("me выключи" lla " КПК и убра" lla " в карман", "500")
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
    
    BatonOn:
    SendChat("do Дубинка закреплена на поясе.", "5")
    SendChat("me сня" lla " дубинку с пояса правой рукой", "0")
    Return
    
    BatonOff:
    SendChat("me закрепи" lla " дубинку на пояс", "0")
    Return
    
    StickOn:
    SendChat("do Жезл закреплен на поясе.", "5")
    SendChat("me сня" lla " жезл с пояса правой рукой", "0")
    Return
    
    StickOff:
    SendChat("me закрепи" lla " жезл на пояс", "0")
    Return
    
    TaserOn:
    SendChat("do Электрошокер в кобуре.", "5")
    SendChat("me доста" lla " электрошокер из кобуры и приготови" lla " к использованию", "0")
    Return
    
    TaserOff:
    SendChat("me убра" lla " электрошокер в кобуру", "0")
    Return
    
    PistolOn:
    SendChat("do Пистолет МР-443 Грач на предохранителе в кобуре.", "5")
    SendChat("me доста" lla " МР-443 из кобуры и сня" lla " его с предохранителя", "0")
    Return
    
    PistolOff:
    SendChat("me постави" lla " МР-443 на предохранитель и убра" lla " его в кобуру", "0")
    Return
    
    RifleOn:
    SendChat("do АК-74м висит на плече.", "5")
    SendChat("me скину" lla " АК-74м c плеча и передерну" lla " затвор", "0")
    Return
    
    RifleOff:
    SendChat("me постави" lla " АК-74м на предохранитель и повеси" lla " на плечо", "0")
    Return
    
    ShotgunOn:
    SendChat("do На плече висит МР-133, заряженный резиновыми пулями.", "5")
    SendChat("me сня" lla " МР-133 с плеча и приготови" lla " дробовик к стрельбе", "0")
    Return
    
    ShotgunOff:
    SendChat("me постави" lla " МР-133 на предохранитель и повеси" lla " дробовик на плечо", "0")
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
    SendChat("do На поясе у инспектора висит сумка с бланками.", "5000")
    SendChat("me доста" lla " бланк осмотра места ДТП, зарисова" lla " схему ДТП", "5000")
    SendChat("me сдела" lla " на схеме пометки со слов граждан", "5000")
    SendChat("me нанес" la " на схему значения, измеренные рулеткой, положи" lla " бланк в сумку", "5000")
    SendChat("me закончи" lla " заполнять схему ДТП, затем убра" lla " схему в сумку", "0")
    Return
    
    StreetCameras:
    SendChat("me откры" lla " базу данных камер видеонаблюдения и запроси" lla " запись с нужной камеры", "500")
    SendChat("me отмота" lla " запись на нужный момент и включи" lla " воспроизведение", "500")
    SendChat("do Запись с камеры воспроизводится на экране КПК.", "0")
    Return
    
    AlcoQuestion:
    SendChat("do Человек напротив пьян?", "0")
    Return
    
    AlcoOn:
    SendChat("do Алкотестер в кармане.", "500")
    SendChat("me доста" lla " алкотестер из кармана и включил его", "500")
    SendChat("me протяну" lla " алкотестер ко рту гражданина напротив ", "500")
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
    SendChat("do Свидетельство о поверке: устройство для измерения светопропускаемости тонировки ""Тоник"", действительно до 31.12.2022.", "0")
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
    SendChat("me достал приказ, развернул его и показал гражданину напротив", "500")
    SendChat("do Приказ №098: гербовая печать, подпись начальника ГУОБДД МВД РП [от " A_DD "." A_MM "." A_YYYY "]", "0")
    Return
    
    RaidOrderOff:
    SendChat("me сложил приказ и убрал в нагрудный карман", "500")
    SendChat("do В нагрудном кармане лежит приказ о рейде.", "0")
    Return

}   