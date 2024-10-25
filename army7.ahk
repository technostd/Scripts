^end::
	ExitApp
Return

!end::pause

!1::
SendInput,{F8}animarmy 3{Enter}{F8}
Sleep 500
SendInput,{F8}say Здравия желаю{!} Рядовой Учебного батальона, Сергей Серогов. {Enter}{F8}
Return

^1::
SendInput,{F8}do На нашивке военнослужащего надпись [Серогов С.С.], на шевроне - [Учебный батальон].{Enter}{F8}
Return

^2::
SendInput,{F8}say Гражданин, пожалуйста, предъявите Ваши документы на проверку.{Enter}{F8}
Sleep 500
SendInput,{F8}b [Совет]: Чтобы передать документ - /me передал документ | /pass [ID].{Enter}{F8}
Return

^3::
SendInput,{F8}say Цель вашего визита на территорию воинской части?{Enter}{F8}
Return

^4::
SendInput,{F8}s Гражданин, немедленно покиньте охраняемую территорию{!}{Enter}{F8}
Sleep 5
SendInput,{F8}s В противном случае, мы будем вынуждены открыть по Вам огонь{!}{Enter}{F8}
Return

^5::
SendInput,{F8}do Пульт управления шлагбаумом в кармане.{Enter}{F8}
Sleep 500
SendInput,{F8}me достал пульт управления шлагбаумом{Enter}{F8}
Sleep 500
SendInput,{F8}do Пульт управления шлагбаумом в руке.{Enter}{F8}
Sleep 500
SendInput,{F8}me нажал на кнопку{Enter}{F8}
Sleep 500
SendInput,{F8}do Кнопка нажата.{Enter}{F8}
Sleep 500
SendInput,{F8}armygate{Enter}{F8}
Return

!5::
SendInput,{F8}me убрал пульт управления шлагбаумом в карман{Enter}{F8}
Sleep 500
SendInput,{F8}do Пульт управления шлагбаумом в кармане.{Enter}{F8}
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

^-:: ; Достать рацию
SendInput,{F8}do Рация висит на поясе.{Enter}{F8}
Sleep 5
SendInput,{F8}me снял рацию с пояса и зажал кнопку переговоров{Enter}{F8}
Sleep 5
SendInput,{F8}do Рация в режиме радиовещания.{Enter}{F8}
Sleep 5
SendInput,{F8}fracvoice 1{Enter}{F8}
Return

^=:: ; Убрать рацию
SendInput,{F8}me отпустил кнопку и закрепил рацию на поясе{Enter}{F8}
Sleep 5
SendInput,{F8}do Рация висит на поясе.{Enter}{F8}
Sleep 5
SendInput,{F8}fracvoice 0{Enter}{F8}
Return

!,::
SendInput,{F8}do Пистолет "Colt-45" лежит в кобуре.{Enter}{F8}
Sleep 10
SendInput,{F8}me резким движение достал его из кобуры,затем снял с предохранителя{Enter}{F8}
Sleep 10
SendInput,{F8}do Пистолет в боевой готовности.{Enter}{F8}
Return

!.::
SendInput,{F8}me поставил пистолет на предохранитель и положил его в кобуру{Enter}{F8}
Sleep 10
SendInput,{F8}"Colt-45" в кобуре военнослужащего.{Enter}{F8}
Return

^;::
SendInput,{F8}do Пистолет "Desert Egle" лежит в кобуре.{Enter}{F8}
Sleep 10
SendInput,{F8}me резким движение достал его из кобуры,затем снял с предохранителя{Enter}{F8}
Sleep 10
SendInput,{F8}do Пистолет в боевой готовности.{Enter}{F8}
Return

^'::
SendInput,{F8}me поставил пистолет на предохранитель и положил его в кобуру{Enter}{F8}
Sleep 10
SendInput,{F8}do "Desert Egle" в кобуре военнослужащего.{Enter}{F8}
Return

!;::
SendInput,{F8}do Автомат "AK-47" висит на плече.{Enter}{F8}
Sleep 10
SendInput,{F8}me резким движение скинул автомат "АК-47" с плеча, затем снял с предохранителя{Enter}{F8}
Sleep 10
SendInput,{F8}do Автомат в боевой готовности.{Enter}{F8}
Return

!'::
SendInput,{F8}me поставил автомат на предохранитель и закинул его за спину{Enter}{F8}
Sleep 10
SendInput,{F8}do АК-47 висит за спиной военнослужащего.{Enter}{F8}
Return

^/:: ; Приготовить карабин КСА к стрельбе [Дробовик]
SendInput,{F8}do Пистолет-пулемет "MP-5" висит на плече.{Enter}{F8}
Sleep 10
SendInput,{F8}me резким движение скинул пистолет-пулемет "MP-5" с плеча,затем снял с предохранителя{Enter}{F8}
Sleep 10
SendInput,{F8}do Пистолет-пулемет в боевой готовности.{Enter}{F8}
Return

^\:: ; Убрать карабин КСА [Дробовик]
SendInput,{F8}me поставил пистолет-пулемет на предохранитель и закинул его за спину{Enter}{F8}
Sleep 10
SendInput,{F8}do Пистолет-пулемет "MP-5" висит за спиной военнослужащего.{Enter}{F8}
Return

:?:/вышка11::
SendInput {Enter}{F8}r [УБ]: 1-1-1 | Вышка 1{Enter}{F8}
Return

:?:/вышка12::
SendInput {Enter}{F8}r [УБ]: 1-1-2 | Вышка 1{Enter}{F8}
Return

:?:/вышка13::
SendInput {Enter}{F8}r [УБ]: 1-1-3 | Вышка 1{Enter}{F8}
Return

:?:/вышка21::
SendInput {Enter}{F8}r [УБ]: 1-1-1 | Вышка 2{Enter}{F8}
Return

:?:/вышка22::
SendInput {Enter}{F8}r [УБ]: 1-1-2 | Вышка 2{Enter}{F8}
Return

:?:/вышка23::
SendInput {Enter}{F8}r [УБ]: 1-1-3 | Вышка 2{Enter}{F8}
Return

:?:/вышка31::
SendInput {Enter}{F8}r [УБ]: 1-1-1 | Вышка 3{Enter}{F8}
Return

:?:/вышка32::
SendInput {Enter}{F8}r [УБ]: 1-1-2 | Вышка 3{Enter}{F8}
Return

:?:/вышка33::
SendInput {Enter}{F8}r [УБ]: 1-1-3 | Вышка 3{Enter}{F8}
Return

:?:/вышка41::
SendInput {Enter}{F8}r [УБ]: 1-1-1 | Вышка 4{Enter}{F8}
Return

:?:/вышка42::
SendInput {Enter}{F8}r [УБ]: 1-1-2 | Вышка 4{Enter}{F8}
Return

:?:/вышка43::
SendInput {Enter}{F8}r [УБ]: 1-1-3 | Вышка 4{Enter}{F8}
Return

:?:/патруль1::
SendInput {Enter}{F8}r [УБ]: 1-2-1{Enter}{F8}
Return

:?:/патруль2::
SendInput {Enter}{F8}r [УБ]: 1-2-2{Enter}{F8}
Return

:?:/патруль3::
SendInput {Enter}{F8}r [УБ]: 1-2-3{Enter}{F8}
Return

:?:/кпп1::
SendInput {Enter}{F8}r [УБ]: 1-3-1{Enter}{F8}
Return

:?:/кпп2::
SendInput {Enter}{F8}r [УБ]: 1-3-2{Enter}{F8}
Return

:?:/кпп3::
SendInput {Enter}{F8}r [УБ]: 1-3-3{Enter}{F8}
Return
