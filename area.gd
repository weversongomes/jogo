extends Area2D
#scrip sendo usado

var mouse_enter = false
var object_dragged = false
var mouse_release = true
var clic = 0
var pos = get_global_mouse_pos()
var posInicial = self.get_pos()


onready var erro = get_node("/root/Fase1/Erro")
onready var questao = get_node("/root/Fase1/Questao1")
onready var fase1= get_node("/root/Fase1")

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
            mouse_release = true
            clic=0
           # print("liberou")
            mouse_release=false
            
            if self.get_name()=="Resposta3":
                set_global_pos(questao.get_global_pos())                
                erro.hide()
                var vitoria = get_node("/root/Fase1/PopupAcerto")                     
                vitoria.show()
                object_dragged = true
                if fase1.get("life")==1:
                	get_tree().get_root().get_node("Fase1").get_node("SamplePlayer").play("1")
                elif fase1.get("life")==2:
                	get_tree().get_root().get_node("Fase1").get_node("SamplePlayer").play("2")
                elif fase1.get("life")==3:
                	get_tree().get_root().get_node("Fase1").get_node("SamplePlayer").play("3")
            else:
                #print(erro.get_global_pos())
                 erro.set_global_pos(get_global_pos())
                 erro.show()
                 fase1.set("life",fase1.get("life")-1)
                 print("vida restante",fase1.get("life"))
                 if fase1.get("life")==2:
                    var err1 = get_node("/root/Fase1/Vida1/Xvida1")
                    err1.show()
                 if fase1.get("life")==1:
                    var err2 = get_node("/root/Fase1/Vida2/Xvida2")
                    err2.show()
                 if fase1.get("life")==0:
                     var err2 = get_node("/root/Fase1/Vida3/Xvida3")
                     err2.show()
                     var derrota = get_node("/root/Fase1/PopupErro")
                     get_tree().get_root().get_node("Fase1").get_node("SamplePlayer").play("loose-sound")
                     
                     derrota.show()
                 #set_global_pos(Vector2(435,225))
                 object_dragged = true