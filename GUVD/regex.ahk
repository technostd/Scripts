
val = !1

val := RegExReplace(val, "!", "ALT+")
MsgBox % val
val := RegExReplace(val, "\^", "CTRL+")
MsgBox % val