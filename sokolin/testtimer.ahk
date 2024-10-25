; Переменная для хранения количества прошедших минут
minutesPassed := 0

; Запуск таймера
SetTimer, CheckTime, 3000
MsgBox, Таймер запущен

CheckTime:
{
    minutesPassed++
    ToolTip, Прошло минут: %minutesPassed%

    if (Mod(minutesPassed, 15) = 0)
    {
        MsgBox, Прошло 15 минут. Время сделать доклад!
    }

    ; Удаляем таймер через 60 минут
    if (minutesPassed = 60)
    {
        SetTimer, CheckTime, Delete
        MsgBox, Таймер удален после 60 минут.
    }

    return
}

return

!1::
MsgBox, хуя
return