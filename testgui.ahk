Encoded(Target)
{
    Target := StrReplace(Target, "#", "{#}")
    Target := StrReplace(Target, "!", "{!}")
    Target := StrReplace(Target, "^", "{^}")
    Target := StrReplace(Target, "+", "{+}")
    Target := StrReplace(Target, "&", "{&}")
	
	Return Target
}

SendChat(TextBind, SleepBind)
{
    TextBind := Encoded(TextBind)
    Clipboard :=
    SendInput {F8}^A{Delete}%TextBind%{Enter}{F8}
    Sleep %SleepBind%
}

^1::
    SendChat("say Гражданин, передайте ваше водительское удостоверение,", "500")
    SendChat("say а также паспорт технического средства.", "500")
    SendChat("b /me передал(-а) документы инспектору ДПС", "500")
    SendChat("b /lic [Мой ID] || F3 → Показать ПТС", "500")
Return