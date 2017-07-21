extends Control

func _ready():
	get_node("BotaoSair").connect("pressed",self,"_sair")
	get_node("BotaoIniciar").connect("pressed",self,"_on_Button_pressed")

func _on_Button_pressed():
	get_node("/root/global").goto_scene("res://niveis.tscn")

func _sair():
	  get_tree().quit() 