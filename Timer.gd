extends Label

var start=0;
onready var fase2
onready var resp1
onready var resp2
onready var resp3
onready var resp4
onready var resp5
onready var resp6
onready var resp7
onready var resp8
onready var resp9
#set_global_pos(questao.get_global_pos())   


func _ready():
	get_node("/root/Fase5/Timer").connect("timeout",self,"_on_Timer_timeout")
	print("teste")
	

func _on_Timer_timeout():
	if start==0:
		fase2= get_node("/root/" + get_tree().get_current_scene().get_name())
		start=1
		fase2.gerarNovaQtd()
	else:
		self.set_text("Tempo: "+str(fase2.get("timer")))
		fase2.set("timer",fase2.get("timer")-1)
		
		if fase2.get("timer")==-1: #zerou o timer
			fase2.set("timer",fase2.get("timerInicial"))
			fase2.set("jogadaAtual",fase2.get("jogadaAtual")-1)
			fase2.gerarNovaQtd()
			
			if fase2.get("jogadaAtual")==0:
				get_node("/root/Fase5/Timer").stop()
				print("acabou")