extends TextureButton

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
onready var fase2

func _ready():
	self.connect("pressed",self,"_on_Button_pressed")
	
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _on_Button_pressed():
	fase2= get_node("/root/" + get_tree().get_current_scene().get_name())
	get_node("/root/" + get_tree().get_current_scene().get_name()+"/Iniciarjogo").hide()
	fase2.mostrarQtd(fase2.get("respostaAtual"))