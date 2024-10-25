^end::
ExitApp
Return

!end::pause

^F1::
Run,C:\Scripts\gui.ahk
ExitApp
Return

^1::
SendInput,{F8}s Отряд{!} Ровняйсь{!} Смирно{!}{Enter}{F8}
Sleep 500
SendInput,{F8}b animarmy 4{Enter}{F8}
Sleep 500
SendInput,{F8}s Вольно.{Enter}{F8}
Sleep 500
SendInput,{F8}say Сейчас будет проведена спецоперация по отлову ООП.{Enter}{F8}
Sleep 500
SendInput,{F8}say Работаем в 1 экипаж.{Enter}{F8}
Sleep 500
SendInput,{F8}say Работаем по системе "Вантед", розыск второго и выше уровней.{Enter}{F8}
Sleep 500
SendInput,{F8}say Перед началом проверить табельное оружие, настроить разгрузки и опустить забрала.{Enter}{F8}
Sleep 500
SendInput,{F8}say На выполнение пять минут, о готовности докладываем.{Enter}{F8}
Sleep 500
SendInput,{F8}b Форма доклада: "*Должность* ОСН "БАРС" *Позывной* в полной боеготовности{!}"{Enter}{F8}
Sleep 500
SendInput,{F8}b Форма доклада для тех, кто не состоит в "БАРС": "*Позывной* в полной боеготовности!"{Enter}{F8}
Sleep 500
SendInput,{F8}s Выполнять{!}{Enter}{F8}
Return

^2::
SendInput,{F8}s По машинам, едем в аптеку и за масками с СГУ.{Enter}{F8}
Return

^Numpad1::
SendInput,{F8}ro [ЦСН МВД] ОСН "БАРС" начал спецоперацию по отлову ООП.{Enter}{F8}
Return

^Numpad2::
SendInput,{F8}ro [ЦСН МВД] ОСН "БАРС" продолжает спецоперацию по отлову ООП.{Enter}{F8}
Return

^Numpad3::
SendInput,{F8}ro [ЦСН МВД] ОСН "БАРС" закончил спецоперацию по отлову ООП. Потерь нет.{Enter}{F8}
Return