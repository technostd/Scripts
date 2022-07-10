^end::
	ExitApp
Return

!end::pause

^F1::
Run,C:\Scripts\gui.ahk
ExitApp
Return

!`:: ; Достать КПК
SendInput,{F8}do КПК лежит в кармане.{Enter}{F8}
Sleep 10
SendInput,{F8}me достал и включил КПК{Enter}{F8}
Sleep 10
SendInput,{F8}do КПК включен.{Enter}{F8}
Return

^`:: ; Убрать КПК
SendInput,{F8}me выключил КПК и убрал в карман{Enter}{F8}
Sleep 10
SendInput,{F8}do КПК в кармане.{Enter}{F8}
Return

!1:: ; Приветствие для гражданских
SendInput,{F8}animarmy 3{Enter}{F8}
Sleep 10
SendInput,{F8}say Здравия желаю! Рядовой Учебного батальона,  Сергей Серогов. {Enter}{F8}
Return

^1:: ; Достать и развернуть удостоверение
SendInput,{F8}do На нашивке военнослужащего надпись [Серогов С.С.], на шевроне - [Учебный батальон].{Enter}{F8}
Return

!2:: ; Надеть наручники
SendInput,{F8}c cuff{Space}
Input, var, v,{Enter}
Sleep 10
SendInput,do Наручники закреплены на поясном ремне.{Enter}{F8}
Sleep 5
SendInput,{F8}me сняв наручники с пояса, завел руки преступника за спину и надел на него наручники{Enter}{F8}
Sleep 5
SendInput,{F8}do Преступник в наручниках.{Enter}{F8}
Sleep 5
SendInput,{F8}cuff %var%{Enter}{F8}
Return

^2:: ; Снять наручники
SendInput,{F8}c uncuff{Space}
Input, var, v,{Enter}
Sleep 10
SendInput,do Ключ от наручников в кармане.{Enter}{F8}
Sleep 5
SendInput,{F8}me достав ключ, снял с гражданина наручники и закрепил их за поясом{Enter}{F8}
Sleep 5
SendInput,{F8}do Наручники закреплены на поясном ремне.{Enter}{F8}
Sleep 5
SendInput,{F8}me убрал ключ в карман{Enter}{F8}
Sleep 5
SendInput,{F8}do Ключ в кармане.{Enter}{F8}
Sleep 5
SendInput,{F8}uncuff %var%{Enter}{F8}
Return

^3::
SendInput,{F8}say Цель вашего визита на территорию воинской части?{Enter}{F8}
Return

!e::
SendInput,{F8}say Берегите голову при посадке в автомобиль{!}{Enter}{F8}
Sleep 500
SendInput,{F8}me взял нарушителя за руки и увел в служебный автомобиль{Enter}{F8}
Sleep 500
SendInput,{F8}do Сотрудник усадил нарушителя на заднее сиденье.{Enter}{F8}
Return

^4:: ; Определить личность по фото
SendInput,{F8}me сделал фотографию гражданина и запросил данные{Enter}{F8}
Sleep 500
SendInput,{F8}do Данные выведены на экран КПК.{Enter}{F8}
Return

!4:: ; Запросить информацию по серии паспорта
SendInput,{F8}me запросил информацию на гражданина по серии паспорта{Enter}{F8}
Sleep 500
SendInput,{F8}do Информация выведена на экран КПК.{Enter}{F8}
Return

^5:: ; Внести ориентировку в базу данных
SendInput,{F8}c su{Space}
Input, var, v,{Enter}
Sleep 10
SendInput,me открыл базу данных преступников и внёс ориентировку{Enter}{F8}
Sleep 500
SendInput,{F8}do Ориентировка внесена в базу данных.{Enter}{F8}
Sleep 500
SendInput,{F8}su %var% УПК{Enter}{F8}
Return

!5:: ; Открыть базу данных престуников
SendInput,{F8}me открыл базу данных преступников{Enter}{F8}
Sleep 10
SendInput,{F8}do База данных преступников открыта.{Enter}{F8}
Sleep 50
SendInput,{F8}wanted{Enter}{F8}
Return

^6:: ; Выдать "ТР"
SendInput,{F8}c su{Space}
Input, var, v,{Enter}
Sleep 10
SendInput,su %var% 1 TP{Enter}{F8}
Return

!6:: ; Выдать "ТР" с отпиской в /rob
SendInput,{F8}c su{Space}
Input, var, v,{Enter}
Sleep 10
SendInput,su %var% 1 TP{Enter}{F8}
Sleep 10
SendInput,{F8}rob %var%{+}{Enter}{F8}
Return

^7:: ; Попросить документы
SendInput,{F8}say Гражданин, пожалуйста, предъявите Ваши документы на проверку.{Enter}{F8}
Sleep 500
SendInput,{F8}b [Совет]: Чтобы передать документ - /me передал документ | /pass [ID].{Enter}{F8}
Return

!7:: ; Открыть базу данных камер видеонаблюдения
SendInput,{F8}me открыл базу данных камер видеонаблюдения{Enter}{F8}
Sleep 10
SendInput,{F8}do Изображения с камер транслируются в реальном времени на КПК.{Enter}{F8}
Return

^8:: ; Взять документы
SendInput,{F8}me протянул правую руку и взял документы гражданина{Enter}{F8}
Sleep 500
SendInput,{F8}do Документы в руке.{Enter}{F8}
Sleep 500
SendInput,{F8}me детально изучил документы гражданина{Enter}{F8}
Sleep 500
SendInput,{F8}do Документы изучены сотрудником.{Enter}{F8}
Return

!8:: ; Вернуть документы
SendInput,{F8}me вернул гражданину документы{Enter}{F8}
Sleep 500
SendInput,{F8}do Рука с документами протянута.{Enter}{F8}
Return

^9:: ; Составление протокола задержания
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
SendInput,{F8}do На столе лежат бланки и ручка.{Enter}{F8}
Sleep 500
SendInput,{F8}me взял бланк и ручку и положил перед гражданином{Enter}{F8}
Sleep 500
SendInput,{F8}do Бланк и ручка лежат перед гражданином.{Enter}{F8}
Sleep 500
SendInput, {F8}say Распишите все подробно.{Enter}{F8}
Return

^0:: ; Передать задержанного конвоиру
SendInput,{F8}c arrest{Space}
Input, var, v,{Enter}
Sleep 10
SendInput,do Рация закреплена на нагрудном кармане.{Enter}{F8}
Sleep 100
SendInput,{F8}me снял рацию и зажал кнопку переговоров{Enter}{F8}
Sleep 100
SendInput,{F8}do Рация в режиме радиовещания.{Enter}{F8}
Sleep 500
SendInput,{F8}me вызвал конвоира{Enter}{F8}
Sleep 500
SendInput,{F8}do Конвоир подошел к задержанному.{Enter}{F8}
Sleep 500
SendInput,{F8}r УР-16 02-03{Enter}{F8}
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
SendInput,{F8}arrest %var%{Enter}{F8}
Return

^-:: ; Достать рацию
SendInput,{F8}do Рация закреплена на нагрудном кармане.{Enter}{F8}
Sleep 5
SendInput,{F8}me снял рацию и зажал кнопку переговоров{Enter}{F8}
Sleep 5
SendInput,{F8}do Рация в режиме радиовещания.{Enter}{F8}
Sleep 5
SendInput,{F8}fracvoice 1{Enter}{F8}
Return

^=:: ; Убрать рацию
SendInput,{F8}me отпустил кнопку и закрепил рацию на нагрудном кармане{Enter}{F8}
Sleep 5
SendInput,{F8}do Рация закреплена на нагрудном кармане.{Enter}{F8}
Sleep 5
SendInput,{F8}fracvoice 0{Enter}{F8}
Return


^Numpad4:: ; Требование уступить дорогу служебному автомобилю
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

^Numpad7:: ; Требование об остановке (1-й пред)[Зеленый]
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

^Numpad8:: ; Повторное требование об остановке (2-й пред)[Желтый]
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

^Numpad9:: ; Предупреждение об открытии огня при погоне (3-й пред)[Красный]
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

!Numpad1:: ; Принять запрос от ГИБДД-<Город>
SendInput,{F8}c Город:{Space}
Input, var, v,{Enter}
Sleep 10
SendInput,ro [ГУ МВД-М][ГИБДД-%var%] Принято.{Enter}{F8}
Return

!Numpad2:: ; Отправить запрос на экипаж ДПС к <Местоположение>
SendInput,{F8}c Местоположение:{Space}
Input, var, v,{Enter}
Sleep 10
SendInput,ro [ГУ МВД-М][ГИБДД] Требуется экипаж ДПС. Местоположение: %var%.{Enter}{F8}
Return

!Numpad3:: ; Отправить кастомное сообщение в мегафон
InputBox, var, TechnoAHK:Input,Отправить кастомное сообщение в мегафон. Необходимо ввести только сообщение в поле ниже.
Sleep 10
SendInput,{F8}do Тангета закреплена на торпеде.{Enter}{F8}
Sleep 5
SendInput,{F8}me снял тангету и зажал кнопку звукоусиления{Enter}{F8}
Sleep 5
SendInput,{F8}do СГУ в режиме звукоусиления.{Enter}{F8}
Sleep 5
SendInput,{F8}s {#}4169DF[Мегафон]: {#}00FF00%var%{Enter}{F8}
Sleep 5
SendInput,{F8}me отпустил кнопку и повесил тангету на крепление{Enter}{F8}
Sleep 5
SendInput,{F8}do Тангета на торпеде.{Enter}{F8}
Return

!Numpad4:: ; Требование об остановке автомобилю с гос. номером (вводится)
InputBox, var, Input,Введите номера
Sleep 10
SendInput,{F8}do Тангета закреплена на торпеде.{Enter}{F8}
Sleep 5
SendInput,{F8}me снял тангету и зажал кнопку звукоусиления{Enter}{F8}
Sleep 5
SendInput,{F8}do СГУ в режиме звукоусиления.{Enter}{F8}
Sleep 5
SendInput,{F8} s {#}4169DF[Мегафон]: {#}00FF00Водитель авто с гос. номером %var%, прижмитесь к обочине и остановитесь{!}{Enter}{F8}
Sleep 5
SendInput,{F8}me отпустил кнопку и повесил тангету на крепление{Enter}{F8}
Sleep 5
SendInput,{F8}do Тангета на торпеде.{Enter}{F8}
Return

!Numpad5:: ; Требование выйти из машины и положить руки на капот
SendInput,{F8}s {#}FF0000Из машины, руки на капот{!}{Enter}{F8}
Return

!Numpad6:: ; Предупреждение об открытии огня при пешей погоне
SendInput,{F8}s {#}00FF00Стоять, руки вверх{!} {#}FF0000Буду стрелять по ногам{!}{Enter}{F8}
Return

!Numpad7:: ; Попытаться открыть дверь
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
SendInput,{F8}me потянулся рукой до замка и открыл его изнутри{Enter}{F8}
Sleep 10
SendInput,{F8}do Замок открыт.{Enter}{F8}
Sleep 10
SendInput,{F8}me открыл дверь и вытащил гражданина из машины{Enter}{F8}
Sleep 10
SendInput,{F8}do Гражданин на улице.{Enter}{F8}
Return

^,:: ; Достать дубинку
SendInput,{F8}do Полицейская дубинка закреплена на поясе.{Enter}{F8}
Sleep 10
SendInput,{F8}me снял дубинку{Enter}{F8}
Sleep 10
SendInput,{F8}do Дубинка в руках.{Enter}{F8}
Return

^.:: ; Убрать дубинку
SendInput,{F8}me закрепил дубинку на поясе{Enter}{F8}
Sleep 10
SendInput,{F8}do Дубинка на поясе.{Enter}{F8}
Return

!,:: ; Приготовить электрошокер к использованию
SendInput,{F8}do Электрошокер Taser c гравировкой закреплен в кобуре.{Enter}{F8}
Sleep 10
SendInput,{F8}me резким движением выхватил электрошокер из кобуры и приготовил к использованию{Enter}{F8}
Sleep 10
SendInput,{F8}do Электрошокер Taser готов к использованию.{Enter}{F8}
Return

!.:: ; Убрать электрошокер
SendInput,{F8}me убрал электрошокер в кобуру{Enter}{F8}
Sleep 10
SendInput,{F8}do Электрошокер Taser в кобуре.{Enter}{F8}
Return

^;:: ; Приготовить ПМ к стрельбе [Пистолет]
SendInput,{F8}do Пистолет Макарова c гравировкой лежит в кобуре.{Enter}{F8}
Sleep 10
SendInput,{F8}me резким движением выхватил пистолет из кобуры и приготовил к стрельбе{Enter}{F8}
Sleep 10
SendInput,{F8}do Пистолет Макарова готов к стрельбе.{Enter}{F8}
Return

^':: ; Убрать ПМ [Пистолет]
SendInput,{F8}me поставил пистолет на предохранитель и убрал его в кобуру{Enter}{F8}
Sleep 10
SendInput,{F8}do Пистолет Макарова лежит в кобуре.{Enter}{F8}
Return

!;:: ; Приготовить АКС-74У к стрельбе [АК-47]
SendInput,{F8}do АКС-74У c гравировкой висит на плече.{Enter}{F8}
Sleep 10
SendInput,{F8}me скинул АКС-74У c плеча и снял с предохранителя{Enter}{F8}
Sleep 10
SendInput,{F8}do АКС-74У готов к стрельбе.{Enter}{F8}
Return

!':: ; Убрать АКС-74У [АК-47]
SendInput,{F8}me поставил АКС-74У на предохранитель и повесил на плечо{Enter}{F8}
Sleep 10
SendInput,{F8}do АКС-74У висит на плече.{Enter}{F8}
Return

^/:: ; Приготовить карабин КСА к стрельбе [Дробовик]
SendInput,{F8}do Карабин КСА c гравировкой висит на плече.{Enter}{F8}
Sleep 10
SendInput,{F8}me скинул карабин КСА и снял с предохранителя{Enter}{F8}
Sleep 10
SendInput,{F8}do Карабин КСА готов к стрельбе.{Enter}{F8}
Return

^\:: ; Убрать карабин КСА [Дробовик]
SendInput,{F8}me поставил карабин КСА на предохранитель и повесил на плечо{Enter}{F8}
Sleep 10
SendInput,{F8}do Карабин КСА висит на плече.{Enter}{F8}
Return