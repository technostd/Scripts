﻿#NoEnv
#SingleInstance Force

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
    SendInput {F8}%TextBind%{Enter}{F8}
    Sleep %SleepBind%
} 

:?:/ку::
SendInput {Enter}
SendChat("do [Информатор] Вас обслуживает ООО ""Пассажиравтотранс""! Удачной поездки!", "0")
Return

:?:/бб::
SendInput {Enter}
SendChat("do [Информатор] Спасибо что воспользовались услугами ООО ""Пассажиравтотранс""! Удачного дня!", "3000")
SendChat("b Устроиться в наше предпредприятие - https://vk.com/chatppat", "0")
Return

:?:/трк::
SendInput {Enter}
SendChat("bind *кнопка* me взяв транспортную карту ""Подорожник"", приложил её к валидатору, затем оторвал и отдал билет пассажиру", "3000")
Return

:?:/12::
SendInput {Enter}
SendChat("s Автобус 12 следует через БУ рынок, ТТУ, Трам.депо 2, Метродепо, Пиццерию, Стройку, Банк, ЦГБ\Трам.депо 1, Тролл.депо, ЖБК", "3000")
SendChat("do [Табличка] ::12:: Вокзал - БУ Рынок - Гостиница - ТТУ - Трам.депо 2 - Метродепо - Пиццерия - Стройка - Банк - ЦГБ\Трам.депо 1 - Тролл.депо - Завод ЖБК.", "0")
Return

:?:/12о::
SendInput {Enter}
SendChat("s Автобус 12 следует через Тролл.депо, ЦГБ\Трам.депо 1, Банк, Стройку, Пиццерию, Метродепо, Трам.депо 2, ТТУ, БУ Рынок, Вокзал!", "3000")
SendChat("do [Табличка] ::12:: Завод ЖБК - Тролл.депо - ЦГБ\Трам.депо 1 - Банк - Стройка - Пиццерия - Метродепо - Трам.депо 2 - ТТУ - Гостиница - БУ Рынок - Вокзал.", "0")
Return

:?:/74::
SendInput {Enter}
SendChat("s Автобус 74 следует через Автошколу, Стоянку\Дальнобой, АТП-1, Метродепо, Автосалон, Стройку, Троллейбусное депо, ЖБК!", "3000")
SendChat("do [Табличка] ::74:: Вокзал - Автошкола - АТП-2 - Стоянка\Дальнобой - Метродепо - Автосалон - Стройка - Тролл.депо - Завод ЖБК.", "0")
Return

:?:/74о::
SendInput {Enter}
SendChat("s Автобус 74 следует через Троллейбусное депо, Стройку, Автосалон, Метродепо, АТП-1, Стоянку\Дальнобой, Автошколу, Вокзал!", "3000")
SendChat("do [Табличка] ::74:: Завод ЖБК - Тролл.депо - Стройка - Автосалон - Метродепо - Стоянка\Дальнобой - АТП-2 - Автошкола - Вокзал.", "0")
Return

:?:/169А::
SendInput {Enter}
SendChat("s Автобус 169А следует через Таксопарк Жуковский, АТП Жуковский, ЖТУ, Лесопилку!", "3000")
SendChat("do [Табличка] ::169А:: Вокзал Приволжск - Таксопарк Жуковский - АТП Жуковский - ЖТУ - Лесопилка.", "0")
Return

:?:/169Ао::
SendInput {Enter}
SendChat("s Автобус 169А следует через ЖТУ, АТП Жуковский, Таксопарк Жуковский, Вокзал Приволжск!", "3000")
SendChat("do [Табличка] ::169А:: Лесопилка - ЖТУ - АТП Жуковский - Таксопарк Жуковский - Вокзал Приволжск.", "0")
Return