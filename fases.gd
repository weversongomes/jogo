extends Control

func _ready():
	get_node("Voltar").connect("pressed",self,"_on_Button_pressed")

func _on_Button_pressed():
	get_node("/root/global").goto_scene("res://niveis.tscn")
