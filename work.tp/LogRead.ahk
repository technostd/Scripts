!1::

Loop, read, C:\Province Games\MTA\logs\console.log
    last_line := A_LoopReadLine
    
;MsgBox %last_line%
IfInString last_line, РќРµСѓРґР°С‡РЅРѕ
{
    MsgBox Нет
}
IfInString last_line, РЈРґР°С‡РЅРѕ
{
    MsgBox Да
}
Return