#SingleInstance Force

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
    SendPlay {F6}
    Sleep 50
    SendPlay ^A{Delete}%TextBind%{Enter}
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

CheckUIA()

Return

!1::
SendChat("Здравия желаю, инспектор ОР ДПС управления ГИБДД ГУ МВД России по Нижегородской области, старшина полиции Серогов.", "0")
Return

XButton2::
SendChat("/time", "0")
Return
