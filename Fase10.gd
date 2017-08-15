extends Node2D

var life = 3
var timerInicial=10
var timer=timerInicial
var timerWait = 1
var maxJogadas=10
var jogadaAtual=maxJogadas
var fase=10
var nextFase=11
var status=0; #status do time 0=incial 1=normal 2=estado de espera
var respostaAtual="Resposta11"

onready var resp1
onready var resp2
onready var resp3
onready var resp4
onready var resp5
onready var resp6
onready var resp7
onready var resp8
onready var resp9

func _ready():
	respostaAtual = randi()%9+1
	
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func gerarNovaQtd():
	var a = randonNumeros(5)
	var b = randonNumeros(4)
	respostaAtual = a+b
	mostrarQtd(a,b)

func mostrarQtd(a,b):
	for i in range(1,6):
		var tipo=randi()%2+1
		if tipo==1:
			if i<=a:#lado a
				get_node("/root/"+ get_tree().get_current_scene().get_name() +"/AnimatedSprite"+str(i)).show()
				get_node("/root/"+ get_tree().get_current_scene().get_name() +"/Sprite"+str(i)).hide()
			else:
				get_node("/root/"+ get_tree().get_current_scene().get_name() +"/AnimatedSprite"+str(i)).hide()
				get_node("/root/"+ get_tree().get_current_scene().get_name() +"/Sprite"+str(i)).hide()
		else:
			if i<=a:#lado a
				get_node("/root/"+ get_tree().get_current_scene().get_name() +"/AnimatedSprite"+str(i)).hide()
				get_node("/root/"+ get_tree().get_current_scene().get_name() +"/Sprite"+str(i)).show()
			else:
				get_node("/root/"+ get_tree().get_current_scene().get_name() +"/AnimatedSprite"+str(i)).hide()
				get_node("/root/"+ get_tree().get_current_scene().get_name() +"/Sprite"+str(i)).hide()
	
	for i in range(6,10):
					#labo b
		var tipo=randi()%2+1
		if tipo==1:
			if i<=b+5:
				get_node("/root/"+ get_tree().get_current_scene().get_name() +"/AnimatedSprite"+str(i)).show()
				get_node("/root/"+ get_tree().get_current_scene().get_name() +"/Sprite"+str(i)).hide()
			else:
				get_node("/root/"+ get_tree().get_current_scene().get_name() +"/AnimatedSprite"+str(i)).hide()
				get_node("/root/"+ get_tree().get_current_scene().get_name() +"/Sprite"+str(i)).hide()
		else:
			if i<=b+5:
				get_node("/root/"+ get_tree().get_current_scene().get_name() +"/AnimatedSprite"+str(i)).hide()
				get_node("/root/"+ get_tree().get_current_scene().get_name() +"/Sprite"+str(i)).show()
			else:
				get_node("/root/"+ get_tree().get_current_scene().get_name() +"/AnimatedSprite"+str(i)).hide()
				get_node("/root/"+ get_tree().get_current_scene().get_name() +"/Sprite"+str(i)).hide()
			

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
func savarPosInicial():
	#set_global_pos(questao.get_global_pos()) 
	resp1= get_node("/root/"+ get_tree().get_current_scene().get_name() +"/Resposta1").get_global_pos()
	resp2= get_node("/root/"+ get_tree().get_current_scene().get_name() +"/Resposta2").get_global_pos()
	resp3= get_node("/root/"+ get_tree().get_current_scene().get_name() +"/Resposta3").get_global_pos()
	resp4= get_node("/root/"+ get_tree().get_current_scene().get_name() +"/Resposta4").get_global_pos()
	resp5= get_node("/root/"+ get_tree().get_current_scene().get_name() +"/Resposta5").get_global_pos()
	resp6= get_node("/root/"+ get_tree().get_current_scene().get_name() +"/Resposta6").get_global_pos()
	resp7= get_node("/root/"+ get_tree().get_current_scene().get_name() +"/Resposta7").get_global_pos()
	resp8= get_node("/root/"+ get_tree().get_current_scene().get_name() +"/Resposta8").get_global_pos()
	resp9= get_node("/root/"+ get_tree().get_current_scene().get_name() +"/Resposta9").get_global_pos()
	
func resetPos():
	get_node("/root/"+ get_tree().get_current_scene().get_name() +"/Resposta1").set_global_pos(resp1)
	get_node("/root/"+ get_tree().get_current_scene().get_name() +"/Resposta2").set_global_pos(resp2)
	get_node("/root/"+ get_tree().get_current_scene().get_name() +"/Resposta3").set_global_pos(resp3)
	get_node("/root/"+ get_tree().get_current_scene().get_name() +"/Resposta4").set_global_pos(resp4)
	get_node("/root/"+ get_tree().get_current_scene().get_name() +"/Resposta5").set_global_pos(resp5)
	get_node("/root/"+ get_tree().get_current_scene().get_name() +"/Resposta6").set_global_pos(resp6)
	get_node("/root/"+ get_tree().get_current_scene().get_name() +"/Resposta7").set_global_pos(resp7)
	get_node("/root/"+ get_tree().get_current_scene().get_name() +"/Resposta8").set_global_pos(resp8)
	get_node("/root/"+ get_tree().get_current_scene().get_name() +"/Resposta9").set_global_pos(resp9)
	
func randonNumeros(n):
	return randi()%n+1

	
