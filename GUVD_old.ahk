^end::
	ExitApp
Return

!end::pause

!`::
SendInput,{F8}do КПК лежит в кармане.{Enter}{F8}
Sleep 10
SendInput,{F8}me достал и включил КПК{Enter}{F8}
Sleep 10
SendInput,{F8}do КПК включен.{Enter}{F8}
Return

^`::
SendInput,{F8}me выключил КПК и убрал в карман{Enter}{F8}
Sleep 10
SendInput,{F8}do КПК в кармане.{Enter}{F8}
Return

!1::
SendInput,{F8}animarmy 3{Enter}{F8}
Sleep 500
SendInput,{F8}say Здравия желаю, Рядовой Загорецкий, сотрудник ГУ МВД по г. Мирный.{Enter}{F8}
Return

^1::
SendInput,{F8}do Удостоверение лежит в нагрудном кармане.{Enter}{F8}
Sleep 500
SendInput,{F8}me достал удостоверение из нагрудного кармана и развернул его{Enter}{F8}
Sleep 500
SendInput,{F8}do [Удостоверение] УР-16 | Загорецкий Артём Сергеевич | Рядовой | Курсант УЦР [ГУ МВД по г. Мирный и МО].{Enter}{F8}
Sleep 500
SendInput,{F8}do [Удостоверение] Фотография | Печать | Подись начальника ГУ МВД [ГУ МВД по г. Мирный и МО].{Enter}{F8}
Return

^q::
SendInput,{F8}me закрыл удостоверение и убрал его в нагрудный карман{Enter}{F8}
Sleep 500
SendInput,{F8}do Удостоверение в нагрудном кармане.{Enter}{F8}
Return


!2::
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

^2::
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

!3::
SendInput,{F8}c arr{Space}
Input, var, v,{Enter}
Sleep 10
SendInput,me заломил нарушителю руки и повёл за собой{Enter}{F8}
Sleep 500
SendInput,{F8}do Сотрудник конвоирует задержанного.{Enter}{F8}
Sleep 500
SendInput,{F8}arr %var%{Enter}{F8}
Return

^3::
SendInput,{F8}c dearr{Space}
Input, var, v,{Enter}
Sleep 10
SendInput,me отпустил руки задержанного{Enter}{F8}
Sleep 500
SendInput,{F8}do Задержанный в наручниках.{Enter}{F8}
Sleep 500
SendInput,{F8}dearr %var%{Enter}{F8}
Return

^4::
SendInput,{F8}me сделал фотографию гражданина и запросил данные{Enter}{F8}
Sleep 500
SendInput,{F8}do Данные выведены на экран КПК.{Enter}{F8}
Return

!4::
SendInput,{F8}me запросил информацию на гражданина по серии паспорта{Enter}{F8}
Sleep 500
SendInput,{F8}do Информация выведена на экран КПК.{Enter}{F8}
Return

^5::
SendInput,{F8}c su{Space}
Input, var, v,{Enter}
Sleep 10
SendInput,me открыл базу данных преступников и внёс ориентировку{Enter}{F8}
Sleep 500
SendInput,{F8}do Ориентировка внесена в базу данных.{Enter}{F8}
Sleep 500
SendInput,{F8}su %var% УПК{Enter}{F8}
Return

!5::
SendInput,{F8}me открыл базу данных преступников{Enter}{F8}
Sleep 10
SendInput,{F8}do База данных преступников открыта.{Enter}{F8}
Sleep 10
SendInput,{F8}wanted{Enter}{F8}
Return

^6::
SendInput,{F8}c su{Space}
Input, var, v,{Enter}
Sleep 10
SendInput,su %var% 1 TP{Enter}{F8}
Return

!6::
SendInput,{F8}c su{Space}
Input, var, v,{Enter}
Sleep 10
SendInput,su %var% 1 TP{Enter}{F8}
Sleep 10
SendInput,{F8}rob %var%{+}{Enter}{F8}
Return

^7::
SendInput,{F8}say Передайте ваш паспорт.{Enter}{F8}
Sleep 500
SendInput,{F8}b /me передал паспорт{Enter}{F8}
Sleep 500
SendInput,{F8}b /pass id (id = цифры после ника){Enter}{F8}
Return

!7::
SendInput,{F8}me открыл базу данных камер видеонаблюдения{Enter}{F8}
Sleep 10
SendInput,{F8}do Изображения с камер транслируются в реальном времени на КПК.{Enter}{F8}
Return

^8::
SendInput,{F8}me протянул правую руку и взял документы гражданина{Enter}{F8}
Sleep 500
SendInput,{F8}do Документы в руке.{Enter}{F8}
Sleep 500
SendInput,{F8}me детально изучил документы гражданина{Enter}{F8}
Sleep 500
SendInput,{F8}do Документы изучены сотрудником.{Enter}{F8}
Return

!8::
SendInput,{F8}me вернул гражданину документы{Enter}{F8}
Sleep 500
SendInput,{F8}do Рука с документами протянута.{Enter}{F8}
Return

^9::
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
Return

!9::
SendInput,{F8}do На столе лежат бланки и ручка.{Enter}{F8}
Sleep 500
SendInput,{F8}me взял бланк и ручку и положил перед гражданином{Enter}{F8}
Sleep 500
SendInput,{F8}do Бланк и ручка лежат перед гражданином.{Enter}{F8}
Sleep 500
SendInput, {F8}say Распишите все подробно.{Enter}{F8}
Return

^0::
SendInput,{F8}c arrest{Space}
Input, var, v,{Enter}
Sleep 10
SendInput,do Гарнитура радиопередатчика готова к использованию.{Enter}{F8}
Sleep 100
SendInput,{F8}me нажал кнопку на гарнитуре{Enter}{F8}
Sleep 100
SendInput,{F8}do Гарнитура в режиме радиовещания.{Enter}{F8}
Sleep 500
SendInput,{F8}me вызвал конвоира{Enter}{F8}
Sleep 500
SendInput,{F8}r СО-16 02-03{Enter}{F8}
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

^-::
SendInput,{F8}do Рация закреплена на нагрудном кармане.{Enter}{F8}
Sleep 5
SendInput,{F8}me снял рацию и зажал кнопку переговоров{Enter}{F8}
Sleep 5
SendInput,{F8}do Рация в режиме радиовещания.{Enter}{F8}
Sleep 5
SendInput,{F8}fracvoice 1{Enter}{F8}
Return

^=::
SendInput,{F8}me отпустил кнопку и закрепил рацию на нагрудном кармане{Enter}{F8}
Sleep 5
SendInput,{F8}do Рация закреплена на нагрудном кармане.{Enter}{F8}
Sleep 5
SendInput,{F8}fracvoice 0{Enter}{F8}
Return


^Numpad4::
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

^Numpad5::
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

^Numpad6::
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

^Numpad7::
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

^Numpad8::
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

^Numpad9::
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

!Numpad1::
SendInput,{F8}c Город:{Space}
Input, var, v,{Enter}
Sleep 10
SendInput,ro [ГУ МВД-М][ГИБДД-%var%] Принято.{Enter}{F8}
Return

!Numpad2::
SendInput,{F8}c Местоположение:{Space}
Input, var, v,{Enter}
Sleep 10
SendInput,ro [ГУ МВД-М][ГИБДД] Требуется экипаж ДПС. Местоположение: %var%.{Enter}{F8}
Return

!Numpad3::
SendInput,{F8}{Enter}{F8}
Return

!Numpad4::
SendInput,{F8}{Enter}{F8}
Return

!Numpad5::
SendInput,{F8}s {#}FF0000Из машины, руки на капот{!}{Enter}{F8}
Return

!Numpad6::
SendInput,{F8}s {#}00FF00Стоять, руки вверх{!} {#}FF0000Буду стрелять по ногам{!}{Enter}{F8}
Return

!Numpad7::
SendInput,{F8}me дёрнул за ручку двери{Enter}{F8}
Sleep 10
SendInput,{F8}do Сотрудник пытается открыть дверь.{Enter}{F8}
Sleep 10
SendInput,{F8}try открыл дверь{Enter}{F8}
Return

!Numpad8::
SendInput,{F8}me замахнулся дубинкой и ударил по стеклу{Enter}{F8}
Sleep 10
SendInput,{F8}do Удар.{Enter}{F8}
Sleep 10
SendInput,{F8}try разбил стекло дубинкой{Enter}{F8}
Return

!Numpad9::
SendInput,{F8}me потянулся рукой до замка и открыл его изнутри{Enter}{F8}
Sleep 10
SendInput,{F8}do Замок открыт.{Enter}{F8}
Sleep 10
SendInput,{F8}me открыл дверь и вытащил гражданина из машины{Enter}{F8}
Sleep 10
SendInput,{F8}do Гражданин на улице.{Enter}{F8}
Return

^,::
SendInput,{F8}do Полицейская дубинка закреплена на поясе.{Enter}{F8}
Sleep 10
SendInput,{F8}me снял дубинку{Enter}{F8}
Sleep 10
SendInput,{F8}do Дубинка в руках.{Enter}{F8}
Return

^.::
SendInput,{F8}me закрепил дубинку на поясе{Enter}{F8}
Sleep 10
SendInput,{F8}do Дубинка на поясе.{Enter}{F8}
Return

!,::
SendInput,{F8}do Электрошокер Taser c гравировкой закреплен в кобуре.{Enter}{F8}
Sleep 10
SendInput,{F8}me резким движением выхватил электрошокер из кобуры и приготовил к использованию{Enter}{F8}
Sleep 10
SendInput,{F8}do Электрошокер Taser готов к использованию.{Enter}{F8}
Return

!.::
SendInput,{F8}me убрал электрошокер в кобуру{Enter}{F8}
Sleep 10
SendInput,{F8}do Электрошокер Taser в кобуре.{Enter}{F8}
Return

^;::
SendInput,{F8}do Пистолет Макарова c гравировкой лежит в кобуре.{Enter}{F8}
Sleep 10
SendInput,{F8}me резким движением выхватил пистолет из кобуры и приготовил к стрельбе{Enter}{F8}
Sleep 10
SendInput,{F8}do Пистолет Макарова готов к стрельбе.{Enter}{F8}
Return

^'::
SendInput,{F8}me поставил пистолет на предохранитель и убрал его в кобуру{Enter}{F8}
Sleep 10
SendInput,{F8}do Пистолет Макарова лежит в кобуре.{Enter}{F8}
Return

!;::
SendInput,{F8}do АКС-74У c гравировкой висит на плече.{Enter}{F8}
Sleep 10
SendInput,{F8}me скинул АКС-74У c плеча и снял с предохранителя{Enter}{F8}
Sleep 10
SendInput,{F8}do АКС-74У готов к стрельбе.{Enter}{F8}
Return

!'::
SendInput,{F8}me поставил АКС-74У на предохранитель и повесил на плечо{Enter}{F8}
Sleep 10
SendInput,{F8}do АКС-74У висит на плече.{Enter}{F8}
Return

^/::
SendInput,{F8}do Карабин КСА c гравировкой висит на плече.{Enter}{F8}
Sleep 10
SendInput,{F8}me скинул карабин КСА и снял с предохранителя{Enter}{F8}
Sleep 10
SendInput,{F8}do Карабин КСА готов к стрельбе.{Enter}{F8}
Return

^\::
SendInput,{F8}me поставил карабин КСА на предохранитель и повесил на плечо{Enter}{F8}
Sleep 10
SendInput,{F8}do Карабин КСА висит на плече.{Enter}{F8}
Return