extends Control

func _ready():
	get_node("Fase1").connect("pressed",self,"fase1")
	get_node("Fase2").connect("pressed",self,"fase2")
	get_node("Fase3").connect("pressed",self,"fase3")
	get_node("Fase4").connect("pressed",self,"fase4")
	get_node("Fase5").connect("pressed",self,"fase5")
	get_node("Fase6").connect("pressed",self,"fase6")
	get_node("Fase7").connect("pressed",self,"fase7")
	get_node("Fase8").connect("pressed",self,"fase8")
	get_node("Fase9").connect("pressed",self,"fase9")
	get_node("Fase10").connect("pressed",self,"fase10")
	get_node("Fase11").connect("pressed",self,"fase11")
	get_node("Fase12").connect("pressed",self,"fase12")
	
	get_node("Voltar").connect("pressed",self,"_on_Button_pressed")

func _on_Button_pressed():
	get_node("/root/global").goto_scene("res://mainmenu.tscn")

func fase1():
	get_node("/root/global").goto_scene("res://Fase1.tscn")

func fase2():
	get_node("/root/global").goto_scene("res://Fase2.tscn")

func fase3():
	get_node("/root/global").goto_scene("res://Fase3.tscn")

func fase4():
	get_node("/root/global").goto_scene("res://Fase4.tscn")

func fase5():
	get_node("/root/global").goto_scene("res://Fase5.tscn")

func fase6():
	get_node("/root/global").goto_scene("res://Fase6.tscn")

func fase7():
	get_node("/root/global").goto_scene("res://Fase7.tscn")

func fase8():
	get_node("/root/global").goto_scene("res://Fase8.tscn")

func fase9():
	get_node("/root/global").goto_scene("res://Fase9.tscn")
	
func fase10():
	get_node("/root/global").goto_scene("res://Fase10.tscn")

func fase11():
	get_node("/root/global").goto_scene("res://Fase11.tscn")

func fase12():
	get_node("/root/global").goto_scene("res://Fase12.tscn")

	