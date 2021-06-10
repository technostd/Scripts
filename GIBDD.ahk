^end::
	ExitApp
Return

!end::pause

!`::
SendInput,{F8}do КПК в руке.{Enter}{F8}
Sleep 500
SendInput,{F8}me выключил КПК и убрал в карман{Enter}{F8}
Sleep 500
SendInput,{F8}do КПК лежит в кармане.{Enter}{F8}
Return

^`::
SendInput,{F8}me постучал в окно{Enter}{F8}
Sleep 500
SendInput,{F8}do Стук.{Enter}{F8}
Return

!1::
SendInput,{F8}animarmy 3{Enter}{F8}
Sleep 500
SendInput,{F8}say Здравия желаю, Майор Дорожно-Патрульной службы Артем Загорецкий.{Enter}{F8}
Return

^1::
SendInput,{F8}do Удостоверение лежит в нагрудном кармане.{Enter}{F8}
Sleep 500
SendInput,{F8}me достал удостоверение из нагрудного кармана и развернул его{Enter}{F8}
Sleep 500
SendInput,{F8}do Удостоверение №125-11: Майор, Сотрудник СБ, ВП, ООН, Загорецкий Артем Сергеевич [УГИБДД г. Мирный].{Enter}{F8}
Return

^q::
SendInput,{F8}me закрыл удостоверение и убрал его в нагрудный карман{Enter}{F8}
Sleep 500
SendInput,{F8}do Удостоверение лежит в нагрудном кармане.{Enter}{F8}
Sleep 500
SendInput,{F8}animarmy 0{Enter}{F8}
Return

^2::
SendInput,{F8}me протянул правую руку и взял документы гражданина{Enter}{F8}
Sleep 500
SendInput,{F8}do Документы в руке.{Enter}{F8}
Sleep 500
SendInput,{F8}me начал изучать документы гражданина{Enter}{F8}
Sleep 500
SendInput,{F8}do Сотрудник изучает документы.{Enter}{F8}
Return

^3::
SendInput,{F8}do КПК лежит в кармане.{Enter}{F8}
Sleep 500
SendInput,{F8}me достал КПК из кармана и включил его{Enter}{F8}
Sleep 500
SendInput,{F8}do КПК включен.{Enter}{F8}
Return	

^NumpadDiv::
SendInput,{F8}do КПК лежит в кармане.{Enter}{F8}
Sleep 500
SendInput,{F8}me достав и включив КПК, сделал фотографию гражданина и отправил в базу данных{Enter}{F8}
Sleep 500
SendInput,{F8}do Личность гражданина установлена.{Enter}{F8}
Return

^4::
SendInput,{F8}c skan{Space}
Input, var, v,{Enter}
Sleep 10
SendInput,me зашел в базу данных{Enter}{F8}
Sleep 500
SendInput,{F8}do База данных на экране.{Enter}{F8}
Sleep 500
SendInput,{F8}me ввёл данные гражданина в строку поиска и нажал кнопку "Запросить"{Enter}{F8}
Sleep 500
SendInput,{F8}do На экране высветилась информация о гражданине.{Enter}{F8}
Sleep 500
SendInput,{F8}skan %var%{Enter}{F8}
Return

^5::
SendInput,{F8}do Планшетка с бланками протоколов и ручкой лежит на торпеде.{Enter}{F8}
Sleep 2000
SendInput,{F8}me взял планшетку{Enter}{F8}
Sleep 2000
SendInput,{F8}do Планшетка в руках.{Enter}{F8}
Sleep 2000
SendInput,{F8}me взял ручку с планшетки и начал оформлять протокол{Enter}{F8}
Sleep 2000
SendInput,{F8}do Сотрудник оформляет протокол.{Enter}{F8}
Sleep 2000
SendInput,{F8}me вписал персональные данные нарушителя{Enter}{F8}
Sleep 2000
SendInput,{F8}do Данные нарушителя заполнены.{Enter}{F8}
Sleep 2000
SendInput,{F8}me поставил дату %A_DD%.%A_MM%.%A_YYYY% и подпись "АЗС"{Enter}{F8}
Sleep 2000
SendInput,{F8}do Дата и подпись указаны.{Enter}{F8}
Return

^6::
SendInput,{F8}me передал планшетку с ручкой гражданину на подпись{Enter}{F8}
Sleep 500
SendInput,{F8}do Рука сотрудника вытянута в сторону гражданина.{Enter}{F8}
Sleep 500
SendInput,{F8}say Уважаемый, распишитесь, пожалуйста, в протоколе, если согласны с нарушением.{Enter}{F8}
Sleep 500
SendInput,{F8}b /me расписался в протоколе{Enter}{F8}
Return

^y::
SendInput,{F8}me поставил отметку о несогласии{Enter}{F8}
Sleep 500
SendInput,{F8}do Отметка стоит в протоколе.{Enter}{F8}
Sleep 500
SendInput,{F8}me вырвал копию протокола и передал ее гражданину{Enter}{F8}
Sleep 500
SendInput,{F8}do Рука сотрудника вытянута в сторону гражданина.{Enter}{F8}
Sleep 500
SendInput,{F8}say Уважаемый, возьмите, пожалуйста, копию протокола.{Enter}{F8}
Sleep 500
SendInput,{F8}say Без копии протокола вы не сможете обжаловать мое решение.{Enter}{F8}
Sleep 500
SendInput,{F8}b /me взял копию{Enter}{F8}
Return

^7::
SendInput,{F8}me взял планшетку с ручкой у гражданина{Enter}{F8}
Sleep 500
SendInput,{F8}do Планшетка в руке.{Enter}{F8}
Sleep 500
SendInput,{F8}me вырвал копию протокола и передал ее гражданину{Enter}{F8}
Sleep 500
SendInput,{F8}do Рука сотрудника вытянута в сторону гражданина.{Enter}{F8}
Sleep 500
SendInput,{F8}say Уважаемый, возьмите, пожалуйста, копию протокола.{Enter}{F8}
Sleep 500
SendInput,{F8}say Без копии протокола вы не сможете обжаловать мое решение.{Enter}{F8}
Sleep 500
SendInput,{F8}b /me взял копию{Enter}{F8}
Return

!y::
SendInput,{F8}me поставил отметку о невозможности получения подписи{Enter}{F8}
Sleep 500
SendInput,{F8}do Отметка стоит в протоколе.{Enter}{F8}
Sleep 500
SendInput,{F8}me вырвал копию протокола и положил ее на колени задержанного{Enter}{F8}
Sleep 500
SendInput,{F8}do Копия на коленях задержжанного.{Enter}{F8}
Return

^u::
SendInput,{F8}me убрал копию в карман{Enter}{F8}
Sleep 500
SendInput,{F8}do Копия в кармане.{Enter}{F8}
Return

^8::
SendInput,{F8}c tsu{Space}
Input, var, v,{Enter}
Sleep 10
SendInput,me внес данные о нарушении в базу{Enter}{F8}
Sleep 500
SendInput,{F8}do Данные внесены.{Enter}{F8}
Sleep 500
SendInput,{F8}tsu %var%{Enter}{F8}
Return

!8::
SendInput,{F8}c takecarlic{Space}
Input, var, v,{Enter}
Sleep 10
SendInput,me внес данные о недействительности ВУ{Enter}{F8}
Sleep 500
SendInput,{F8}do Данные введены.{Enter}{F8}
Sleep 500
SendInput,{F8}say Ваши права больше недействительны. Идите на пересдачу в автошколу{!}{Enter}{F8}
Sleep 500
SendInput,{F8}takecarlic %var%{Enter}{F8}
Return

^9::
SendInput,{F8}me вернул гражданину документы{Enter}{F8}
Sleep 500
SendInput,{F8}do Рука сотрудника вытянута в сторону водителя.{Enter}{F8}
Sleep 500
SendInput,{F8}say Уважаемый, не смею больше вас задерживать. Держите ваши документы.{Enter}{F8}
Sleep 500
SendInput,{F8}say Удачи на дорогах, больше не нарушайте.{Enter}{F8}
Sleep 500
SendInput,{F8}b /me взял документы{Enter}{F8}
Return

^-::
SendInput,{F8}do Рация висит на нагрудном кармане.{Enter}{F8}
Sleep 5
SendInput,{F8}me снял рацию с нагрудного кармана и нажал кнопку для переговоров{Enter}{F8}
Sleep 5
SendInput,{F8}do Сотрудник говорит что-то в рацию.{Enter}{F8}
Sleep 5
SendInput,{F8}fracvoice 1{Enter}{F8}
Return

^=::
SendInput,{F8}me сказал что-то в рацию и повесил ее на нагрудный карман{Enter}{F8}
Sleep 5
SendInput,{F8}do Рация висит на нагрудном кармане.{Enter}{F8}
Sleep 5
SendInput,{F8}fracvoice 0{Enter}{F8}
Return

^Numpad1::
SendInput,{F8}me потянулся рукой к рации{Enter}{F8}
Sleep 5
SendInput,{F8}do Сотрудник говорит что-то в рацию.{Enter}{F8}
Sleep 5
SendInput,{F8}s {#}728FE1[Мегафон]: {#}EEF20BУступите дорогу служебному автомобилю{!}{Enter}{F8}
Sleep 5
SendInput,{F8}me сказал что-то в рацию и повесил ее на торпеду{Enter}{F8}
Sleep 5
SendInput,{F8}do Рация висит на торпеде.{Enter}{F8}
Return

^Numpad2::
SendInput,{F8}s Гражданин, немедленно остановитесь{!} В случае отказа откроем огонь по ногам{!}{Enter}{F8}
Return

^Numpad3::
SendInput,{F8}me потянулся рукой к рации и запросил оперативного дежурного{Enter}{F8}
Sleep 5
SendInput,{F8}do Оперативный дежурный сообщил ориентировку и сводку.{Enter}{F8}
Sleep 5
SendInput,{F8}wanted{Enter}{F8}
Return

^Numpad4::
SendInput,{F8}me потянулся рукой к рации{Enter}{F8}
Sleep 5
SendInput,{F8}do Сотрудник говорит что-то в рацию.{Enter}{F8}
Sleep 5
SendInput,{F8}s {#}728FE1[Мегафон]: {#}FF0000Водители, внимание, движется организованная колонна{!}{Enter}{F8}
Sleep 5
SendInput,{F8}me сказал что-то в рацию и повесил ее на торпеду{Enter}{F8}
Sleep 5
SendInput,{F8}do Рация висит на торпеде.{Enter}{F8}
Return

^Numpad5::
SendInput,{F8}me потянулся рукой к рации{Enter}{F8}
Sleep 5
SendInput,{F8}do Сотрудник говорит что-то в рацию.{Enter}{F8}
Sleep 5
SendInput,{F8}s {#}728FE1[Мегафон]: {#}FF0000Водители, внимание{!} Движется организованная колонна, останавливаемся{!}{Enter}{F8}
Sleep 5
SendInput,{F8}me сказал что-то в рацию и повесил ее на торпеду{Enter}{F8}
Sleep 5
SendInput,{F8}do Рация висит на торпеде.{Enter}{F8}
Return

^Numpad6::
SendInput,{F8}me потянулся рукой к рации{Enter}{F8}
Sleep 5
SendInput,{F8}do Сотрудник говорит что-то в рацию.{Enter}{F8}
Sleep 5
SendInput,{F8}s {#}728FE1[Мегафон]: {#}FF0000Водители, внимание{!} Продолжаем движение{!} Организованная колонна проехала{!}{Enter}{F8}
Sleep 5
SendInput,{F8}me сказал что-то в рацию и повесил ее на торпеду{Enter}{F8}
Sleep 5
SendInput,{F8}do Рация висит на торпеде.{Enter}{F8}
Return

^Numpad7::
SendInput,{F8}me потянулся рукой к рации{Enter}{F8}
Sleep 5
SendInput,{F8}do Сотрудник говорит что-то в рацию.{Enter}{F8}
Sleep 5
SendInput,{F8}s {#}728FE1[Мегафон]: {#}EEF20BВодитель, принимаем крайнее правое положение и останавливаемся{!}{Enter}{F8}
Sleep 5
SendInput,{F8}me сказал что-то в рацию и повесил ее на торпеду{Enter}{F8}
Sleep 5
SendInput,{F8}do Рация висит на торпеде.{Enter}{F8}
Return

^Numpad8::
SendInput,{F8}me потянулся рукой к рации{Enter}{F8}
Sleep 5
SendInput,{F8}do Сотрудник говорит что-то в рацию.{Enter}{F8}
Sleep 5
SendInput,{F8}s {#}728FE1[Мегафон]: {#}EEF20BПовторяю, водитель, примите вправо и остановитесь{!}{Enter}{F8}
Sleep 5
SendInput,{F8}me сказал что-то в рацию и повесил ее на торпеду{Enter}{F8}
Sleep 5
SendInput,{F8}do Рация висит на торпеде.{Enter}{F8}
Return

^Numpad9::
SendInput,{F8}me потянулся рукой к рации{Enter}{F8}
Sleep 5
SendInput,{F8}do Сотрудник говорит что-то в рацию.{Enter}{F8}
Sleep 5
SendInput,{F8}s {#}728FE1[Мегафон]: {#}FF0000Останавливайтесь{!} В случае отказа откроем огонь{!}{Enter}{F8}
Sleep 5
SendInput,{F8}me сказал что-то в рацию и повесил ее на торпеду{Enter}{F8}
Sleep 5
SendInput,{F8}do Рация висит на торпеде.{Enter}{F8}
Return

^NumpadMult:: 
SendInput,{F8}say Здравия желаю{!}{Enter}{F8}
Sleep 5
SendInput,{F8}animarmy 3{Enter}{F8}
Return

!2::
SendInput,{F8}c cuff{Space}
Input, var, v,{Enter}
Sleep 10
SendInput,do Наручники висят на поясе.{Enter}{F8}
Sleep 5
SendInput,{F8}me снял наручники с пояса и застегнул их на нарушителе{Enter}{F8}
Sleep 5
SendInput,{F8}do Наручники застёгнуты на нарушителе.{Enter}{F8}
Sleep 5
SendInput,{F8}say Вы имеете право хранить молчание{!}{Enter}{F8}
Sleep 5
SendInput,{F8}cuff %var%{Enter}{F8}
Return

!3::
SendInput,{F8}с uncuff {Space}
Input, var, v,{Enter}
Sleep 10
SendInput,me снял наручники с нарушителя и закрепил их за поясом{Enter}{F8}
Sleep 5
SendInput,{F8}do Наручники закреплены за поясом.{Enter}{F8}
Sleep 5
SendInput,{F8}uncuff %var%{Enter}{F8}
Return

!4::
SendInput,{F8}me заломил нарушителю руки и увёл в служебный автомобиль{Enter}{F8}
Sleep 500
SendInput,{F8}do Сотрудник усадил нарушителя на заднее сиденье.{Enter}{F8}
Sleep 500
SendInput,{F8}say Берегите голову при посадке в автомобиль{!}{Enter}{F8}
Sleep 500
SendInput,{F6}
Sleep 50
SendInput,{/}putpl{Space}
Return


!0::
SendInput,{F8}me открыл базу данных автомобильных гос. номеров{Enter}{F8}
Sleep 500
SendInput,{F8}do База данных на экране.{Enter}{F8}
Sleep 500
SendInput,{F8}me ввёл гос. номер автомобиля в строку поиска и запросил данные о владельце авто{Enter}{F8}
Sleep 500
SendInput,{F8}do На экране высветилась информация о владельце авто.{Enter}{F8}
Sleep 500
SendInput,{F6}
Sleep 50
SendInput,{/}findcar{Space}
Return

!-::
SendInput,{F8}me подключился к базе данных ГИБДД{Enter}{F8}
Sleep 500
SendInput,{F8}do КПК подключен к базе данных ГИБДД.{Enter}{F8}
Sleep 500
SendInput,{F8}me запросил данные о водителях с неоплаченными штрафами в реальном времени{Enter}{F8}
Sleep 500
SendInput,{F8}do Данные в реальном времени выведены на экран КПК.{Enter}{F8}
Sleep 500
SendInput,{F8}fines{Enter}{F8}
Return

!Numpad1::
SendInput,{F8}do Тауметр лежит в бардачке.{Enter}{F8}
Sleep 500
SendInput,{F8}me достал тауметр{Enter}{F8}
Sleep 500
SendInput,{F8}do Тауметр в руке.{Enter}{F8}
Return

!Numpad2::
SendInput,{F8}me включил тауметр{Enter}{F8}
Sleep 500
SendInput,{F8}do Тауметр включен.{Enter}{F8}
Sleep 500
SendInput,{F8}me прислонил тауметр к стеклу и измерил тонировку{Enter}{F8}
Sleep 500
SendInput,{F8}do Результат измерения выведен на экран.{Enter}{F8}
Sleep 500
SendInput,{F8}try увидел, что тонировка не превышает нормы ГОСТ{Enter}{F8}
Sleep 500
SendInput,{F8}do Тонировка 
Return

!Numpad3::
SendInput,{F8}me выключил тауметр{Enter}{F8}
Sleep 500
SendInput,{F8}do Тауметр выключен.{Enter}{F8}
Return

!Numpad4::
SendInput,{F8}me потянулся рукой до видеорегистратора{Enter}{F8}
Sleep 500
SendInput,{F8}do Видеорегистратор в руке.{Enter}{F8}
Return

!Numpad5::
SendInput,{F8}me повернул экран в сторону гражданина{Enter}{F8}
Sleep 500
SendInput,{F8}do Экран повернут в сторону гражданина.{Enter}{F8}
Sleep 500
SendInput,{F8}me включил воспроизведение файла и стал наблюдать за происходящим{Enter}{F8}
Return

!Numpad6::
SendInput,{F8}me выключил воспроизведение видеофайла{Enter}{F8}
Sleep 500
SendInput,{F8}do Воспроизведение остановлено.{Enter}{F8}
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
Return

^,::
SendInput,{F8}do Дубинка висит на поясе.{Enter}{F8}
Sleep 10
SendInput,{F8}me снял дубинку с пояса правой рукой{Enter}{F8}
Sleep 10
SendInput,{F8}do Дубинка в руке.{Enter}{F8}
Return

^.::
SendInput,{F8}me повесил дубинку на пояс{Enter}{F8}
Sleep 10
SendInput,{F8}do Дубинка висит на поясе.{Enter}{F8}
Return

!,::
SendInput,{F8}do Электрошокер в кобуре.{Enter}{F8}
Sleep 10
SendInput,{F8}me достал электрошокер из кобуры и приготовил к использованию{Enter}{F8}
Sleep 10
SendInput,{F8}do Электрошокер готов к использованию.{Enter}{F8}
Return

!.::
SendInput,{F8}me убрал электрошокер в кобуру{Enter}{F8}
Sleep 10
SendInput,{F8}do Электрошокер в кобуре.{Enter}{F8}
Return

^;::
SendInput,{F8}do Пистолет лежит в кобуре.{Enter}{F8}
Sleep 10
SendInput,{F8}me достал пистолет из кобуры и снял его с предохранителя{Enter}{F8}
Sleep 10
SendInput,{F8}do Пистолет готов к стрельбе.{Enter}{F8}
Return

^'::
SendInput,{F8}me поставил пистолет на предохранитель и убрал его в кобуру{Enter}{F8}
Sleep 10
SendInput,{F8}do Пистолет лежит в кобуре.{Enter}{F8}
Return

!/::
SendInput,{F8}do МП-5 висит на плече.{Enter}{F8}
Sleep 10
SendInput,{F8}me скинул МП-5 c плеча и передернул затвор{Enter}{F8}
Sleep 10
SendInput,{F8}do МП-5 готов к стрельбе.{Enter}{F8}
Return

!\::
SendInput,{F8}me поставил МП-5 на предохранитель и повесил на плечо{Enter}{F8}
Sleep 10
SendInput,{F8}do МП-5 висит на плече.{Enter}{F8}
Return

^/::
SendInput,{F8}do На плече висит дробовик, заряженный резиновыми пулями.{Enter}{F8}
Sleep 10
SendInput,{F8}me снял дробовик с плеча и приготовил его к стрельбе{Enter}{F8}
Sleep 10
SendInput,{F8}do Дробовик готов к стрельбе.{Enter}{F8}
Return

^\::
SendInput,{F8}me поставил дробовик на предохранитель и повесил его на плечо{Enter}{F8}
Sleep 10
SendInput,{F8}do Дробовик висит на плече.{Enter}{F8}
Return