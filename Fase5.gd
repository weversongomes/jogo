extends Node2D

var life = 3
var time=5
var respostaAtual="Resposta1"

func _ready():
	respostaAtual = randi()%9+1
	
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func gerarNovaQtd():
	respostaAtual = randi()%9+1

func mostrarQtd(n):
	for i in range(1,10):
		if i<=n:
			get_node("/root/"+ get_tree().get_current_scene().get_name() +"/AnimatedSprite"+str(i)).show()
		else:
			get_node("/root/"+ get_tree().get_current_scene().get_name() +"/AnimatedSprite"+str(i)).hide()

func resposta():
	
	if respostaAtual==1:
		return "Resposta1"
	if respostaAtual==2:
		return "Resposta2"
	if respostaAtual==3:
		return "Resposta3"
	if respostaAtual==4:
		return "Resposta4"
	if respostaAtual==5:
		return "Resposta5"
	if respostaAtual==6:
		return "Resposta6"
	if respostaAtual==7:
		return "Resposta7"
	if respostaAtual==8:
		return "Resposta8"
	if respostaAtual==9:
		return "Resposta9"