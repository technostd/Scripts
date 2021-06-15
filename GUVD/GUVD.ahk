; Script powered in 2021 by Techno's studio
; All rights reserwed
; vk.com/technostd

DataPath = %A_WorkingDir%\data.ini


GuiGetUserData()
{
    FilePath = %A_WorkingDir%\data.ini
    
    IniRead City, %FilePath%, GuvdData, City
    IniRead IdNumber,%FilePath%,GuvdData,IdNumber
    IniRead Surname, %FilePath%, GuvdData, Surname
    IniRead Name, %FilePath%, GuvdData, Name
    IniRead SecondName, %FilePath%, GuvdData, SecondName
    IniRead Rank, %FilePath%, GuvdData, Rank
    IniRead Post, %FilePath%, GuvdData, Post
    IniRead Nickname, %FilePath%, GuvdData, Nickname
    
    Switch City
    {
        Case "Мирный", "":
            CITIES=Мирный||Приволжск|Невский
        Case "Приволжск":
            CITIES=Приволжск||Мирный|Невский
        Case "Невский":
            CITIES=Невский||Мирный|Приволжск
    }
   
    Global EditCity
    Global EditIdNumber
    Global EditSurname
    Global EditName
    Global EditSecondName
    Global EditRank
    Global EditPost
    Global EditNickname

    Gui, Color, FCF5E1
    Gui, Font, , Trebuchet MS
    Gui, Font,  Bold
    
    
    Gui, Add, GroupBox, x5 y5 w110 h42, Город
    Gui, Add, DropDownList, x10 y20 w100 r12 h100 c000000 vEditCity sort, % CITIES
    
    Gui, Add, GroupBox, x195 y5 w110 h42,Удостоверение
    Gui, Add, Edit, x200 y20 w100 h20 vEditIdNumber, %IdNumber%


    Gui, Add, GroupBox, x5 y50 w400 h90, Личные данные
    Gui, Add, Edit, x10 y65 w100 h20 vEditSurname, %Surname%
    Gui, Add, Edit, x10 y90 w100 h20 vEditName, %Name%
    Gui, Add, Edit, x10 y115 w100 h20 vEditSecondName, %SecondName%
    
    Gui, Add, Text, x115 y70 w80 h15, Фамилия
    Gui, Add, Text, x115 y95 w80 h15, Имя
    Gui, Add, Text, x115 y120 w80 h15, Отчество
    
    Gui, Add, Edit, x200 y65 w100 h20 vEditRank, %Rank%
    Gui, Add, Edit, x200 y90 w100 h20 vEditPost, %Post%
    Gui, Add, Edit, x200 y115 w100 h20 vEditNickname, %Nickname%
    
    Gui, Add, Text, x305 y70 w80 h15, Звание
    Gui, Add, Text, x305 y95 w80 h15, Должность
    Gui, Add, Text, x305 y120 w80 h15, Позывной
    
    Gui, Add, Button, x5 y145 w130 h25 gButtonClear, Очистить
    Gui, Add, Button, x140 y145 w130 h25 Default gButtonSave, Сохранить
    Gui, Add, Button, x275 y145 w130 h25 gButtonDiscard, Отменить
    
    Gui, Menu
    Gui, -Caption
    Gui, Show, h175 w410, TechnoAHK : Анкета

    Return
    
    ButtonClear:
    {
    Gui, Submit, NoHide
    
    GuiControl Text, EditIdNumber
    
    GuiControl Text, EditSurname
    GuiControl Text, EditName
    GuiControl Text, EditSecondName
    
    GuiControl Text, EditRank
    GuiControl Text, EditPost
    GuiControl Text, EditNickname
    Return
    }

    ButtonSave:
    {
    Gui, Submit
    MsgBox % EditCity
    IniWrite %EditCity%, %FilePath%, GuvdData, City
    IniWrite %EditIdNumber%,%FilePath%,GuvdData, IdNumber
    IniWrite %EditSurname%, %FilePath%, GuvdData, Surname
    IniWrite %EditName%, %FilePath%, GuvdData, Name
    IniWrite %EditSecondName%, %FilePath%, GuvdData, SecondName
    IniWrite %EditRank%, %FilePath%, GuvdData, Rank
    IniWrite %EditPost%, %FilePath%, GuvdData, Post
    IniWrite %EditNickname%, %FilePath%, GuvdData, Nickname
    Gui, Destroy
    Return
    }
    
    ButtonDiscard:
    {
    Gui, Destroy
    Return
    }   
    
    GuiClose:
    Gui, Destroy
    Return
    
}


GetUserData()
{
    Fields := ["City", "License", "Surname", "Name", "SecondName", "Nickname", "Rank", "Post"]
    for Field, Val in Fields
    {
        IniRead Val, %DataPath%, %Section%, %Val%
        
        if(%Field%=="")
        {
            ; RunWait %A_WorkingDir%\gui#GetUserData.ahk
            GuiGetUserData()
            
            Reload
        }
    }
}

^1::
GuiGetUserData()
Return






