
^1::
Http := ComObjCreate("WinHttp.WinHttpRequest.5.1")
Http.Open("GET", "https://github.com/sokolin05/profile.tp/raw/main/version.profile.md")
Http.Send()
Versions := StrSplit(Http.ResponseText, "`n")
NewVersion := Versions[1]
GuiNewVersion := Versions[2]
SendInput %GuiNewVersion%{Enter}