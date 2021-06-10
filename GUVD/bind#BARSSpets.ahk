; Script powered in 2021 by Techno's studio
; All rights reserwed

#SingleInstance force

DataPath = %A_WorkingDir%\data.ini

Data := Object()
    
IniRead Bufer, %DataPath%, GuvdData, City
Data.City := Bufer
IniRead Bufer, %DataPath%, GuvdData,IdNumber
Data.IdNumber := Bufer
IniRead Bufer, %DataPath%, GuvdData, Nickname
Data.Nickname := Bufer
IniRead Bufer, %DataPath%, GuvdData, Rank
Data.Rank := Bufer
IniRead Bufer, %DataPath%, GuvdData, Post
Data.Post := Bufer

for Field, Val in Data
{
    if(Val=="ERROR")
    {
        MsgBox, , Error #11, Some error with reading .ini file.
        ExitApp
    }
    if(Val=="")
    {
        RunWait %A_WorkingDir%\gui#GetUserData.ahk
        Reload
    }
}

if(Data.City=="Мирный")
{
    Struct=ГУ МВД по г. Мирный и МО
    Division=ОСН "БАРС"
    Tag=ГУ МВД-М
}
if(Data.City=="Приволжск")
{
    Struct=ГУ МВД по г. Приволжск и ПО
    Division=СОБР
    Tag=ГУ МВД-П   
}

if(Data.City=="Невский")
{    
    Struct=ГУ МВД по г. Невский и НО
    Division=ОСН "Смерч"
    Tag=ГУ МВД-Н   
}

Return

^F10::
RunWait %A_WorkingDir%\gui#GetUserData.ahk
Reload

^end::
ExitApp
Return

!end::
pause
Return

^F1::
Run %A_WorkingDir%\gui#ScriptChoose.ahk
ExitApp
Return

!vkC0::
Clipboard = 
SendInput {F8}do Планшет "РоМОС" в разгрузке.{Enter}{F8}
Sleep 10
SendInput {F8}me достал и включил планшет{Enter}{F8}
Sleep 10
SendInput {F8}do Планшет готов к работе.{Enter}{F8}
Return

^vkC0::
Clipboard = 
SendInput {F8}me выключил планшет и убрал в разгрузку{Enter}{F8}
Sleep 10
SendInput {F8}do Планшет "РоМОС" в разгрузке.{Enter}{F8}
Return

!1::
Clipboard = 
Rank := Data.Rank
City := Data.City
Nickname := Data.Nickname
Post := Data.Post
SendInput {F8}animarmy 3{Enter}{F8}
Sleep 500
SendInput {F8}say Здравия желаю. %Post% %Nickname%.{Enter}{F8}
Sleep 500
SendInput {F8}do [Нашивка] %Nickname% | %Rank% | %Division% [%Struct%].{Enter}{F8}
Return

^1::
Clipboard = 
Rank := Data.Rank
City := Data.City
Nickname := Data.Nickname
SendInput {F8}do Удостоверение лежит в нагрудном кармане.{Enter}{F8}
Sleep 500
SendInput {F8}me достал удостоверение из нагрудного кармана и развернул его{Enter}{F8}
Sleep 500
SendInput {F8}do [Спец. удостоверение] %Nickname% | %Rank% | %Division% [%Struct%].{Enter}{F8}
Sleep 500
SendInput {F8}do [Спец. удостоверение] Фотография | Печать | Подпись начальника ГУ МВД [%Struct%].{Enter}{F8}
Return

^vk51::
Clipboard = 
SendInput {F8}me закрыл удостоверение и убрал его в нагрудный карман{Enter}{F8}
Sleep 500
SendInput {F8}do Удостоверение в нагрудном кармане.{Enter}{F8}
Return


!2::
Clipboard = 
SendInput {F8}c cuff{Space}
Input, var, v,{Enter}
Sleep 10
SendInput do Наручники закреплены на поясном ремне.{Enter}{F8}
Sleep 5
SendInput {F8}me сняв наручники с пояса, завел руки преступника за спину и надел на него наручники{Enter}{F8}
Sleep 5
SendInput {F8}do Преступник в наручниках.{Enter}{F8}
Sleep 5
SendInput {F8}cuff %var%{Enter}{F8}
Return

^2::
Clipboard = 
SendInput {F8}c uncuff{Space}
Input, var, v,{Enter}
Sleep 10
SendInput do Ключ от наручников в разгрузке.{Enter}{F8}
Sleep 5
SendInput {F8}me достав ключ, снял с гражданина наручники и закрепил их за поясом{Enter}{F8}
Sleep 5
SendInput {F8}do Наручники закреплены на поясном ремне.{Enter}{F8}
Sleep 5
SendInput {F8}me убрал ключ в карман{Enter}{F8}
Sleep 5
SendInput {F8}do Ключ в кармане.{Enter}{F8}
Sleep 5
SendInput {F8}uncuff %var%{F8}
Return

!3::
Clipboard = 
Clipboard = 
InputBox pID, TechnoAHK | Input,Конвоировать задержанного [arr]. Для отмены нажмите Cancel или оставьте пустое окно.`nВведите ID задержанного.
    if(ErrorLevel)
        Return
    else if(pID=="")
        Return
Sleep 10
SendInput,{F8}me заломил нарушителю руки и повёл за собой{Enter}{F8}
Sleep 500
SendInput,{F8}do Сотрудник конвоирует задержанного.{Enter}{F8}
Sleep 500
SendInput,{F8}arr %pID%{Enter}{F8}
Return

^3::
Clipboard = 
SendInput {F8}me отпустил руки задержанного{Enter}{F8}
Sleep 500
SendInput {F8}do Задержанный в наручниках.{Enter}{F8}
Sleep 500
SendInput {F8}dearr{Enter}{F8}
Return

!vk45:: ; Посадить задержанного в авто
Clipboard = 
SendInput,{F8}say Берегите голову при посадке в автомобиль{!}{Enter}{F8}
Sleep 500
SendInput,{F8}me взял нарушителя за руки и посадил в служебный автомобиль{Enter}{F8}
Sleep 500
SendInput,{F8}Сотрудник усадил задержанного в автомобиль.{Enter}{F8}
Return

^4::
Clipboard = 
SendInput {F8}me сделал фотографию гражданина и запросил данные{Enter}{F8}
Sleep 500
SendInput {F8}do Данные выведены на экран планшета.{Enter}{F8}
Return

!4::
Clipboard = 
SendInput {F8}me запросил информацию на гражданина по серии паспорта{Enter}{F8}
Sleep 500
SendInput {F8}do Информация выведена на экран планшета.{Enter}{F8}
Return

^5::
Clipboard = 
InputBox in, TechnoAHK | Input,Внести ориентировку в базу данных. Для отмены нажмите Cancel.`nВведите ID задержанного, срок заключения и причину без слова УПК.`nПример: 192 4 5.2; будет введено su 192 4 5.2 УПК
    if ErrorLevel
        Return
    Else if in =
        Return
Sleep 10
SendInput me открыл базу данных преступников и внёс ориентировку{Enter}{F8}
Sleep 500
SendInput {F8}do Ориентировка внесена в базу данных.{Enter}{F8}
Sleep 500
SendInput {F8}su %in% УПК{Enter}{F8}
Return

!5::
Clipboard = 
SendInput {F8}me открыл базу данных преступников{Enter}{F8}
Sleep 10
SendInput {F8}do База данных преступников открыта.{Enter}{F8}
Sleep 10
SendInput {F8}wanted{Enter}{F8}
Return

^6:: ; Выдать "ТР"
Clipboard = 
InputBox pID, TechnoAHK | Input,Выдать ТР. Для отмены нажмите Cancel. `nВведите ID.
    if ErrorLevel
        Return
    Else if pID =
        Return
SendInput,{F8}su %pID% 1 TP{Enter}{F8}
Return

!6:: ; Выдать "ТР" с отпиской в /rob
Clipboard = 
InputBox pID, TechnoAHK | Input,Выдать ТР с отпиской в /rob. Для отмены нажмите Cancel. `nВведите ID.
    if ErrorLevel
        Return
    Else if pID =
        Return
SendInput,{F8}su %pID% 1 TP{Enter}{F8}
Sleep 10
SendInput,{F8}rob %pID%{+}{Enter}{F8}
Return

!7::
Clipboard = 
SendInput {F8}me открыл базу данных камер видеонаблюдения{Enter}{F8}
Sleep 10
SendInput {F8}do Изображения с камер транслируются в реальном времени на планшет.{Enter}{F8}
Return

^9:: 
Clipboard = 
SendInput {F8}say Гражданин, сейчас мы составим протокол Вашего задержания.{Enter}{F8}
Sleep 500
SendInput {F8}do В разгрузке лежат бланки и ручка.{Enter}{F8}
Sleep 500
SendInput {F8}me достал из разгрузки бланк протокола и ручку{Enter}{F8}
Sleep 500
SendInput {F8}do Протокол с ручкой в руке.{Enter}{F8}
Sleep 500
SendInput {F8}me заполнил протокол задержания{Enter}{F8}
Sleep 500
SendInput {F8}do Протокол задержания заполнен.{Enter}{F8}
Return

!9::
Clipboard = 
SendInput {F8}do На столе лежат бланки и ручка.{Enter}{F8}
Sleep 500
SendInput {F8}me взял бланк и ручку и положил перед гражданином{Enter}{F8}
Sleep 500
SendInput {F8}do Бланк и ручка лежат перед гражданином.{Enter}{F8}
Sleep 500
SendInput {F8}say Распишите все подробно.{Enter}{F8}
Return

^0::
Clipboard = 
SendInput {F8}c arrest{Space}
Input, var, v,{Enter}
Sleep 10
SendInput do Гарнитура радиопередатчика готова к использованию.{Enter}{F8}
Sleep 100
SendInput {F8}me нажал кнопку на гарнитуре{Enter}{F8}
Sleep 100
SendInput {F8}do Гарнитура в режиме радиовещания.{Enter}{F8}
Sleep 500
SendInput {F8}me вызвал конвоира{Enter}{F8}
Sleep 500
SendInput {F8}r УР-16 02-03{Enter}{F8}
Sleep 500
SendInput {F8}me нажал кнопку еще раз{Enter}{F8}
Sleep 500
SendInput {F8}do Гарнитура радиопередатчика находится в режиме ожидания.{Enter}{F8}
Sleep 500
SendInput {F8}do Конвоир подошел к задержанному.{Enter}{F8}
Sleep 500
SendInput {F8}say Уведите.{Enter}{F8}
Sleep 500
SendInput {F8}do Конвоир увел задержанного.{Enter}{F8}
Sleep 500
SendInput {F8}arrest %var%{Enter}{F8}
Return

^-::
Clipboard = 
SendInput {F8}do Гарнитура радиопередатчика готова к использованию.{Enter}{F8}
Sleep 5
SendInput {F8}me нажал кнопку на гарнитуре{Enter}{F8}
Sleep 5
SendInput {F8}do Гарнитура в режиме радиовещания.{Enter}{F8}
Sleep 5
SendInput {F8}fracvoice 1{Enter}{F8}
Return

^=::
Clipboard = 
SendInput {F8}me нажал кнопку еще раз{Enter}{F8}
Sleep 5
SendInput {F8}do Гарнитура радиопередатчика находится в режиме ожидания.{Enter}{F8}
Sleep 5
SendInput {F8}fracvoice 0{Enter}{F8}
Return


^Numpad4::
Clipboard = 
SendInput {F8}do Тангета закреплена на торпеде.{Enter}{F8}
Sleep 5
SendInput {F8}me снял тангету и зажал кнопку звукоусиления{Enter}{F8}
Sleep 5
SendInput {F8}do СГУ в режиме звукоусиления.{Enter}{F8}
Sleep 5
SendInput {F8}s {#}4169DF[Мегафон]: {#}00FF00Уступите дорогу служебному автомобилю{!}{Enter}{F8}
Sleep 5
SendInput {F8}me отпустил кнопку и повесил тангету на крепление{Enter}{F8}
Sleep 5
SendInput {F8}do Тангета на торпеде.{Enter}{F8}
Return

^Numpad5::
Clipboard = 
SendInput {F8}do Тангета закреплена на торпеде.{Enter}{F8}
Sleep 5
SendInput {F8}me снял тангету и зажал кнопку звукоусиления{Enter}{F8}
Sleep 5
SendInput {F8}do СГУ в режиме звукоусиления.{Enter}{F8}
Sleep 5
SendInput {F8}s {#}4169DF[Мегафон]: {#}FF0000Водители, внимание{!} Движется организованная колонна, останавливаемся{!}{Enter}{F8}
Sleep 5
SendInput {F8}me отпустил кнопку и повесил тангету на крепление{Enter}{F8}
Sleep 5
SendInput {F8}do Тангета на торпеде.{Enter}{F8}
Return

^Numpad6::
Clipboard = 
SendInput {F8}do Тангета закреплена на торпеде.{Enter}{F8}
Sleep 5
SendInput {F8}me снял тангету и зажал кнопку звукоусиления{Enter}{F8}
Sleep 5
SendInput {F8}do СГУ в режиме звукоусиления.{Enter}{F8}
Sleep 5
SendInput {F8}s {#}4169DF[Мегафон]: {#}FF0000Водители, внимание{!} Продолжаем движение{!} Организованная колонна проехала{!}{Enter}{F8}
Sleep 5
SendInput {F8}me отпустил кнопку и повесил тангету на крепление{Enter}{F8}
Sleep 5
SendInput {F8}do Тангета на торпеде.{Enter}{F8}
Return

^Numpad7::
Clipboard = 
SendInput {F8}do Тангета закреплена на торпеде.{Enter}{F8}
Sleep 5
SendInput {F8}me снял тангету и зажал кнопку звукоусиления{Enter}{F8}
Sleep 5
SendInput {F8}do СГУ в режиме звукоусиления.{Enter}{F8}
Sleep 5
SendInput {F8}s {#}4169DF[Мегафон]: {#}00FF00Водитель, принимаем крайнее правое положение и останавливаемся{!}{Enter}{F8}
Sleep 5
SendInput {F8}me отпустил кнопку и повесил тангету на крепление{Enter}{F8}
Sleep 5
SendInput {F8}do Тангета на торпеде.{Enter}{F8}
Return

^Numpad8::
Clipboard = 
SendInput {F8}do Тангета закреплена на торпеде.{Enter}{F8}
Sleep 5
SendInput {F8}me снял тангету и зажал кнопку звукоусиления{Enter}{F8}
Sleep 5
SendInput {F8}do СГУ в режиме звукоусиления.{Enter}{F8}
Sleep 5
SendInput {F8}s {#}4169DF[Мегафон]: {#}EEF20BПовторяю, водитель, примите вправо и остановитесь{!}{Enter}{F8}
Sleep 5
SendInput {F8}me отпустил кнопку и повесил тангету на крепление{Enter}{F8}
Sleep 5
SendInput {F8}do Тангета на торпеде.{Enter}{F8}
Return

^Numpad9::
Clipboard = 
SendInput {F8}do Тангета закреплена на торпеде.{Enter}{F8}
Sleep 5
SendInput {F8}me снял тангету и зажал кнопку звукоусиления{Enter}{F8}
Sleep 5
SendInput {F8}do СГУ в режиме звукоусиления.{Enter}{F8}
Sleep 5
SendInput {F8}s {#}4169DF[Мегафон]: {#}FF0000Останавливаемся{!} Повторяю, останавливаемся{!} Начинаем огонь на поражение{!}{Enter}{F8}
Sleep 5
SendInput {F8}me отпустил кнопку и повесил тангету на крепление{Enter}{F8}
Sleep 5
SendInput {F8}do Тангета на торпеде.{Enter}{F8}
Return

!Numpad1::  ; Рация фракций
Clipboard = 
Run %A_WorkingDir%\gui#InterFracRadio.ahk
Return

!Numpad2:: ; Отправить запрос на экипаж ДПС к <Местоположение>
Clipboard = 
InputBox, location, TechnoAHK:Input,Отправить запрос на экипаж ДПС к <Местоположение>.`nВведите местоположение с маленькой буквы и без точки.
    if ErrorLevel
        Return
    Else if pID =
        Return
Sleep 10
SendInput,{F8}ro [%Tag%][ГИБДД] Требуется экипаж ДПС. Местоположение: %location%.{Enter}{F8}
Return

!Numpad3::
Clipboard = 
SendInput {F8}do [Нашивка] %Nickname% | %Rank% | %Division% [%Struct%].{Enter}{F8}
Sleep 10
SendInput {F8}do На спине шеврон [БАРС], на голове бронешлем "Рысь-Т", лицо закрыто балаклавой.{Enter}{F8}
Return

!Numpad4::
Clipboard = 
SendInput {F8}s {#}00FF00Всем лежать, оружие на пол{!} Работает "БАРС"{!} При сопротивлении - ликвидация на месте{!}{Enter}{F8}
Return

!Numpad5::
Clipboard = 
SendInput {F8}s {#}FF0000Из машины, руки на капот{!}{Enter}{F8}
Return

!Numpad6::
Clipboard = 
SendInput {F8}s {#}00FF00Лег лицом в пол, руки за голову{!} {#}FF0000При игнорировании - ликвидация{!}{Enter}{F8}
Return

!Numpad7:: ; Попытаться открыть дверь
Clipboard = 
SendInput,{F8}me дёрнул за ручку двери{Enter}{F8}
Sleep 10
SendInput,{F8}do Сотрудник пытается открыть дверь.{Enter}{F8}
Sleep 10
SendInput,{F8}try открыл дверь{Enter}{F8}
MsgBox, 36, Выбор результата /try, Удачно?
IfMsgBox, Yes
	SendInput,{F8}do Дверь открыта.{Enter}{F8}
IfMsgBox, No
	SendInput,{F8}do Дверь закрыта.{Enter}{F8}
Return

!Numpad8:: ; Разбить стекло дубинкой (использовать с дубинкой в руке)
Clipboard = 
SendInput,{F8}me замахнулся дубинкой и ударил по стеклу{Enter}{F8}
Sleep 10
SendInput,{F8}do Удар.{Enter}{F8}
Sleep 10
SendInput,{F8}try разбил стекло дубинкой{Enter}{F8}
MsgBox, 4, Удачно?
IfMsgBox, Yes
	SendInput,{F8}do Стекло разбито.{Enter}{F8}
IfMsgBox, No
	SendInput,{F8}do Стекло не разбито.{Enter}{F8}
Return

!Numpad9::
Clipboard = 
SendInput {F8}me потянулся рукой до замка и открыл его изнутри{Enter}{F8}
Sleep 10
SendInput {F8}do Замок открыт.{Enter}{F8}
Sleep 10
SendInput {F8}me открыл дверь и вытащил гражданина из машины{Enter}{F8}
Sleep 10
SendInput {F8}do Гражданин на улице.{Enter}{F8}
Return

^vkBC::
Clipboard = 
SendInput {F8}do Полицейская дубинка закреплена на поясе.{Enter}{F8}
Sleep 10
SendInput {F8}me снял дубинку{Enter}{F8}
Sleep 10
SendInput {F8}do Дубинка в руках.{Enter}{F8}
Return

^vkBE::
Clipboard = 
SendInput {F8}me закрепил дубинку на поясе{Enter}{F8}
Sleep 10
SendInput {F8}do Дубинка на поясе.{Enter}{F8}
Return

!vkBC::
Clipboard = 
SendInput {F8}do Электрошокер Taser c гравировкой "БАРС" закреплен в кобуре.{Enter}{F8}
Sleep 10
SendInput {F8}me резким движением выхватил электрошокер из кобуры и приготовил к использованию{Enter}{F8}
Sleep 10
SendInput {F8}do Электрошокер Taser готов к использованию.{Enter}{F8}
Return

!vkBE::
Clipboard = 
SendInput {F8}me убрал электрошокер в кобуру{Enter}{F8}
Sleep 10
SendInput {F8}do Электрошокер Taser в кобуре.{Enter}{F8}
Return

^vkBA::
Clipboard = 
SendInput {F8}do СПС "Гюрза" c гравировкой "БАРС" лежит в кобуре.{Enter}{F8}
Sleep 10
SendInput {F8}me резким движением выхватил пистолет из кобуры и приготовил к стрельбе{Enter}{F8}
Sleep 10
SendInput {F8}do Пистолет СПС "Гюрза" готов к стрельбе.{Enter}{F8}
Return

^vkDE::
Clipboard = 
SendInput {F8}me поставил пистолет на предохранитель и убрал его в кобуру{Enter}{F8}
Sleep 10
SendInput {F8}do Пистолет  СПС "Гюрза" лежит в кобуре.{Enter}{F8}
Return

!vkBA::
Clipboard = 
SendInput {F8}do АК-104 c гравировкой "БАРС" висит на плече.{Enter}{F8}
Sleep 10
SendInput {F8}me скинул АК-104 c плеча и снял с предохранителя{Enter}{F8}
Sleep 10
SendInput {F8}do АК-104 готов к стрельбе.{Enter}{F8}
Return

!vkDE::
Clipboard = 
SendInput {F8}me поставил АК-104 на предохранитель и повесил на плечо{Enter}{F8}
Sleep 10
SendInput {F8}do АК-104 висит на плече.{Enter}{F8}
Return

!vkBF::
Clipboard = 
SendInput {F8}do СР3-М "Вихрь" c гравировкой "БАРС" висит на плече.{Enter}{F8}
Sleep 10
SendInput {F8}me скинул СР3-М "Вихрь" c плеча и передернул затвор{Enter}{F8}
Sleep 10
SendInput {F8}do СР3-М "Вихрь" готов к стрельбе.{Enter}{F8}
Return

!vkDC::
Clipboard = 
SendInput {F8}me поставил СР3-М "Вихрь" на предохранитель и повесил на плечо{Enter}{F8}
Sleep 10
SendInput {F8}do СР3-М "Вихрь" висит на плече.{Enter}{F8}
Return

^vkBF::
Clipboard = 
SendInput {F8}do Карабин КСА c гравировкой "БАРС" висит на плече.{Enter}{F8}
Sleep 10
SendInput {F8}me скинул карабин КСА и снял с предохранителя{Enter}{F8}
Sleep 10
SendInput {F8}do Карабин КСА готов к стрельбе.{Enter}{F8}
Return

^vkDC::
Clipboard = 
SendInput {F8}me поставил карабин КСА на предохранитель и повесил на плечо{Enter}{F8}
Sleep 10
SendInput {F8}do Карабин КСА висит на плече.{Enter}{F8}
Return

^vkDB::
Clipboard = 
SendInput {F8}do На плече висит СВ-98 с гравировкой "БАРС" в кофре.{Enter}{F8}
Sleep 10
SendInput {F8}me снял корфру с плеча и поставил ее на пол{Enter}{F8}
Sleep 10
SendInput {F8}do Кофра на полу.{Enter}{F8}
Sleep 10
SendInput {F8}me открыл кофру и приготовил СВ-98 к стрельбе{Enter}{F8}
Sleep 10
SendInput {F8}do СВ-98 готова к стрельбе.{Enter}{F8}
Return

^vkDD::
Clipboard = 
SendInput {F8}me разобрал СВ-98 и убрал в кофру{Enter}{F8}
Sleep 10
SendInput {F8}do СВ-98 в кофре.{Enter}{F8}
Sleep 10
SendInput {F8}me закрыл кофру и повесил на плечо{Enter}{F8}
Sleep 10
SendInput {F8}do Кофра на плече.{Enter}{F8}
Return