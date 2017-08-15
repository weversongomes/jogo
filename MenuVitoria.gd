extends Control

func _ready():
	get_node("VitVoltar").connect("pressed",self,"_on_Button_pressed")
	get_node("VitProx").connect("pressed",self,"_jogar")
	
func _on_Button_pressed():
	get_node("/root/global").goto_scene("res://niveis.tscn")

func _jogar():
	#criar um metodo para subtituir essa string da tela atual para a da proxima fase tipo "fase"+[next]+".tscn"
	var next =get_node("/root/" + get_tree().get_current_scene().get_name()).get("nextFase")
	
	if next==0:#0 indicar que n tem mais fases seguintes e volta pro menu
		get_node("/root/global").goto_scene("res://niveis.tscn")
	else:
		get_node("/root/global").goto_scene("res://Fase"+str(next)+".tscn")
