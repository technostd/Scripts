FilePath = %A_WorkingDir%\data.ini

IniRead City, %FilePath%, GuvdData, City
IniRead IdNumber, %FilePath%, GuvdData, IdNumber
IniRead Name, %FilePath%, GuvdData, Name
IniRead Surname, %FilePath%, GuvdData, Surname
IniRead Rank, %FilePath%, GuvdData, Rank
IniRead Post, %FilePath%, GuvdData, Post
IniRead Nickname, %FilePath%, GuvdData, Nickname

MsgBox,,,%City%