; Script powered in 2021 by Techno's studio
; All rights reserwed

; AHK Province 2021

#SingleInstance force

DataPath = %A_WorkingDir%\data.ini

Data := Object()
    
IniRead Bufer, %DataPath%, GuvdData, City
Data.City := Bufer
IniRead Bufer,%DataPath%,GuvdData,IdNumber
Data.IdNumber := Bufer
IniRead Bufer, %DataPath%, GuvdData, SurName
Data.SurName := Bufer
IniRead Bufer, %DataPath%, GuvdData, Name
Data.Name := Bufer
IniRead Bufer, %DataPath%, GuvdData, SecondName
Data.SecondName := Bufer
IniRead Bufer, %DataPath%, GuvdData, Rank
Data.Rank := Bufer
IniRead Bufer, %DataPath%, GuvdData, Post
Data.Post := Bufer

for Field, Val in Data
{
    ;if(Val=="ERROR")
    ;{
    ;    MsgBox, , Error #11, Some error with reading .ini file.
    ;    RunWait %A_WorkingDir%\gui#GetUserData.ahk
    ;    Reload
    ;    ; ExitApp
    ;}
    if(Val=="")
    {
        RunWait %A_WorkingDir%\gui#GetUserData.ahk
        Reload
    }
}

if(Data.City=="Мирный")
{
    Struct=ГУ МВД по г. Мирный и МО
    Tag=ГУ МВД-М    
}

if(Data.City=="Приволжск")
{
    Struct=ГУ МВД по г. Приволжск
    Tag=ГУ МВД-П    
}

if(Data.City=="Невский")
{
    Struct=ГУ МВД по г. Невский
    Tag=ГУ МВД-Н    
}
Return

^F10::
RunWait %A_WorkingDir%\gui#GetUserData.ahk
Reload

^end::
ExitApp

!end::
Pause

^F1::
Run %A_WorkingDir%\gui#ScriptChoose.ahk
ExitApp 

!vkC0:: ; Достать КПК
Clipboard = 
SendInput,{F8}do КПК лежит в кармане.{Enter}{F8}
Sleep 10
SendInput,{F8}me достал и включил КПК{Enter}{F8}
Sleep 10
SendInput,{F8}do КПК включен.{Enter}{F8}
Return

^vkC0:: ; Убрать КПК
Clipboard = 
SendInput,{F8}me выключил КПК и убрал в карман{Enter}{F8}
Sleep 10
SendInput,{F8}do КПК в кармане.{Enter}{F8}
Return

!1:: ; Приветствие для гражданских
Clipboard =
Rank := Data.Rank
SurName := Data.SurName
City := Data.City
SendInput,{F8}animarmy 3{Enter}{F8}
Sleep 500
SendInput,{F8}say Здравия желаю, %Rank% полиции %SurName%, сотрудник ГУ МВД по г. %City%.{Enter}{F8}
Return

^1:: ; Достать и развернуть удостоверение
Clipboard = 
Rank := Data.Rank
Name := Data.SurName " " Data.Name " " Data.SecondName
City := Data.City
Post := Data.Post
IdNumber := Data.IdNumber
SendInput,{F8}do Удостоверение лежит в нагрудном кармане.{Enter}{F8}
Sleep 500
SendInput,{F8}me достал удостоверение из нагрудного кармана и развернул его{Enter}{F8}
Sleep 500
SendInput,{F8}do [Удостоверение] %IdNumber% | %Name% | %Rank% | %Post% [%Struct%].{Enter}{F8}
Sleep 500
SendInput,{F8}do [Удостоверение] Фотография | Печать | Подись начальника ГУ МВД [%Struct%].{Enter}{F8}
Return

^vk51:: ; Закрыть и убрать удостоверение
Clipboard = 
SendInput,{F8}me закрыл удостоверение и убрал его в нагрудный карман{Enter}{F8}
Sleep 500
SendInput,{F8}do Удостоверение в нагрудном кармане.{Enter}{F8}
Return


!2:: ; Надеть наручники
Clipboard = 
InputBox pID, TechnoAHK:Input,Надеть наручники.`nВведите ID подозреваемого.
    if ErrorLevel
        Return
    Else if pID =
        Return
Sleep 10
SendInput,{F8}do Наручники закреплены на поясном ремне.{Enter}{F8}
Sleep 5
SendInput,{F8}me снял наручники с пояса и застегнул наручники за спиной у гражданина{Enter}{F8}
Sleep 5
SendInput,{F8}do Преступник в наручниках.{Enter}{F8}
Sleep 5
SendInput,{F8}cuff %pID%{Enter}{F8}
Return

^2:: ; Снять наручники
Clipboard = 
InputBox pID, TechnoAHK:Input,Снять наручники.`nВведите ID задержанного.
    if ErrorLevel
        Return
    Else if pID =
        Return
Sleep 10
SendInput,{F8}do Ключ от наручников в кармане.{Enter}{F8}
Sleep 5
SendInput,{F8}me достал ключ и снял с гражданина наручники{Enter}{F8}
Sleep 5
SendInput,{F8}do Наручники в руках сотрудника.{Enter}{F8}
Sleep 5
SendInput,{F8}me закрепил наручники за поясом и убрал ключ в карман{Enter}{F8}
Sleep 5
SendInput,{F8}do Ключ в кармане.{Enter}{F8}
Sleep 5
SendInput,{F8}uncuff %pID%{Enter}{F8}
Return

!3:: ; Начать конвоирование
Clipboard = 
InputBox pID, TechnoAHK | Input,Конвоировать задержанного [arr]. Для отмены нажмите Cancel или оставьте пустое окно.`nВведите ID задержанного.
    if ErrorLevel
        Return
    Else if pID =
        Return
Sleep 10
SendInput,{F8}me заломил нарушителю руки и повёл за собой{Enter}{F8}
Sleep 500
SendInput,{F8}do Сотрудник конвоирует задержанного.{Enter}{F8}
Sleep 500
SendInput,{F8}arr %pID%{Enter}{F8}
Return

^3:: ; Прекратить конвоирование
Clipboard = 
SendInput,{F8}me отпустил руки задержанного{Enter}{F8}
Sleep 500
SendInput,{F8}do Задержанный в наручниках.{Enter}{F8}
Sleep 500
SendInput,{F8}dearr{Enter}{F8}
Return

!vk45:: ; Посадить задержанного в авто
Clipboard = 
SendInput,{F8}say Берегите голову при посадке в автомобиль{!}{Enter}{F8}
Sleep 500
SendInput,{F8}me взял нарушителя за руки и посадил в служебный автомобиль{Enter}{F8}
Sleep 500
SendInput,{F8}do Сотрудник усадил задержанного в автомобиль.{Enter}{F8}
Return

^4:: ; Определить личность по фото
Clipboard = 
SendInput,{F8}me сделал фотографию гражданина и запросил данные{Enter}{F8}
Sleep 500
SendInput,{F8}do Данные выведены на экран КПК.{Enter}{F8}
Return

!4:: ; Запросить информацию по серии паспорта
Clipboard = 
SendInput,{F8}me запросил информацию на гражданина по серии паспорта{Enter}{F8}
Sleep 500
SendInput,{F8}do Информация выведена на экран КПК.{Enter}{F8}
Return

^5:: ; Внести ориентировку в базу данных
Clipboard = 
InputBox in, TechnoAHK | Input,Внести ориентировку в базу данных. Для отмены нажмите Cancel.`nВведите ID задержанного, срок заключения и причину без слова УПК.`nПример: 192 4 5.2; будет введено su 192 4 5.2 УПК
    if ErrorLevel
        Return
    Else if in =
        Return
Sleep 10
SendInput,{F8}me открыл базу данных преступников и внёс ориентировку{Enter}{F8}
Sleep 500
SendInput,{F8}do Ориентировка внесена в базу данных.{Enter}{F8}
Sleep 500
SendInput,{F8}su %in% УПК{Enter}{F8}
Return

!5:: ; Открыть базу данных престуников
Clipboard = 
SendInput,{F8}me открыл базу данных преступников{Enter}{F8}
Sleep 10
SendInput,{F8}do База данных преступников открыта.{Enter}{F8}
Sleep 50
SendInput,{F8}wanted{Enter}{F8}
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

^7:: ; Попросить документы
Clipboard = 
SendInput,{F8}say Передайте ваш паспорт.{Enter}{F8}
Sleep 500
SendInput,{F8}b /me передал паспорт{Enter}{F8}
Sleep 500
SendInput,{F8}b /pass id (id = цифры после ника){Enter}{F8}
Return

!7:: ; Открыть базу данных камер видеонаблюдения
Clipboard = 
SendInput,{F8}me открыл базу данных камер видеонаблюдения{Enter}{F8}
Sleep 10
SendInput,{F8}do Изображения с камер транслируются в реальном времени на КПК.{Enter}{F8}
Return

^8:: ; Взять документы
Clipboard = 
SendInput,{F8}me протянул правую руку и взял документы гражданина{Enter}{F8}
Sleep 500
SendInput,{F8}do Документы в руке.{Enter}{F8}
Sleep 500
SendInput,{F8}me детально изучил документы гражданина{Enter}{F8}
Sleep 500
SendInput,{F8}do Документы изучены сотрудником.{Enter}{F8}
Return

!8:: ; Вернуть документы
Clipboard = 
SendInput,{F8}me вернул гражданину документы{Enter}{F8}
Sleep 500
SendInput,{F8}do Рука с документами протянута.{Enter}{F8}
Return

^9:: ; Составление протокола задержания
Clipboard = 
SendInput,{F8}say Гражданин, сейчас мы составим протокол Вашего задержания.{Enter}{F8}
Sleep 500
SendInput,{F8}do На плече полицейского висит сумка.{Enter}{F8}
Sleep 500
SendInput,{F8}me открыл сумку и достал бланк протокола с ручкой{Enter}{F8}
Sleep 500
SendInput,{F8}do Протокол с ручкой в руке.{Enter}{F8}
Sleep 500
SendInput,{F8}me заполнил протокол задержания{Enter}{F8}
Sleep 500
SendInput,{F8}do Протокол задержания заполнен.{Enter}{F8}
Sleep 500
SendInput,{F8}me поставил галочку о невозможности получения подписи обвиняемого{Enter}{F8}
Sleep 500
SendInput,{F8}do Галочка поставлена.{Enter}{F8}
Return

!9:: ; Чистосердечное признание
Clipboard = 
SendInput,{F8}do На столе лежат бланки и ручка.{Enter}{F8}
Sleep 500
SendInput,{F8}me взял бланк и ручку и положил перед гражданином{Enter}{F8}
Sleep 500
SendInput,{F8}do Бланк и ручка лежат перед гражданином.{Enter}{F8}
Sleep 500
SendInput,{F8}say Вот бланк для чистосердечного признания. Распишите все подробно.{Enter}{F8}
Return

^0:: ; Передать задержанного конвоиру
Clipboard = 
InputBox, pID, TechnoAHK:Input,Сдать задержанного конвоиру. Введите ID задержанного.
    if ErrorLevel
        Return
    Else if pID =
        Return
Sleep 10
SendInput,{F8}do Рация закреплена на нагрудном кармане.{Enter}{F8}
Sleep 100
SendInput,{F8}me снял рацию и зажал кнопку переговоров{Enter}{F8}
Sleep 100
SendInput,{F8}do Рация в режиме радиовещания.{Enter}{F8}
Sleep 500
SendInput,{F8}me вызвал конвоира{Enter}{F8}
Sleep 500
SendInput,{F8}do Конвоир подошел к задержанному.{Enter}{F8}
Sleep 500
SendInput,{F8}r %id% 02-03{Enter}{F8}
Sleep 500
SendInput,{F8}me отпустил кнопку и закрепил рацию на нагрудном кармане{Enter}{F8}
Sleep 500
SendInput,{F8}do Рация закреплена на нагрудном кармане.{Enter}{F8}
Sleep 500
SendInput,{F8}do Конвоир подошел к задержанному.{Enter}{F8}
Sleep 500
SendInput,{F8}say Уведите.{Enter}{F8}
Sleep 500
SendInput,{F8}do Конвоир увел задержанного.{Enter}{F8}
Sleep 500
SendInput,{F8}arrest %pID%{Enter}{F8}
Return

^-:: ; Достать рацию
Clipboard = 
SendInput,{F8}do Рация закреплена на нагрудном кармане.{Enter}{F8}
Sleep 5
SendInput,{F8}me снял рацию и зажал кнопку переговоров{Enter}{F8}
Sleep 5
SendInput,{F8}do Рация в режиме радиовещания.{Enter}{F8}
Sleep 5
SendInput,{F8}fracvoice 1{Enter}{F8}
Return

^=:: ; Убрать рацию
Clipboard = 
SendInput,{F8}me отпустил кнопку и закрепил рацию на нагрудном кармане{Enter}{F8}
Sleep 5
SendInput,{F8}do Рация закреплена на нагрудном кармане.{Enter}{F8}
Sleep 5
SendInput,{F8}fracvoice 0{Enter}{F8}
Return


^Numpad4:: ; Требование уступить дорогу служебному автомобилю
Clipboard = 
SendInput,{F8}do Тангета закреплена на торпеде.{Enter}{F8}
Sleep 5
SendInput,{F8}me снял тангету и зажал кнопку звукоусиления{Enter}{F8}
Sleep 5
SendInput,{F8}do СГУ в режиме звукоусиления.{Enter}{F8}
Sleep 5
SendInput,{F8}s {#}4169DF[Мегафон]: {#}00FF00Уступите дорогу служебному автомобилю{!}{Enter}{F8}
Sleep 5
SendInput,{F8}me отпустил кнопку и повесил тангету на крепление{Enter}{F8}
Sleep 5
SendInput,{F8}do Тангета на торпеде.{Enter}{F8}
Return

^Numpad5:: ; Движется организованная колонна
Clipboard = 
SendInput,{F8}do Тангета закреплена на торпеде.{Enter}{F8}
Sleep 5
SendInput,{F8}me снял тангету и зажал кнопку звукоусиления{Enter}{F8}
Sleep 5
SendInput,{F8}do СГУ в режиме звукоусиления.{Enter}{F8}
Sleep 5
SendInput,{F8}s {#}4169DF[Мегафон]: {#}FF0000Водители, внимание{!} Движется организованная колонна, останавливаемся{!}{Enter}{F8}
Sleep 5
SendInput,{F8}me отпустил кнопку и повесил тангету на крепление{Enter}{F8}
Sleep 5
SendInput,{F8}do Тангета на торпеде.{Enter}{F8}
Return

^Numpad6:: ; Организованная колонна проехала
Clipboard = 
SendInput,{F8}do Тангета закреплена на торпеде.{Enter}{F8}
Sleep 5
SendInput,{F8}me снял тангету и зажал кнопку звукоусиления{Enter}{F8}
Sleep 5
SendInput,{F8}do СГУ в режиме звукоусиления.{Enter}{F8}
Sleep 5
SendInput,{F8}s {#}4169DF[Мегафон]: {#}FF0000Водители, внимание{!} Продолжаем движение{!} Организованная колонна проехала{!}{Enter}{F8}
Sleep 5
SendInput,{F8}me отпустил кнопку и повесил тангету на крепление{Enter}{F8}
Sleep 5
SendInput,{F8}do Тангета на торпеде.{Enter}{F8}
Return

^Numpad7::  ; Требование об остановке (1-й пред)[Зеленый]
Clipboard = 
SendInput,{F8}do Тангета закреплена на торпеде.{Enter}{F8}
Sleep 5
SendInput,{F8}me снял тангету и зажал кнопку звукоусиления{Enter}{F8}
Sleep 5
SendInput,{F8}do СГУ в режиме звукоусиления.{Enter}{F8}
Sleep 5
SendInput,{F8}s {#}4169DF[Мегафон]: {#}00FF00Водитель, принимаем крайнее правое положение и останавливаемся{!}{Enter}{F8}
Sleep 5
SendInput,{F8}me отпустил кнопку и повесил тангету на крепление{Enter}{F8}
Sleep 5
SendInput,{F8}do Тангета на торпеде.{Enter}{F8}
Return

^Numpad8::  ; Повторное требование об остановке (2-й пред)[Желтый]
Clipboard = 
SendInput,{F8}do Тангета закреплена на торпеде.{Enter}{F8}
Sleep 5
SendInput,{F8}me снял тангету и зажал кнопку звукоусиления{Enter}{F8}
Sleep 5
SendInput,{F8}do СГУ в режиме звукоусиления.{Enter}{F8}
Sleep 5
SendInput,{F8}s {#}4169DF[Мегафон]: {#}EEF20BПовторяю, водитель, примите вправо и остановитесь{!}{Enter}{F8}
Sleep 5
SendInput,{F8}me отпустил кнопку и повесил тангету на крепление{Enter}{F8}
Sleep 5
SendInput,{F8}do Тангета на торпеде.{Enter}{F8}
Return

^Numpad9::  ; Предупреждение об открытии огня при погоне (3-й пред)[Красный]
Clipboard = 
SendInput,{F8}do Тангета закреплена на торпеде.{Enter}{F8}
Sleep 5
SendInput,{F8}me снял тангету и зажал кнопку звукоусиления{Enter}{F8}
Sleep 5
SendInput,{F8}do СГУ в режиме звукоусиления.{Enter}{F8}
Sleep 5
SendInput,{F8}s {#}4169DF[Мегафон]: {#}FF0000Останавливаемся{!} Повторяю, останавливаемся{!} Начинаем огонь на поражение{!}{Enter}{F8}
Sleep 5
SendInput,{F8}me отпустил кнопку и повесил тангету на крепление{Enter}{F8}
Sleep 5
SendInput,{F8}do Тангета на торпеде.{Enter}{F8}
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

!Numpad3:: ; Отправить кастомное сообщение в мегафон
Clipboard = 
InputBox msg, TechnoAHK:Input,Отправить кастомное сообщение в мегафон. Необходимо ввести только сообщение в поле ниже.
    if ErrorLevel
        Return
    Else if pID =
        Return
Sleep 10
SendInput,{F8}do Тангета закреплена на торпеде.{Enter}{F8}
Sleep 5
SendInput,{F8}me снял тангету и зажал кнопку звукоусиления{Enter}{F8}
Sleep 5
SendInput,{F8}do СГУ в режиме звукоусиления.{Enter}{F8}
Sleep 5
SendInput,{F8}s {#}4169DF[Мегафон]: {#}00FF00%msg%{Enter}{F8}
Sleep 5
SendInput,{F8}me отпустил кнопку и повесил тангету на крепление{Enter}{F8}
Sleep 5
SendInput,{F8}do Тангета на торпеде.{Enter}{F8}
Return

!Numpad4:: ; Требование об остановке автомобилю с гос. номером (вводится)
Clipboard = 
InputBox statemark, TechnoAHK:Input,Требование об остановке автомобилю с гос. номером.`nВведите гос. номер в поле ниже.
    if ErrorLevel
        Return
    Else if pID =
        Return
Sleep 10
SendInput,{F8}do Тангета закреплена на торпеде.{Enter}{F8}
Sleep 5
SendInput,{F8}me снял тангету и зажал кнопку звукоусиления{Enter}{F8}
Sleep 5
SendInput,{F8}do СГУ в режиме звукоусиления.{Enter}{F8}
Sleep 5
SendInput,{F8} s {#}4169DF[Мегафон]: {#}00FF00Водитель авто с гос. номером %statemark%, прижмитесь к обочине и остановитесь{!}{Enter}{F8}
Sleep 5
SendInput,{F8}me отпустил кнопку и повесил тангету на крепление{Enter}{F8}
Sleep 5
SendInput,{F8}do Тангета на торпеде.{Enter}{F8}
Return

!Numpad5:: ; Требование выйти из машины и положить руки на капот
Clipboard = 
SendInput,{F8}s {#}FF0000Из машины, руки на капот{!}{Enter}{F8}
Return

!Numpad6:: ; Предупреждение об открытии огня при пешей погоне
Clipboard = 
SendInput,{F8}s {#}00FF00Стоять, руки вверх{!} {#}FF0000Буду стрелять по ногам{!}{Enter}{F8}
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

!Numpad9:: ; Открыть замок изнутри автомобиля (окно открыто или разбито)
Clipboard = 
SendInput,{F8}me потянулся рукой до замка и открыл его изнутри{Enter}{F8}
Sleep 10
SendInput,{F8}do Замок открыт.{Enter}{F8}
Sleep 10
SendInput,{F8}me открыл дверь и вытащил гражданина из машины{Enter}{F8}
Sleep 10
SendInput,{F8}do Гражданин на улице.{Enter}{F8}
Return

^vkBC:: ; Достать дубинку
Clipboard = 
SendInput,{F8}do Полицейская дубинка закреплена на поясе.{Enter}{F8}
Sleep 10
SendInput,{F8}me снял дубинку{Enter}{F8}
Sleep 10
SendInput,{F8}do Дубинка в руках.{Enter}{F8}
Return

^vkBE:: ; Убрать дубинку
Clipboard = 
SendInput,{F8}me закрепил дубинку на поясе{Enter}{F8}
Sleep 10
SendInput,{F8}do Дубинка на поясе.{Enter}{F8}
Return

!vkBC:: ; Приготовить электрошокер к использованию
Clipboard = 
SendInput,{F8}do Электрошокер Taser c гравировкой закреплен в кобуре.{Enter}{F8}
Sleep 10
SendInput,{F8}me резким движением выхватил электрошокер из кобуры и приготовил к использованию{Enter}{F8}
Sleep 10
SendInput,{F8}do Электрошокер Taser готов к использованию.{Enter}{F8}
Return

!vkBE:: ; Убрать электрошокер
Clipboard = 
SendInput,{F8}me убрал электрошокер в кобуру{Enter}{F8}
Sleep 10
SendInput,{F8}do Электрошокер Taser в кобуре.{Enter}{F8}
Return

^vkBA:: ; Приготовить ПМ к стрельбе [Пистолет]
Clipboard = 
SendInput,{F8}do Пистолет Макарова c гравировкой лежит в кобуре.{Enter}{F8}
Sleep 10
SendInput,{F8}me резким движением выхватил пистолет из кобуры и приготовил к стрельбе{Enter}{F8}
Sleep 10
SendInput,{F8}do Пистолет Макарова готов к стрельбе.{Enter}{F8}
Return

^vkDE:: ; Убрать ПМ [Пистолет]
Clipboard = 
SendInput,{F8}me поставил пистолет на предохранитель и убрал его в кобуру{Enter}{F8}
Sleep 10
SendInput,{F8}do Пистолет Макарова лежит в кобуре.{Enter}{F8}
Return

!vkBA:: ; Приготовить АКС-74У к стрельбе [АК-47]
Clipboard = 
SendInput,{F8}do АКС-74У c гравировкой висит на плече.{Enter}{F8}
Sleep 10
SendInput,{F8}me скинул АКС-74У c плеча и снял с предохранителя{Enter}{F8}
Sleep 10
SendInput,{F8}do АКС-74У готов к стрельбе.{Enter}{F8}
Return

!vkDE:: ; Убрать АКС-74У [АК-47]
Clipboard = 
SendInput,{F8}me поставил АКС-74У на предохранитель и повесил на плечо{Enter}{F8}
Sleep 10
SendInput,{F8}do АКС-74У висит на плече.{Enter}{F8}
Return

^vkBF:: ; Приготовить карабин КСА к стрельбе [Дробовик]
Clipboard = 
SendInput,{F8}do Карабин КСА c гравировкой висит на плече.{Enter}{F8}
Sleep 10
SendInput,{F8}me скинул карабин КСА и снял с предохранителя{Enter}{F8}
Sleep 10
SendInput,{F8}do Карабин КСА готов к стрельбе.{Enter}{F8}
Return

^vkDC:: ; Убрать карабин КСА [Дробовик]
Clipboard = 
SendInput,{F8}me поставил карабин КСА на предохранитель и повесил на плечо{Enter}{F8}
Sleep 10
SendInput,{F8}do Карабин КСА висит на плече.{Enter}{F8}
Return