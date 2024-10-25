;  ;специальная штука, что бы не было проблем с расскладками
FileEncoding UTF-8

ReadComFile(FileName){
    Loop, read, %FileName%
        SendInput %A_LoopReadLine% {Enter}
        Sleep 500
}
;ReadComFile("G:\Scripts\GUVD\lectures\Субординация.txt")
Hotstring = kjkl
Target = s
:?:/kjkl::
{ 
SendPlay ^A{Delete}
SendPlay /%Hotstring%{Space}
Sleep 500
    Input %Target%, V, {Enter}
    MsgBox % s
}


!1::
res = 
(
ффффффффф
ффффффффффффффффффф
фффф
ффффффффффф
)
re := StrSplit(res)
str := "r" res "r"
MsgBox % str
Return