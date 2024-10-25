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
SendChat("me нажал кнопку тревоги на панели управления системы ""Око""", "0")
SendChat("do Сигнал тревоги с координатами отправлен в дежурную часть управления.", "0")
Sleep 15000
SendChat("ro [Система ""Око""][МВД] Код-0. Активирована кнопка тревоги. Местоположение: " Place ".", "0")
Return

:?:/код0с::
GetArgsForHotstring("код0с", "Place")
SendPlay {Enter}
SendChat("me незаметно нажал кнопку тревоги, вшитую в форму и подключённую к КПК", "0")
SendChat("do Сигнал тревоги с координатами отправлен в дежурную часть управления.", "0")
Sleep 15000
SendChat("ro [КПК " License "][МВД] Код-0. Активирована кнопка тревоги. Местоположение: " Place ".", "0")
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