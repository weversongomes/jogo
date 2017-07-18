extends Control

func _ready():
	get_node("Fase1").connect("pressed",self,"fase1")

func _on_Button_pressed():
	get_node("/root/global").goto_scene("res://mainmenu.tscn")

func fase1():
	get_node("/root/global").goto_scene("res://Fase1.tscn")
	