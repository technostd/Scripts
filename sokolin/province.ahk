; <COMPILER: v1.1.37.01>

#NoEnv
#SingleInstance, Off
Loop %0% {
    ComParam%A_Index% := %A_Index%
}
If (A_IsAdmin == False) {
    MsgBox, 20, Ошибка, Для корректной работы скрипта необходим запуск от имени администратора.`n`nПерезапустить от имени администратора?
    IfMsgBox, Yes
    {
        Run, *RunAs "%A_ScriptFullPath%" ,, UseErrorLevel
        ExitApp
    }
    IfMsgBox, No
    {
        ExitApp
    }
}

FileCreateDir, %A_ScriptDir%\img
IfNotExist, % loader := A_ScriptDir "\img\loader.png"
{
    UrlDownloadToFile, https://sookolin.github.io/ahk-province/loader.png, % loader
}
DriveGet, driveNumber, Serial, C:\
global driveNumber
RegRead, vkID, HKEY_LOCAL_MACHINE, SOFTWARE\AutoHotkey\AHK Province\, vkID
global vkID
Menu, Tray, NoStandard
Menu, Tray, Add, VKowner
Menu, Tray, Rename, VKowner, AHK Province
Menu, Tray, Add
Menu, Tray, Add, ReloadMenu
Menu, Tray, Rename, ReloadMenu, Перезапустить
Menu, Tray, Add, ExitMenu
Menu, Tray, Rename, ExitMenu, Закрыть
files_img := ["close.png", "open.png", "ico_settings.png", "joy.png", "line.png", "logo_province.png", "rollup.png"]
files_render := ["interface.html", "style.profile.css"]
files_sounds := ["click.mp3", "background.wav", "radio.mp3"]
files_source := ["binds.ahk", "neutron.ahk"]
version := 12
devDriveNumber := "441614222"
global devDriveNumber
devIdVk := "376501969"
global devIdVk
branchKey := "Lisoooy-branch"
global branchKey
RegRead, testKey, HKEY_LOCAL_MACHINE, SOFTWARE\AutoHotkey\AHK Province\, testKey
global testKey
RegRead, pathGame, HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Province, game-path
pathGame := RegExReplace(pathGame, "\/", "\")
global pathGame
If (ComParam1=="/Update") {
    Update(ComParam2, ComParam3)
}
Else If (ComParam1=="/TempDelete") {
    TempDelete(ComParam2, ComParam3)
}
Else {
    CheckUpdate(Version)
}
Return
CheckUpdate(Version) {
    FileDelete, %A_ScriptDir%\update.exe
    Http := ComObjCreate("WinHttp.WinHttpRequest.5.1")
    Http.Open("GET", "https://github.com/sookolin/ahk-province/raw/main/version.md")
    Http.Send()
    New := Http.ResponseText
    If (testKey == branchKey) {
        Gosub, UpdateTest
    }
    If (New <= Version) {
        Gosub, NoUpdate
        Return
    }
    If (VKid == devIdVk) {
        Gosub, NoUpdate
        Return
    }
    UpdateTest:
    URLDownloadToFile, https://sookolin.github.io/ahk-province/ahkprovince.exe, %A_ScriptDir%\update.exe
    PID := DllCall("GetCurrentProcessId")
    Run %A_ScriptDir%\update.exe "/Update" "%PID%" "%A_ScriptFullPath%"
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
    files_render := ["interface.html", "style.profile.css"]
    For index, file_name in files_render
    {
        FileDelete, %A_ScriptDir%\%file_name%
        Sleep, 500
        UrlDownloadToFile, https://sookolin.github.io/ahk-province/%file_name%, %A_ScriptDir%\%file_name%
    }
    FileCopy, %A_ScriptFullPath%, %Path%, 1
    If ErrorLevel
    {
        MsgBox, % 16, Ошибка, Не удалось копирование, возможно были запущены несколько экземпляров программы.`nКод ошибки: 2.
        ExitApp
    }
    PID := DllCall("GetCurrentProcessId")
    Run %Path% "/TempDelete" "%PID%" "%A_ScriptFullPath%"
    ExitApp
}
TempDelete(PID, Path) {
    Process, Close, %PID%
    Process, WaitClose, %PID%, 2
    FileDelete, %Path%
    Gosub, NoUpdate
    Return
}
NoUpdate:
Gui, loader:Add, Picture, x0 y0 h281 w500, % loader
Gui, loader:-Caption
Gui, loader:Show, Center h281 w500
FileCreateDir, %A_ScriptDir%\sounds
FileCreateDir, %A_ScriptDir%\source
FileCreateShortcut, %A_ScriptFullPath%, %A_Desktop%\AHK Province.lnk,,, AHK Province — самый лучший скрипт для взаимодейтсвия с Провинцией`, не правла ли?
For index, file_name in files_img
{
    IfNotExist, %A_ScriptDir%\img\%file_name%
    {
        UrlDownloadToFile, https://sookolin.github.io/ahk-province/%file_name%, %A_ScriptDir%\img\%file_name%
    }
}
For index, file_name in files_sounds
{
    IfNotExist, %A_ScriptDir%\sounds\%file_name%
    {
        UrlDownloadToFile, https://sookolin.github.io/ahk-province/%file_name%, %A_ScriptDir%\sounds\%file_name%
    }
}
For index, file_name in files_render
{
    IfNotExist, %A_ScriptDir%\%file_name%
    {
        UrlDownloadToFile, https://sookolin.github.io/ahk-province/%file_name%, %A_ScriptDir%\%file_name%
    }
}
UrlDownloadToFile, https://voicebot.su/uploads/sounds/03/02945/2945.mp3, %A_Temp%\wot.mp3
RegWrite, REG_DWORD, HKEY_CURRENT_USER, SOFTWARE\Microsoft\Internet Explorer\Zoom, ZoomDisabled, 1
If (vkID == "ERROR") {
    vkID := ""
}
global fileLog := pathGame "\MTA\MTA\logs\console.log"
FileInstall, interface.html, %A_ScriptDir%\interface.html
FileInstall, style.profile.css, %A_ScriptDir%\style.profile.css
FileInstall, sounds\click.mp3, %A_ScriptDir%\sounds\click.mp3
FileInstall, img\rollup.png, %A_ScriptDir%\img\rollup.png
FileInstall, img\close.png, %A_ScriptDir%\img\close.png
FileInstall, img\logo_province.png, %A_ScriptDir%\img\logo_province.png
FileInstall, img\joy.png, %A_ScriptDir%\img\joy.png
FileInstall, img\ico_settings.png, %A_ScriptDir%\img\ico_settings.png
FileInstall, img\line.png, %A_ScriptDir%\img\line.png
FileInstall, img\open.png, %A_ScriptDir%\img\open.png
title = AHK Province
neutron := new NeutronWindow()
neutron.Load("interface.html")
pathGameInput := neutron.doc.querySelectorAll("#pathGame")
pathGameInput[0].value := pathGame
vkLinkInput := neutron.doc.querySelectorAll("#vkLink")
If (vkID == "") {
    vkLinkInput[0].value := ""
}
Else {
    vkLinkInput[0].value := "https://vk.com/id"vkID
    get_data := GetData("https://vk.com/id"vkID)
    nickName := get_data.nickName
    global nickName
    fullName := get_data.fullName
    global fullName
    RegExMatch(fullName, "(.*) (.*) (.*)", fullName)
    global fullName1
    global fullName2
    global fullName3
    rankName := get_data.rankName
    rankMO := ["Рядовой", "Ефрейтор", "Младший сержант", "Прапорщик", "Лейтенант", "Старший лейтенант", "Капитан", "Майор", "Полковник", "Генерал", "Маршал"]
    rankMZ := ["Интерн", "Фельдшер", "Лаборант", "Врач-стажер", "Врач-участковый", "Врач-терапевт", "Врач-хирург", "Заведующий отделением", "Заместитель главного врача", "Главный врач"]
    global rankMO
    global rankMZ
    fracName := get_data.fracName
    If ((fracName == "11") or (VKid == devIdVk)) {
    neutron.qs("#mo").innerHTML := neutron.FormatHTML("<div onclick=""pageShow(event, 'moPanel')"" class=""item default""><div class=""name"">{}</div></div>", "МО")
    }
    If ((fracName == "4") or (VKid == devIdVk)) {
    neutron.qs("#mz").innerHTML := neutron.FormatHTML("<div onclick=""pageShow(event, 'mzPanel')"" class=""item default""><div class=""name"">{}</div></div>", "МЗ")
    }
    If ((testKey == branchKey) or (VKid == devIdVk)) {
    neutron.qs("#resource").innerHTML := neutron.FormatHTML("<div class=""item line""><img class=""ico"" alt="" src=""img\line.png"" style=""width: 100%; height: 1px;""></div><div class=""item default"" onclick=""pageShow(event, 'timecycPanel')""><div class=""name"">{}</div></div><div class=""item default"" onclick=""pageShow(event, 'resourcePanel')""><div class=""name"">{}</div></div><div class=""item default"" onclick=""pageShow(event, 'resourcePanel')""><div class=""name"">{}</div></div>", "Таймциклы", "Эффекты", "Звуки")
    }
    global rankID := rankName
    If (fracName == "11") {
        fracName := "МО"
        rankName := rankMO[rankName]
    }
    Else If ((fracName == "1") or (fracName == "4") or (fracName == "7")) {
        If (fracName == "1") {
            divisionNameShort := "ЦГБ-П"
            divisionNameLong := "ЦГБ г. Приволжск"
        }
        Else If (fracName == "4") {
            divisionNameShort := "ОКБ-М"
            divisionNameLong := "ОКБ г. Мирный"
        }
        Else If (fracName == "7") {
            divisionNameShort := "ЦГБ-Н"
            divisionNameLong := "ЦГБ г. Невский"
        }
        fracName := "МЗ"
        rankName := rankMZ[rankName]
    }
    Else {
        fracName := ""
    }
    global fracName
    global rankName
    postName := get_data.postName
    deptName := get_data.deptName
    passID := get_data.passID
    cardID := get_data.cardID
    signName := get_data.signName
    If (signName == "отсутствует") {
        signName := ""
    }
    dataText := "<table><tbody>"
    dataText := dataText "<tr><td>Ник:</td><td>" nickName "</td></tr>"
    dataText := dataText "<tr><td>ФИО:</td><td>" fullName "</td></tr>"
    dataText := dataText "<tr><td>Фракция:</td><td>" fracName "</td></tr>"
    dataText := dataText "<tr><td>Должность/звание:</td><td>" rankName ",<br>" postName "</td></tr>"
    dataText := dataText "<tr><td>Отдел/взвод:</td><td>" deptName "</td></tr>"
    dataText := dataText "<tr><td>Удостоверение:</td><td>" passID "</td></tr>"
    dataText := dataText "<tr><td>Тен-код:</td><td>" cardID "</td></tr>"
    dataText := dataText "<tr><td>Позывной:</td><td>" signName "</td></tr>"
    dataText := dataText "</tbody></table>"
    If ((fracName != "МО") or (fracName != "МЗ")) {
        dataText := "Данные не найдены, вы не фракционник или фракция<br>еще не прописана!"
    }
    neutron.qs("#dataText").innerHTML := neutron.FormatHTML(dataText, "")
}
If (testKey == branchKey) {
    testKeyInput := neutron.doc.querySelectorAll("#testKey")
    testKeyInput[0].value := testKey
}
FileDelete, %A_ScriptDir%\source\binds.ahk
If (fracName == "МО") {
    UrlDownloadToFile, https://sookolin.github.io/ahk-province/mo.ahk, %A_ScriptDir%\source\binds.ahk
}
Else If (fracName == "МЗ") {
    UrlDownloadToFile, https://sookolin.github.io/ahk-province/mz.ahk, %A_ScriptDir%\source\binds.ahk
}
IfNotExist, %A_ScriptDir%\source\neutron.ahk
{
    UrlDownloadToFile, https://sookolin.github.io/ahk-province/neutron.ahk, %A_ScriptDir%\source\neutron.ahk
    Reload
}
class NeutronWindow
{
    static TEMPLATE := "
    ( ; html
    <!DOCTYPE html><html>
    <head>
    
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <style>
    	html, body {
        		width: 100%; height: 100%;
        		margin: 0; padding: 0;
        		font-family: sans-serif;
    	}
    
    	body {
        		display: flex;
        		flex-direction: column;
    	}
    
    	header {
        		width: 100%;
        		display: flex;
        		background: silver;
        		font-family: Segoe UI;
        		font-size: 9pt;
    	}
    
    	.title-bar {
        		padding: 0.35em 0.5em;
        		flex-grow: 1;
    	}
    
    	.title-btn {
        		padding: 0.35em 1.0em;
        		cursor: pointer;
        		vertical-align: bottom;
        		font-family: Webdings;
        		font-size: 11pt;
    	}
    
    	.title-btn:hover {
        		background: rgba(0, 0, 0, .2);
    	}
    
    	.title-btn-close:hover {
        		background: #dc3545;
    	}
    
    	.main {
        		flex-grow: 1;
        		padding: 0.5em;
        		overflow: auto;
    	}
    </style>
<style>{}</style>
    
    </head>
    <body>
    
    <header>
	<span class='title-bar' onmousedown='neutron.DragTitleBar()'>{}</span>
    	<span class='title-btn' onclick='neutron.Minimize()'>0</span>
    	<span class='title-btn' onclick='neutron.Maximize()'>1</span>
    	<span class='title-btn title-btn-close' onclick='neutron.Close()'>r</span>
    </header>
    
<div class='main'>{}</div>
    
<script>{}</script>
    
    </body>
    </html>
    )"
    static VERSION := "1.0.0"
    , WM_DESTROY := 0x02
    , WM_SIZE := 0x05
    , WM_NCCALCSIZE := 0x83
    , WM_NCHITTEST := 0x84
    , WM_NCLBUTTONDOWN := 0xA1
    , WM_KEYDOWN := 0x100
    , WM_MOUSEMOVE := 0x200
    , WM_LBUTTONDOWN := 0x201
    , HT_VALUES := [[13, 12, 14], [10, 1, 11], [16, 15, 17]]
    , KEY_FBE := "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\MAIN"
    . "\FeatureControl\FEATURE_BROWSER_EMULATION"
    , ACCENT_ENABLE_BLURBEHIND := 3
    , WCA_ACCENT_POLICY := 19
    , EXE_NAME := A_IsCompiled ? A_ScriptName : StrSplit(A_AhkPath, "\").Pop()
    border_size := 6
    w := 800
    h := 600
    doc[]
    {
        get
        {
            return this.wb.Document
        }
    }
    wnd[]
    {
        get
        {
            return this.wb.Document.parentWindow
        }
    }
    __New(html:="", css:="", js:="", title:="Neutron")
    {
        static wb
        this.LISTENERS := [this.WM_DESTROY, this.WM_SIZE, this.WM_NCCALCSIZE
        , this.WM_KEYDOWN, this.WM_LBUTTONDOWN]
    this.bound := {}
        this.bound._OnMessage := this._OnMessage.Bind(this)
        for i, message in this.LISTENERS
        OnMessage(message, this.bound._OnMessage)
        Gui, New, +hWndhWnd -Resize -DPIScale
        this.hWnd := hWnd
        VarSetCapacity(margins, 16, 0)
        NumPut(1, &margins, 0, "Int")
        DllCall("Dwmapi\DwmExtendFrameIntoClientArea"
        , "UPtr", hWnd
        , "UPtr", &margins)
        Gui, Color, 0, 0
        VarSetCapacity(wcad, A_PtrSize+A_PtrSize+4, 0)
        NumPut(this.WCA_ACCENT_POLICY, &wcad, 0, "Int")
        VarSetCapacity(accent, 16, 0)
        NumPut(this.ACCENT_ENABLE_BLURBEHIND, &accent, 0, "Int")
        NumPut(&accent, &wcad, A_PtrSize, "Ptr")
        NumPut(16, &wcad, A_PtrSize+A_PtrSize, "Int")
        DllCall("SetWindowCompositionAttribute", "UPtr", hWnd, "UPtr", &wcad)
        RegRead, fbe, % this.KEY_FBE, % this.EXE_NAME
        RegWrite, REG_DWORD, % this.KEY_FBE, % this.EXE_NAME, 0
        Gui, Add, ActiveX, vwb hWndhWB x0 y0 w800 h600, about:blank
        if (fbe = "")
        RegDelete, % this.KEY_FBE, % this.EXE_NAME
        else
        RegWrite, REG_DWORD, % this.KEY_FBE, % this.EXE_NAME, % fbe
        this.wb := wb
        this.hWB := hWB
        ComObjConnect(this.wb, new this.WBEvents(this))
        if !(html ~= "i)^<!DOCTYPE")
        html := Format(this.TEMPLATE, css, title, html, js)
        this.doc.write(html)
        this.doc.close()
        this.wnd.neutron := this
        this.wnd.ahk := new this.Dispatch(this)
        while wb.readyState < 4
        Sleep, 50
        dhw := A_DetectHiddenWindows
        DetectHiddenWindows, On
        ControlGet, hWnd, hWnd,, Internet Explorer_Server1, % "ahk_id" this.hWnd
        this.hIES := hWnd
        DetectHiddenWindows, %dhw%
        this.pWndProc := RegisterCallback(this._WindowProc, "", 4, &this)
        this.pWndProcOld := DllCall("SetWindowLong" (A_PtrSize == 8 ? "Ptr" : "")
        , "Ptr", hWnd
        , "Int", -4
        , "Ptr", this.pWndProc
        , "Ptr")
        this.wb.RegisterAsDropTarget := False
        DllCall("ole32\RevokeDragDrop", "UPtr", this.hIES)
    }
    _OnMessage(wParam, lParam, Msg, hWnd)
    {
        if (hWnd == this.hWnd)
        {
            if (Msg == this.WM_NCCALCSIZE)
            {
                if !DllCall("IsZoomed", "UPtr", hWnd)
                return 0
                VarSetCapacity(windowinfo, 60, 0)
                NumPut(60, windowinfo, 0, "UInt")
                DllCall("GetWindowInfo", "UPtr", hWnd, "UPtr", &windowinfo)
                cxWindowBorders := NumGet(windowinfo, 48, "Int")
                cyWindowBorders := NumGet(windowinfo, 52, "Int")
                NumPut(NumGet(lParam+0, "Int") + cxWindowBorders, lParam+0, "Int")
                NumPut(NumGet(lParam+4, "Int") + cyWindowBorders, lParam+4, "Int")
                NumPut(NumGet(lParam+8, "Int") - cxWindowBorders, lParam+8, "Int")
                NumPut(NumGet(lParam+12, "Int") - cyWindowBorders, lParam+12, "Int")
                return 0
            }
            else if (Msg == this.WM_SIZE)
            {
                this.w := w := lParam<<48>>48
                this.h := h := lParam<<32>>48
                DllCall("MoveWindow", "UPtr", this.hWB, "Int", 0, "Int", 0, "Int", w, "Int", h, "UInt", 0)
                return 0
            }
            else if (Msg == this.WM_DESTROY)
            {
                for i, message in this.LISTENERS
                OnMessage(message, this.bound._OnMessage, 0)
                this.bound := []
            }
        }
        else if (hWnd == this.hIES)
        {
            if (Msg == this.WM_KEYDOWN)
            {
                if (Chr(wParam) ~= "[A-Z]" || wParam = 0x74)
                return
                Gui +OwnDialogs
            pipa := ComObjQuery(this.wb, "{00000117-0000-0000-C000-000000000046}")
                VarSetCapacity(kMsg, 48), NumPut(A_GuiY, NumPut(A_GuiX
                , NumPut(A_EventInfo, NumPut(lParam, NumPut(wParam
                , NumPut(Msg, NumPut(hWnd, kMsg)))), "uint"), "int"), "int")
                Loop 2
                r := DllCall(NumGet(NumGet(1*pipa)+5*A_PtrSize), "ptr", pipa, "ptr", &kMsg)
                until wParam != 9 || this.wb.document.activeElement != ""
                ObjRelease(pipa)
                if r = 0
                return 0
                return
            }
        }
    }
    _WindowProc(Msg, wParam, lParam)
    {
        Critical
        hWnd := this
        this := Object(A_EventInfo)
        if (Msg == this.WM_NCHITTEST)
        {
            x := lParam<<48>>48, y := lParam<<32>>48
            WinGetPos, wX, wY, wW, wH, % "ahk_id" this.hWnd
            row := (x < wX + this.BORDER_SIZE) ? 1 : (x >= wX + wW - this.BORDER_SIZE) ? 3 : 2
            col := (y < wY + this.BORDER_SIZE) ? 1 : (y >= wY + wH - this.BORDER_SIZE) ? 3 : 2
            return this.HT_VALUES[col, row]
        }
        else if (Msg == this.WM_NCLBUTTONDOWN)
        {
            return DllCall("SendMessage", "Ptr", this.hWnd, "UInt", Msg, "UPtr", wParam, "Ptr", lParam, "Ptr")
        }
        return DllCall("CallWindowProc"
        , "Ptr", this.pWndProcOld
        , "Ptr", hWnd
        , "UInt", Msg
        , "UPtr", wParam
        , "Ptr", lParam
        , "Ptr")
    }
    DragTitleBar()
    {
        PostMessage, this.WM_NCLBUTTONDOWN, 2, 0,, % "ahk_id" this.hWnd
    }
    Minimize()
    {
        Gui, % this.hWnd ":Minimize"
    }
    Maximize()
    {
        if DllCall("IsZoomed", "UPtr", this.hWnd)
        Gui, % this.hWnd ":Restore"
        else
        Gui, % this.hWnd ":Maximize"
    }
    Close()
    {
        WinClose, % "ahk_id" this.hWnd
    }
    Hide()
    {
        Gui, % this.hWnd ":Hide"
    }
    Destroy()
    {
        Gui, % this.hWnd ":Destroy"
    }
    Show(options:="")
    {
        w := RegExMatch(options, "w\s*\K\d+", match) ? match : this.w
        h := RegExMatch(options, "h\s*\K\d+", match) ? match : this.h
        VarSetCapacity(rect, 16, 0)
        DllCall("AdjustWindowRectEx"
        , "Ptr", &rect
        , "UInt", 0x80CE0000
        , "UInt", 0
        , "UInt", 0
        , "UInt")
        w += NumGet(&rect, 0, "Int")-NumGet(&rect, 8, "Int")
        h += NumGet(&rect, 4, "Int")-NumGet(&rect, 12, "Int")
        Gui, % this.hWnd ":Show", %options% w%w% h%h%
    }
    Load(fileName)
    {
        if A_IsCompiled
        url := "res://" this.wnd.encodeURIComponent(A_ScriptFullPath) "/10/" fileName
        else
        url := A_WorkingDir "/" fileName
        this.wb.Navigate(url)
        while this.wb.readyState < 3
        Sleep, 50
        this.wnd.neutron := this
        this.wnd.ahk := new this.Dispatch(this)
        while this.wb.readyState < 4
        Sleep, 50
    }
    qs(selector)
    {
        return this.doc.querySelector(selector)
    }
    qsa(selector)
    {
        return this.doc.querySelectorAll(selector)
    }
    Gui(subCommand, value1:="", value2:="", value3:="")
    {
        Gui, % this.hWnd ":" subCommand, %value1%, %value2%, %value3%
    }
    Each(htmlCollection)
    {
        return new this.Enumerable(htmlCollection)
    }
    GetFormData(formElement, useIdAsName:=True)
    {
        formData := new this.FormData()
        for i, field in this.Each(formElement.elements)
        {
            name := ""
            try
            name := field.name
            if (name == "" && useIdAsName)
            name := field.id
            if (name == "" || field.disabled
            || field.type ~= "^file|reset|submit|button$")
            continue
            if (field.type == "select-multiple")
            {
                for j, option in this.Each(field.options)
                if (option.selected)
                formData.add(name, option.value)
                continue
            }
            if (field.type ~= "^checkbox|radio$" && !field.checked)
            continue
            formData.add(name, field.value)
        }
        return formData
    }
    EscapeHTML(unsafe)
    {
        unsafe := StrReplace(unsafe, "&", "&amp;")
        unsafe := StrReplace(unsafe, "<", "&lt;")
        unsafe := StrReplace(unsafe, ">", "&gt;")
        unsafe := StrReplace(unsafe, """", "&quot;")
        unsafe := StrReplace(unsafe, "''", "&#039;")
        return unsafe
    }
    FormatHTML(formatStr, values*)
    {
        for i, value in values
        values[i] := this.EscapeHTML(value)
        return Format(formatStr, values*)
    }
    class Dispatch
    {
        __New(parent)
        {
            this.parent := parent
        }
        __Call(params*)
        {
            if !(fn := Func(params[1]))
            throw Exception("Unknown function: " params[1])
            if (params.length() < fn.MinParams)
            throw Exception("Too few parameters given to " fn.Name ": " params.length())
            if (params.length() > fn.MaxParams && !fn.IsVariadic)
            throw Exception("Too many parameters given to " fn.Name ": " params.length())
            params[1] := this.parent
            return fn.Call(params*)
        }
    }
    class WBEvents
    {
        __New(parent)
        {
            this.parent := parent
        }
        DocumentComplete(wb)
        {
            wb.document.parentWindow.neutron := this.parent
            wb.document.parentWindow.ahk := new this.parent.Dispatch(this.parent)
        }
    }
    class Enumerable
    {
        i := 0
        __New(htmlCollection)
        {
            this.collection := htmlCollection
        }
        _NewEnum()
        {
            return this
        }
        Next(ByRef i, ByRef elem)
        {
            if (this.i >= this.collection.length)
            return False
            i := this.i
            elem := this.collection.item(this.i++)
            return True
        }
    }
    class FormData
    {
        names := []
        values := []
        Add(name, value)
        {
            this.names.Push(name)
            this.values.Push(value)
        }
        All(name)
        {
            values := []
            for i, v in this.names
            if (v == name)
            values.Push(this.values[i])
            return values
        }
        __Get(name, n := 1)
        {
            for i, v in this.names
            if (v == name && !--n)
            return this.values[i]
        }
        _NewEnum()
        {
        return {"i": 0, "base": this}
        }
        Next(ByRef name, ByRef value)
        {
            if (++this.i > this.names.length())
            return False
            name := this.names[this.i]
            value := this.values[this.i]
            return True
        }
    }
}
Loop, 5
{
    vk_post := VKpost(A_Index)
    post_text := vk_post.text
    post_date := vk_post.date
    post_photo := vk_post.photo
    post_id := vk_post.id
    If (post_date == "01.01.1970") {
        post_date := ""
    }
    If (post_photo == "") {
        post_photo := "https://i.imgur.com/tLTiBn6.png"
    }
neutron.qs("#photo_" A_Index "").innerHTML := neutron.FormatHTML("<div class=""background"" onclick=""ahk.OpenPost(event, '{}')""><img src=""{}"" style=""width: auto; height: 100%;""><div class=""shadow""> </div></div>", "" post_id "", "" post_photo "")
neutron.qs("#text_" A_Index "").innerHTML := neutron.FormatHTML("<span>{}</span>", "" post_text "")
neutron.qs("#date_" A_Index "").innerHTML := neutron.FormatHTML("<span>{}</span>", "" post_date "")
}
vk_get := VKget(2000000008)
get_alert := vk_get.text
If RegExMatch(get_alert, "i)^!alert (.*)$", get_alert)
{
    alert := neutron.doc.querySelectorAll(".alert-header > div")
    For i, div in neutron.Each(alert)
    {
        div.className := "active"
    neutron.qs("#alert").innerHTML := neutron.FormatHTML("<div>{}</div>", "" get_alert1 "")
    }
}
vk_update := VKget(2000000010)
update_text := vk_update.text
If RegExMatch(update_text, "i)^!update (.*)$", update_text)
{
    RegExMatch(update_text1, "(.*) / (.*) / (.*)#(.*)", update_text)
    versionMsg := update_text1
    If (update_text1 >= version) {
        RegRead, msgUpdate, HKEY_LOCAL_MACHINE, SOFTWARE\AutoHotkey\AHK Province\, msgUpdate
        RegRead, msgUpdateVersion, HKEY_LOCAL_MACHINE, SOFTWARE\AutoHotkey\AHK Province\, msgUpdateVersion
        If (msgUpdateVersion < update_text1) {
            RegWrite, REG_DWORD, HKEY_LOCAL_MACHINE, SOFTWARE\AutoHotkey\AHK Province\, msgUpdate, 0
            RegRead, msgUpdate, HKEY_LOCAL_MACHINE, SOFTWARE\AutoHotkey\AHK Province\, msgUpdate
        }
        If ((msgUpdate == "") || (msgUpdate == 0)) {
            msg := neutron.doc.querySelectorAll(".msg-box > div")
        neutron.qs(".msg.overlay .panel .title").innerHTML := neutron.FormatHTML("<div>ОБНОВЛЕНИЕ {} ОТ {}</div>", "" update_text2 "", "" update_text3 "")
            FileAppend, %update_text4%, %A_ScriptDir%\source\update.txt
            subTitle := ["Добавлено", "Изменено", "Исправлено", "Убрано"]
            Loop {
                num_line := 1
                num_line += %A_index%
                FileReadLine, line, %A_ScriptDir%\source\update.txt, %num_line%
                If ErrorLevel
                {
                    Break
                }
                For index, subTitleReg in subTitle {
                    If line contains % subTitleReg
                    {
                        line_update := "<p><b style=""margin-bottom: 2px;"">" line "</b></p>"
                    }
                }
                If RegExMatch(line, "- (.*)", update_text)
                {
                    line_update := "<p style=""margin-left: 10px;"">" line "</p>"
                }
                If (line == "") {
                    line_update := "<p> <br></p>"
                }
                line_text = %line_text% %line_update%
                line_update := ""
            }
            FileDelete, %A_ScriptDir%\source\update.txt
        neutron.qs(".msg.overlay .panel .desc").innerHTML := neutron.FormatHTML("" line_text "{}", "")
            For i, div in neutron.Each(msg)
            {
                div.className := "active"
            }
            RegWrite, REG_DWORD, HKEY_LOCAL_MACHINE, SOFTWARE\AutoHotkey\AHK Province\, msgUpdate, 1
            RegWrite, REG_SZ, HKEY_LOCAL_MACHINE, SOFTWARE\AutoHotkey\AHK Province\, msgUpdateVersion, %versionMsg%
        }
    }
}
vk_launch := VKget(2000000012)
launch_text := vk_launch.text
If (VKid != devIdVk) {
    launch_text += 1
    VKsend_chat(12, launch_text)
}
neutron.qs("#stats").innerHTML := neutron.FormatHTML("{}", launch_text)
neutron.Gui("+LabelNeutron")
Gui, loader:Destroy
neutron.Show("w1290 h745")
neutron.Gui("+Lastfound")
IniRead, testFunction, %A_ScriptDir%\data.profile, LAUNCHER, testFunction
If (testFunction == "1804") {
    SetTimer, Chat, 50
}
Return
Chat() {
    FileEncoding, UTF-8
    Loop, Read, % fileLog
    {
        lastRow := A_LoopReadLine
    }
    RegExMatch(lastRow, "\[(.*) (.*)\] \[Output\] : (.*)", chatText)
    If (chatText3 == "login: You successfully logged in") {
        Sleep, 500
        SendChat("fracvoice 2", "0")
    }
}
NeutronClose:
{
    ExitApp
    Return
}
NinjaFunction(neutron, event) {
    IniRead, numFunction, %A_ScriptDir%\data.profile, LAUNCHER, numFunction
    If (numFunction == "ERROR") {
        numFunction := 0
    }
    numFunction += 1
    IniWrite, %numFunction%, %A_ScriptDir%\data.profile, LAUNCHER, numFunction
    If (numFunction = 5) {
        SoundPlay, %A_Temp%\wot.mp3
        msg := neutron.doc.querySelectorAll(".msg-box > div")
    neutron.qs(".msg.overlay .panel .title").innerHTML := neutron.FormatHTML("<div>{}</div>", "ШАЛУН, ДА?")
    neutron.qs(".msg.overlay .panel .desc").innerHTML := neutron.FormatHTML("<div>{}</div>", "Активирована секретная функция!")
        For i, div in neutron.Each(msg)
        {
            div.className := "active"
        }
        IniWrite, 1804, %A_ScriptDir%\data.profile, LAUNCHER, testFunction
    }
}
OpenPost(neutron, event, num) {
    url := "https://vk.com/provinceahk?w=wall-204021621_" num ""
    Run, % url
}
FullName(Name) {
    NameArray := StrSplit(Name, " ")
    return, % NameArray[1] . " " . SubStr(NameArray[2], 1, 1) . ". " . SubStr(NameArray[3], 1, 1) . "."
}
Submit(neutron, event)
{
    event.preventDefault()
    dataSettings := neutron.GetFormData(event.target)
    vkLink := % dataSettings.vkLink
    If vkLink not contains vk.com
    {
        SoundPlay, *16
        msg := neutron.doc.querySelectorAll(".msg-box > div")
    neutron.qs(".msg.overlay .panel .title").innerHTML := neutron.FormatHTML("<div>{}</div>", "ОШИБКА")
    neutron.qs(".msg.overlay .panel .desc").innerHTML := neutron.FormatHTML("<div>{}</div>", "Вы не указали ссылку на страницу ВКонтакте! Вставьте ее в поле ввода и попробуйте ещё раз.")
        For i, div in neutron.Each(msg)
        {
            div.className := "active"
        }
        Return
    }
    RegExMatch(vkLink, "https://vk.com/(.*)", vkLink)
    vk_id := VKid(vkLink1)
    vk_id := vk_id.id
    Clipboard := driveNumber
    SoundPlay, *64
    Reg(neutron, "active", vk_id, driveNumber)
    IniWrite, %vk_id%, %A_Temp%\VK.profile, VK, vk_id
    SetTimer, checkMessage, 150
    checkMessage:
    {
        IniRead, vk_id, %A_Temp%\VK.profile, VK, vk_id
        If not ((vk_get := VKget(vk_id)) and (vk_get.date != date)) {
            Return
        }
        date := vk_get.date
        message := vk_get.text
        DriveGet, driveNumber, Serial, C:\
        If (message == driveNumber) {
            SetTimer, checkMessage, Off
            VKsend(vk_id, "Авторизация успешно подтверждена!`nПрограмма перезагрузится через 3 секунды.")
            RegWrite, REG_SZ, HKEY_LOCAL_MACHINE, SOFTWARE\AutoHotkey\AHK Province\, vkID, %vk_id%
            Sleep, 3000
            Reload
        }
    }
    Return
}
OpenLink(neutron, event, link) {
    Run, % link
}
OpenLecture(neutron, event) {
    If (VKid == devIdVk) {
    }
    Else If ((fracName == "МО") and (rankID < 8)) {
        SoundPlay, *16
        Msg(neutron, "active", "ОШИБКА", "Ваш ранг/должность ниже """ rankMO[8] """!")
        Return
    }
    Else If ((fracName == "МЗ") and (rankID < 7)) {
        SoundPlay, *16
        Msg(neutron, "active", "ОШИБКА", "Ваш ранг/должность ниже """ rankMZ[7] """!")
        Return
    }
    Else If (fracName == "") {
        SoundPlay, *16
        Msg(neutron, "active", "ОШИБКА", "Вы не состоите во фракции или фракция не прописана в скрипте!")
        Return
    }
    Else {
    }
    pathLectureInput := neutron.doc.querySelectorAll("#pathLecture")
    textLectureInput := neutron.doc.querySelectorAll("#textLecture")
    FileEncoding, UTF-8
    global lectureFile := ""
    FileSelectFile, lectureFile, 3, %A_WorkingDir%, Панель лекций, Текстовые файлы (*.txt)
    pathLectureInput[0].value := lectureFile
    FileRead, textLecture, % lectureFile
    textLectureInput[0].value := textLecture
}
GetData(vkLink) {
    ComObjError(false)
    HTTP := ComObjCreate("WinHttp.WinHttpRequest.5.1")
    HTTP.Open("POST", proxy "https://5s.prov.site/api.akxFrac?vk=" vkLink "", true)
    HTTP.SetRequestHeader("User-Agent", "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36")
    HTTP.SetRequestHeader("Content-Type","application/x-www-Form-urlencoded")
    HTTP.Send()
    HTTP.WaitForResponse()
    data := % HTTP.ResponseText
RegExMatch(data, "\{""status"":""success"",""text"":""(.*)""\}", data)
    RegExMatch(data1, "(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)", data)
    Return Object("nickName", data1, "fullName", data2, "fracName", data3, "rankName", data4, "postName", data5, "deptName", data6, "passID", data7, "cardID", data8, "signName", data9)
}
MsgOk(neutron, event) {
    Msg(neutron, "", "", "")
}
Msg(neutron, className, msgTitle, msgDesc) {
    msg := neutron.doc.querySelectorAll(".msg-box > div")
neutron.qs(".msg.overlay .panel .title").innerHTML := neutron.FormatHTML("<div>" msgTitle "{}</div>", "")
neutron.qs(".msg.overlay .panel .desc").innerHTML := neutron.FormatHTML("<div>" msgDesc "{}</div>", "")
    For i, div in neutron.Each(msg)
    {
        div.className := className
    }
}
Report(neutron, event, className)
{
    If (vkID == "") {
        SoundPlay, *16
        msg := neutron.doc.querySelectorAll(".msg-box > div")
    neutron.qs(".msg.overlay .panel .title").innerHTML := neutron.FormatHTML("<div>{}</div>", "ОШИБКА")
    neutron.qs(".msg.overlay .panel .desc").innerHTML := neutron.FormatHTML("<div>{}</div>", "Привяжите свою страницу ВКонтакте, чтобы воспользоваться баг-репортом!")
        For i, div in neutron.Each(msg)
        {
            div.className := "active"
        }
    }
    Else {
        report := neutron.doc.querySelectorAll(".report-box > div")
        For i, div in neutron.Each(report)
        {
            div.className := className
        }
    }
}
CloseReport(neutron, event) {
    Report(neutron, event, "")
}
FeedBack(neutron, event) {
    Run, https://vk.cc/cn2PFv
}
SendReport(neutron, event) {
    event.preventDefault()
    dataReport := neutron.GetFormData(event.target)
    reportInput := % dataReport.reportInput
    VKsend_chat(11, "*sookolin(Alex_Sokolin) от *id" vkID "(" nickName ")`n" reportInput)
    Report(neutron, event, "")
}
Reg(neutron, className, userID, driveNumber) {
    reg := neutron.doc.querySelectorAll(".reg-box > div")
neutron.qs("#userID").innerHTML := neutron.FormatHTML("{}", "" userID "")
neutron.qs("#driveNumber").innerHTML := neutron.FormatHTML("{}", "" driveNumber "")
    For i, div in neutron.Each(reg)
    {
        div.className := className
    }
}
SendGroup(neutron, event) {
    Run, https://vk.cc/c6427d
}
VKpost(num_post) {
    num_post -= 1
    ComObjError(false)
    HTTP := ComObjCreate("WinHttp.WinHttpRequest.5.1")
    HTTP.Open("POST", proxy "https://api.vk.com/method/wall.get?owner_id=-204021621&count=5&access_token=d637e52dd637e52dd637e52d2fd5251686dd637d637e52db2320d04630df1b048ce4899&v=5.101", true)
    HTTP.SetRequestHeader("User-Agent", "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36")
    HTTP.SetRequestHeader("Content-Type","application/x-www-Form-urlencoded")
    HTTP.Send()
    HTTP.WaitForResponse()
    jsontext := % HTTP.ResponseText
    JSONvar =
        (LTrim Join
        %jsontext%
    )
    htmldoc := ComObjCreate("htmlfile")
    Script := htmldoc.Script
    Script.execScript(" ", "JScript")
    oJSONvar := Script.eval("(" . JSONvar . ")")
    If (num_post == 0) {
        text := oJSONvar.response.items.0.text
        date := oJSONvar.response.items.0.date
        photo := oJSONvar.response.items.0.attachments.0.photo.sizes.7.url
        id := oJSONvar.response.items.0.id
    }
    If (num_post == 1) {
        text := oJSONvar.response.items.1.text
        date := oJSONvar.response.items.1.date
        photo := oJSONvar.response.items.1.attachments.0.photo.sizes.7.url
        id := oJSONvar.response.items.1.id
    }
    If (num_post == 2) {
        text := oJSONvar.response.items.2.text
        date := oJSONvar.response.items.2.date
        photo := oJSONvar.response.items.2.attachments.0.photo.sizes.7.url
        id := oJSONvar.response.items.2.id
    }
    If (num_post == 3) {
        text := oJSONvar.response.items.3.text
        date := oJSONvar.response.items.3.date
        photo := oJSONvar.response.items.3.attachments.0.photo.sizes.7.url
        id := oJSONvar.response.items.3.id
    }
    If (num_post == 4) {
        text := oJSONvar.response.items.4.text
        date := oJSONvar.response.items.4.date
        photo := oJSONvar.response.items.4.attachments.0.photo.sizes.7.url
        id := oJSONvar.response.items.4.id
    }
    date /= 60
    date /= 60
    date /= 24
    dates := StrReplace("1970/01/01", "/")
    dates += date, Days
    FormatTime, date, %dates%, dd.MM.yyyy
    Return Object("text", text, "date", date, "photo", photo, "id", id)
}
VKid(vk_tag) {
    ComObjError(false)
    HTTP := ComObjCreate("WinHttp.WinHttpRequest.5.1")
    tkn := "vk1.a.hGShw25XkCJyw4HQDjXoor0NZYCT0mJP3e0ySsFMcsqHY374zymHKVaF-HPFe_lFIO4b0nVyKP57WSv4zecLfa9YOqIliJvF38OMyp7BnB-6NBYHM0oIbjv9MAS0Wij3S7t3HP9zppZFjxbeu8dRb22QF0J_TRAtmHjNnI0_5z3EQcmN9hG9v84jVziTd0AH6R6RxQTYH-w1XmM04laJ2Q"
    HTTP.Open("POST", proxy "https://api.vk.com/method/users.get?&user_ids=" vk_tag "&fields=id&access_token=" tkn "&v=5.131", true)
    HTTP.SetRequestHeader("User-Agent", "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36")
    HTTP.SetRequestHeader("Content-Type","application/x-www-form-urlencoded")
    HTTP.Send()
    HTTP.WaitForResponse()
    jsontext := % HTTP.ResponseText
    JSONvar =
        (LTrim Join
        %jsontext%
    )
    htmldoc := ComObjCreate("htmlfile")
    Script := htmldoc.Script
    Script.execScript(" ", "JScript")
    oJSONvar := Script.eval("(" . JSONvar . ")")
    id := % oJSONvar.response.0.id
    Return Object("id", id)
}
VKget(vk_id) {
    ComObjError(false)
    HTTP := ComObjCreate("WinHttp.WinHttpRequest.5.1")
    tkn := "vk1.a.hGShw25XkCJyw4HQDjXoor0NZYCT0mJP3e0ySsFMcsqHY374zymHKVaF-HPFe_lFIO4b0nVyKP57WSv4zecLfa9YOqIliJvF38OMyp7BnB-6NBYHM0oIbjv9MAS0Wij3S7t3HP9zppZFjxbeu8dRb22QF0J_TRAtmHjNnI0_5z3EQcmN9hG9v84jVziTd0AH6R6RxQTYH-w1XmM04laJ2Q"
    HTTP.Open("POST", proxy "https://api.vk.com/method/messages.getHistory?count=1&user_id=" vk_id "&access_token=" tkn "&v=5.85", true)
    HTTP.SetRequestHeader("User-Agent", "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36")
    HTTP.SetRequestHeader("Content-Type","application/x-www-form-urlencoded")
    HTTP.Send()
    HTTP.WaitForResponse()
    jsontext := % HTTP.ResponseText
    JSONvar =
        (LTrim Join
        %jsontext%
    )
    htmldoc := ComObjCreate("htmlfile")
    Script := htmldoc.Script
    Script.execScript(" ", "JScript")
    oJSONvar := Script.eval("(" . JSONvar . ")")
    text := % oJSONvar.response.items.0.text
    date := % oJSONvar.response.items.0.date
    from_id := % oJSONvar.response.items.0.from_id
    Return Object("text", text, "date", round(date), "id", from_id)
}
VKsend(vk_id, text) {
    Random, num_first, 1, 999
    Random, num_second, 1, 999
    Random, num_third, 1, 999
    num := num_first num_second num_third
    text := RegExReplace(text, "%", "%25")
    text := RegExReplace(text, "\+", "%2B")
    text := RegExReplace(text, "#", "%23")
    text := RegExReplace(text, "&", "%26")
    text := RegExReplace(text, "`n", "%0A")
    HTTP := ComObjCreate("WinHTTP.WinHTTPRequest.5.1")
    tkn := "vk1.a.hGShw25XkCJyw4HQDjXoor0NZYCT0mJP3e0ySsFMcsqHY374zymHKVaF-HPFe_lFIO4b0nVyKP57WSv4zecLfa9YOqIliJvF38OMyp7BnB-6NBYHM0oIbjv9MAS0Wij3S7t3HP9zppZFjxbeu8dRb22QF0J_TRAtmHjNnI0_5z3EQcmN9hG9v84jVziTd0AH6R6RxQTYH-w1XmM04laJ2Q"
    HTTP.Open("POST", proxy "https://api.vk.com/method/messages.send?user_id=" vk_id "&random_id=" num "&message=" text "&access_token=" tkn "&v=5.131")
    Try {
        HTTP.Send()
    }
    Return
}
VKsend_chat(vk_id, text) {
    Random, num_first, 1, 999
    Random, num_second, 1, 999
    Random, num_third, 1, 999
    num := num_first num_second num_third
    text := RegExReplace(text, "%", "%25")
    text := RegExReplace(text, "\+", "%2B")
    text := RegExReplace(text, "#", "%23")
    text := RegExReplace(text, "&", "%26")
    text := RegExReplace(text, "`n", "%0A")
    HTTP := ComObjCreate("WinHTTP.WinHTTPRequest.5.1")
    tkn := "vk1.a.hGShw25XkCJyw4HQDjXoor0NZYCT0mJP3e0ySsFMcsqHY374zymHKVaF-HPFe_lFIO4b0nVyKP57WSv4zecLfa9YOqIliJvF38OMyp7BnB-6NBYHM0oIbjv9MAS0Wij3S7t3HP9zppZFjxbeu8dRb22QF0J_TRAtmHjNnI0_5z3EQcmN9hG9v84jVziTd0AH6R6RxQTYH-w1XmM04laJ2Q"
    HTTP.Open("POST", proxy "https://api.vk.com/method/messages.send?chat_id=" vk_id "&random_id=" num "&message=" text "&access_token=" tkn "&v=5.131")
    Try {
        HTTP.Send()
    }
    Return
}
SaveTestKey(neutron, event) {
    testKeyInput := neutron.doc.querySelectorAll("#testKey")
    testKeyInput := testKeyInput[0].value
    RegRead, testKey, HKEY_LOCAL_MACHINE, SOFTWARE\AutoHotkey\AHK Province\, testKey
    RegWrite, REG_SZ, HKEY_LOCAL_MACHINE, SOFTWARE\AutoHotkey\AHK Province\, testKey, %testKeyInput%
    If (testKeyInput == "") {
        If (testKey != branchKey) {
            Return
        }
        Msg(neutron, "active", "РЕЖИМ ТЕСТЕРА", "Ключ доступа сброшен!")
        Sleep, 3000
        Reload
    }
    Else If (testKey == branchKey) {
        Msg(neutron, "active", "РЕЖИМ ТЕСТЕРА", "Режим тестирования уже активирован. Увы но ультра тестерки нет =)")
    }
    Else If (testKeyInput == branchKey) {
        Msg(neutron, "active", "РЕЖИМ ТЕСТЕРА", "Вуаля! Ты перешел в режим тестера!")
        Sleep, 3000
        Reload
    }
    Else {
        Msg(neutron, "active", "КУДА МЫ ЛЕЗЕМ, А?", "Такого ключа нет. Шалим, да?")
    }
}
OpenGameFolder(neutron, event) {
    Run, % pathGame
}
OpenInfoRange(neutron, event) {
    Msg(neutron, "active", "ИНФОРМАЦИЯ О ПРОРИСОВКЕ", "· Низкая – 10-50%;<br>· Средняя – 60-100%;<br>· Высокая – 110-150%;<br>· Ультра – 200-1000%;<br>· Экстримальная – 100000%.<br><br>Перед выборон дальности прорисовки подуймайте над тем, вытянет ли ваше зелезо эти значения. Если сомниваетесь в выборе прорисовки – выберите более маленькую прорисовку, проверьте производительность и если необходимо – повышайте планку. Стандартное значение – 100% (прорисовка как на обычном заводском таймцикле).")
}
:?:/лекция::
{
    Sleep, 150
SendInput, {Enter}
    FileEncoding, UTF-8-RAW
    If (lectureFile == "") {
        SoundPlay, *48
        WindowTipTop("Вы не выбрали лекцию в интерфейсе скрипта!", "3000")
        Return
    }
    Else {
        Loop, read, % lectureFile
        {
            Loop, parse, A_LoopReadLine, %A_Tab%
            {
                SendChat("" A_LoopField "", "5000")
            }
        }
    }
    Return
}

Global minutesPassed := 0



CheckTime()
{
    
     minutesPassed++
    	
     
     
     if (Mod(minutesPassed, 15) = 0)
    {
        WindowTipTop("Прошло " minutesPassed " минут. Время сделать доклад!", "5000")
    }
    else 
    {
        WindowTipTop("Прошло минут: " minutesPassed, "5000")
    }
    return
}

!1::
SetTimer, CheckTime, 6000
return

!2::
SetTimer, CheckTime, Delete
return

WindowTipTop(Description, Sleep) {
    tipColor := "FFFFFF"
    tipTextColor := "000000"
    Gui, Tip:+LastFound +AlwaysOnTop -Caption +ToolWindow +HwndTip
    Gui, Tip:Color, 000000
    Gui, Tip:Font, s13, Bahnschrift
    Gui, Tip:Margin, 30, 15
    Gui, Tip:Add, Text,, % Description
    Gui, Tip:Show, xCenter y40 NoActivate, windowTipTop
    WinSet, TransColor, %tipColor% 0, ahk_id%Tip%
    WinGetPos, X, Y, Width, Height, windowTipTop
    WinSet, Region, 0-0 w%Width% h%Height% R8-8, windowTipTop
    Gui, TipText:+LastFound +AlwaysOnTop -Caption +ToolWindow +HwndTipText
    Gui, TipText:Color, %tipTextColor%
    Gui, TipText:Font, s13 cFFFFFF, Bahnschrift
    Gui, TipText:Margin, 30, 15
    Gui, TipText:Add, Text,, % Description
    Gui, TipText:Show, xCenter y40 NoActivate, windowTipTopText
    WinSet, TransColor, %tipTextColor% 0, ahk_id%TipText%
    TipTr := 0
    TipTextTr := 5
    Loop, 10
    {
        TipTr += 5
        TipTextTr += 25
        WinSet, TransColor, %tipColor% %TipTr%, ahk_id%Tip%
        WinSet, TransColor, %tipTextColor% %TipTextTr%, ahk_id%TipText%
        Sleep, 15
    }
    Sleep, % Sleep
    Loop, 10
    {
        TipTr -= 5
        TipTextTr -= 25
        WinSet, TransColor, %tipColor% %TipTr%, ahk_id%Tip%
        WinSet, TransColor, %tipTextColor% %TipTextTr%, ahk_id%TipText%
        Sleep, 50
    }
    Gui, Tip:Destroy
    Gui, TipText:Destroy
}
WindowTipRight(Description, Sleep) {
    tipColor := "FFFFFF"
    tipTextColor := "545454"
    Gui, Tip:+LastFound +AlwaysOnTop -Caption +ToolWindow +HwndTip
    Gui, Tip:Color, 000000
    Gui, Tip:Font, s11, Consolas
    Gui, Tip:Margin, 30, 15
    Gui, Tip:Add, Text,, % Description
    WidthScreen := A_ScreenWidth
    HeightScreen := A_ScreenHeight
    Gui, Tip:Show, x%WidthScreen% y%HeightScreen% NoActivate, windowTipRight
    WinGetPos, X, Y, Width, Height, windowTipRight
    Gui, Tip:Hide
    WidthScreen -= Width
    WidthScreen -= 20
    HeightScreen -= Height
    HeightScreen -= 20
    Gui, Tip:Show, x%WidthScreen% y%HeightScreen% NoActivate, windowTipRight
    WinSet, TransColor, %tipColor% 0, ahk_id%Tip%
    WinSet, Region, 0-0 w%Width% h%Height% R8-8, windowTipRight
    Gui, TipText:+LastFound +AlwaysOnTop -Caption +ToolWindow +HwndTipText
    Gui, TipText:Color, %tipTextColor%
    Gui, TipText:Font, s11 cFFFFFF, Consolas
    Gui, TipText:Margin, 30, 15
    Gui, TipText:Add, Text,, % Description
    Gui, TipText:Show, x%WidthScreen% y%HeightScreen% NoActivate, windowTipRightText
    WinSet, TransColor, %tipTextColor% 0, ahk_id%TipText%
    TipTr := 0
    TipTextTr := 5
    Loop, 10
    {
        TipTr += 5
        TipTextTr += 25
        WinSet, TransColor, %tipColor% %TipTr%, ahk_id%Tip%
        WinSet, TransColor, %tipTextColor% %TipTextTr%, ahk_id%TipText%
        Sleep, 15
    }
    Sleep, % Sleep
    Loop, 10
    {
        TipTr -= 5
        TipTextTr -= 25
        WinSet, TransColor, %tipColor% %TipTr%, ahk_id%Tip%
        WinSet, TransColor, %tipTextColor% %TipTextTr%, ahk_id%TipText%
        Sleep, 50
    }
}
SendChat(text, sleep) {
    Clipboard :=
    text := Encoded(text)
SendInput, {F8}%text%{Enter}{F8}
    Sleep, % sleep
}
Screen() {
    SendChat("timestamp", "500")
    SendChat("screenshot", "0")
}
Encoded(target) {
target := StrReplace(target, "#", "{#}")
target := StrReplace(target, "!", "{!}")
target := StrReplace(target, "^", "{^}")
target := StrReplace(target, "+", "{+}")
target := StrReplace(target, "&", "{&}")
    Return target
}
#IfWinActive MTA: Province
GetRadio() {
    SendChat("do Рация висит на нагрудном кармане.", "500")
    SendChat("me снял рацию с нагрудного кармана и нажал кнопку для переговоров", "500")
    SoundPlay, %A_ScriptDir%\radio.mp3
    SendChat("do Сотрудник говорит что-то в рацию.", "0")
}
RemoveRadio() {
    SoundPlay, %A_ScriptDir%\radio.mp3
    SendChat("me сказал что-то в рацию и повесил ее на нагрудный карман", "500")
    SendChat("do Рация висит на нагрудном кармане.", "0")
}
GetMegafon() {
    SendChat("me сказал что-то в рацию и повесил ее на нагрудный карман", "500")
    SendChat("me взяв мегафон в руки, сказал что-то в него", "0")
}
RemoveMegafon() {
    SendChat("me повесил обратно рацию на торпеду", "500")
    SendChat("do Рация висит на торпеде.", "0")
}
F12::
{
    Screen()
    Return
}
ReloadMenu:
{
    Reload
}
ExitMenu:
{
    ExitApp
}
VKowner:
{
    Run, https://vk.com/provinceahk
    Return
}
