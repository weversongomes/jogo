extends Control

func _ready():
	get_node("Button 2").connect("pressed",self,"_on_Button_pressed")
	get_node("Button").connect("pressed",self,"_sair")

func _on_Button_pressed():
	get_node("/root/global").goto_scene("res://niveis.tscn")

func _sair():
	  get_tree().quit() 