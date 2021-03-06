extends Area2D
#scrip sendo usado

var mouse_enter = false
var object_dragged = false
var mouse_release = true
var clic = 0
var pos = get_global_mouse_pos()
var posInicial = self.get_pos()


onready var erro
onready var questao
onready var fase2

func _ready():
    self.connect("mouse_enter", self, "_on_mouse_enter")
    self.connect("mouse_exit", self, "_on_mouse_exit")
    
    
    #print(questao.get_global_pos())
    set_fixed_process(true)

func _fixed_process(delta):
    pos = get_global_mouse_pos()
    if mouse_enter == true:
        
        if Input.is_mouse_button_pressed(BUTTON_LEFT):
             mouse_release=false
             clic=1

        else:
            object_dragged = false
            if clic==1:
               _on_mouse_release()
            mouse_release=true
            

func _on_mouse_enter():
    mouse_enter = true

func _on_mouse_exit():
    if object_dragged == false:
        mouse_enter = false

func _on_mouse_release():
            erro = get_node("/root/" + get_tree().get_current_scene().get_name() + "/Erro")
            questao = get_node("/root/" + get_tree().get_current_scene().get_name() + "/Questao1")
            fase2= get_node("/root/" + get_tree().get_current_scene().get_name())
       
            print(get_tree().get_current_scene().get_name())
            mouse_release = true
            clic=0
            
            mouse_release=false

            var answer
            if get_tree().get_current_scene().get_name() == "Fase1":
             answer = "Resposta1"
            elif get_tree().get_current_scene().get_name() == "Fase2":
             answer = "Resposta2"
            elif get_tree().get_current_scene().get_name() == "Fase3":
             answer = "Resposta4"
            elif get_tree().get_current_scene().get_name() == "Fase4":
             answer = "Resposta5"
            elif get_tree().get_current_scene().get_name() == "Fase7":
             answer = "Resposta5"
            elif get_tree().get_current_scene().get_name() == "Fase8":
             answer = "Resposta7"
            elif get_tree().get_current_scene().get_name() == "Fase5":
             answer = fase2.resposta()
            elif get_tree().get_current_scene().get_name() == "Fase6":
             answer = fase2.resposta()
            elif get_tree().get_current_scene().get_name() == "Fase9":
             answer = fase2.resposta()
            elif get_tree().get_current_scene().get_name() == "Fase10":
             answer = fase2.resposta()
            elif get_tree().get_current_scene().get_name() == "Fase11":
             answer = fase2.resposta()
            elif get_tree().get_current_scene().get_name() == "Fase12":
             answer = fase2.resposta()
             #print(fase2.mostrarQtd(fase2.get("respostaAtual")))

            if self.get_name()==answer:
                set_global_pos(questao.get_global_pos())                
                erro.hide()
                if get_tree().get_current_scene().get_name() == "Fase5" || get_tree().get_current_scene().get_name() == "Fase6"|| get_tree().get_current_scene().get_name() == "Fase9"||get_tree().get_current_scene().get_name() == "Fase10"||get_tree().get_current_scene().get_name() == "Fase11"||get_tree().get_current_scene().get_name() == "Fase12":
                	if fase2.get("jogadaAtual")>0:
                		fase2.set("timer",fase2.get("timerWait"))
                		
                		get_tree().get_root().get_node(get_tree().get_current_scene().get_name()).get_node("SamplePlayer").play("1")
                		fase2.set("status",2)
                		
                	else:
                			var vitoria = get_node("/root/"+ get_tree().get_current_scene().get_name() +"/PopupAcerto")                     
                			vitoria.show()
                			fase2.set("status",3)
                			object_dragged = true
                			if fase2.get("life")==1:
                				get_tree().get_root().get_node(get_tree().get_current_scene().get_name()).get_node("SamplePlayer").play("1")
                			elif fase2.get("life")==2:
                				get_tree().get_root().get_node(get_tree().get_current_scene().get_name()).get_node("SamplePlayer").play("2")
                			elif fase2.get("life")==3:
                				get_tree().get_root().get_node(get_tree().get_current_scene().get_name()).get_node("SamplePlayer").play("3")
                else:#else da fase 5
                	var vitoria = get_node("/root/"+ get_tree().get_current_scene().get_name() +"/PopupAcerto")                     
                	vitoria.show()
                	object_dragged = true
                	if fase2.get("life")==1:
                		get_tree().get_root().get_node(get_tree().get_current_scene().get_name()).get_node("SamplePlayer").play("1")
                	elif fase2.get("life")==2:
                		get_tree().get_root().get_node(get_tree().get_current_scene().get_name()).get_node("SamplePlayer").play("2")
                	elif fase2.get("life")==3:
                		get_tree().get_root().get_node(get_tree().get_current_scene().get_name()).get_node("SamplePlayer").play("3")
            else:#else das fases gerais do erro
                 erro.set_global_pos(get_global_pos())
                 erro.show()
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
                     if get_tree().get_current_scene().get_name() == "Fase5" ||get_tree().get_current_scene().get_name() == "Fase6"||get_tree().get_current_scene().get_name() == "Fase9"||get_tree().get_current_scene().get_name() == "Fase10"||get_tree().get_current_scene().get_name() == "Fase11"||get_tree().get_current_scene().get_name() == "Fase12":
                     	fase2.set("status",3)
                     derrota.show()
                 #set_global_pos(Vector2(435,225))
                 object_dragged = true