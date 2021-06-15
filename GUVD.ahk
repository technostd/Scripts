#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


GetUserData()
{
	Data := Object()
	
	IniRead Bufer, %DataPath%, GuvdData, City
	Data.City := Bufer
	IniRead Bufer, %DataPath%, GuvdData, IdNumber
	Data.IdNumber := Bufer
	IniRead Bufer, %DataPath%, GuvdData, SurName
	Data.SurName := Bufer
	IniRead Bufer, %DataPath%, GuvdData, Name
	Data.Name := Bufer
	IniRead Bufer, %DataPath%, GuvdData, Nickname
	Data.Nickname := Bufer
	IniRead Bufer, %DataPath%, GuvdData, SecondName
	Data.SecondName := Bufer
	IniRead Bufer, %DataPath%, GuvdData, Rank
	Data.Rank := Bufer
	IniRead Bufer, %DataPath%, GuvdData, Post
	Data.Post := Bufer
	
	for Field, Val in Data
	{
		if(Val=="")
		{
			RunWait %A_WorkingDir%\gui#GetUserData.ahk
			Reload
		}
	}
	
	Global City := Data.City
	Global IdNumber := Data.IdNumber
	Global SurName := Data.SurName
	Global Name := Data.Name
	Global SecondName := Data.SecondName
	Global Rank := Data.Rank
	Global PostPost := Data.Post
	Global Nickname := Data.Nickname
	
	Switch 
	{
		Case "Мирный":
			Struct := "ГУ МВД по г. Мирный и МО"
			StructTag := "ГУ МВД-М"
			OSNTag := "ОСН ""БАРС"""
		Case "Приволжск":
			Struct := "ГУ МВД по г. Приволжск и ПО"
			StructTag := "ГУ МВД-М"
			OSNTag := "КТЦ ""Phoenix"""
		Case "Невский":
			Struct := "ГУ МВД по г. Невский и НО"
			StructTag := "ГУ МВД-М"
			OSNTag := "СП УгРо МВД РП"
	}
}