extends Area2D
func _ready():
	get_node("/root/Node2D/Area2D").connect("body_enter",self,"_on_Area2D_body_enter")
	get_node("/root/Node2D/Area2D").connect("body_exit",self,"_on_Area2D_body_exit")

func _on_Area2D_body_enter():	
	print("Entered Area2D with body ")
	

func _on_Area2D_body_exit():
	print("Exited Area2D with body ")