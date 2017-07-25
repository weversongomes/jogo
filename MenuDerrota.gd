extends Control

func _ready():
	get_node("ErrVoltar").connect("pressed",self,"_on_Button_pressed")
	get_node("ErrJogar").connect("pressed",self,"_jogar")
	
func _on_Button_pressed():
	get_node("/root/global").goto_scene("res://niveis.tscn")

func _jogar():
	get_node("/root/global").goto_scene("res://"+get_tree().get_current_scene().get_name()+".tscn")
