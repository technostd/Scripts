#NoEnv
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

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
s
SendChat(TextBind, SleepBind)
{
    SetLocaleRu()
    SetCapsOff()
    TextBind := Encoded(TextBind)
    Clipboard :=
    SendPlay {F8}^A{Delete}%TextBind%{Enter}{F8}
    Sleep %SleepBind%
} 

