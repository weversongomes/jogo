extends Control

func _ready():
	get_node("VitVoltar").connect("pressed",self,"_on_Button_pressed")
	get_node("VitProx").connect("pressed",self,"_jogar")
	
func _on_Button_pressed():
	get_node("/root/global").goto_scene("res://niveis.tscn")

func _jogar():
	#criar um metodo para subtituir essa string da tela atual para a da proxima fase tipo "fase"+[next]+".tscn"
	get_node("/root/global").goto_scene("res://"+get_tree().get_current_scene().get_name()+".tscn")
