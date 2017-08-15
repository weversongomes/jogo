extends Label

var start=0;
onready var fase2

#set_global_pos(questao.get_global_pos())   


func _ready():
	get_node("/root/Fase9/Timer").connect("timeout",self,"_on_Timer_timeout")
	

func _on_Timer_timeout():
	fase2= get_node("/root/" + get_tree().get_current_scene().get_name())
	start=fase2.get("status")
	if start==0:
		fase2.set("status",1)#mudar status
		fase2.savarPosInicial()
		fase2.gerarNovaQtd()
	elif start==2:
		#tempo de espera
		
		#self.set_text("Tempo: "+str(fase2.get("timer")))
		fase2.set("timer",fase2.get("timer")-1)
		
		if fase2.get("timer")==-1:
			
			fase2.set("timer",fase2.get("timerInicial"))
			fase2.set("jogadaAtual",fase2.get("jogadaAtual")-1)
			print(fase2.get("jogadaAtual"))
			fase2.gerarNovaQtd()
			fase2.resetPos()
			fase2.set("status",1)
			print("resetou")
	elif start==3:
		get_node("/root/"+ get_tree().get_current_scene().get_name()+"/Timer").stop()
	else:
		self.set_text("Tempo: "+str(fase2.get("timer")))
		fase2.set("timer",fase2.get("timer")-1)
		
		if fase2.get("timer")==-1 && start==1: #zerou o timer
			fase2.set("status",2)
			fase2.set("timer",fase2.get("timerWait"))
			
			#acabou o tempo e não foi selecionado nada
			fase2.set("life",fase2.get("life")-1)
			print("vida restante",fase2.get("life"))
			if fase2.get("life")==2:
				get_tree().get_root().get_node(get_tree().get_current_scene().get_name()).get_node("SamplePlayer").play("wrong")
				var err1 = get_node("/root/"+ get_tree().get_current_scene().get_name() +"/Vida1/Xvida1")

				err1.show()
			if fase2.get("life")==1:
				get_tree().get_root().get_node(get_tree().get_current_scene().get_name()).get_node("SamplePlayer").play("wrong")
				var err2 = get_node("/root/"+ get_tree().get_current_scene().get_name() +"/Vida2/Xvida2")
				err2.show()
			if fase2.get("life")==0:
				var err2 = get_node("/root/"+ get_tree().get_current_scene().get_name() +"/Vida3/Xvida3")
				err2.show()
				var derrota = get_node("/root/"+ get_tree().get_current_scene().get_name() +"/PopupErro")
				get_tree().get_root().get_node(get_tree().get_current_scene().get_name()).get_node("SamplePlayer").play("loose-sound")
                     
				derrota.show()
				get_node("/root/"+ get_tree().get_current_scene().get_name()+"/Timer").stop()
				
			if fase2.get("jogadaAtual")==0:
				get_node("/root/"+ get_tree().get_current_scene().get_name()+"/Timer").stop()
				
				