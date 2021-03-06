extends TextureFrame

var mouse_enter = false
var object_dragged = false
var pos = get_global_mouse_pos()

func _ready():
	self.connect("mouse_enter", self, "_on_mouse_enter")
	self.connect("mouse_exit", self, "_on_mouse_exit")
	set_fixed_process(true)

func _fixed_process(delta):
    pos = get_global_mouse_pos()
    if mouse_enter == true:
        if Input.is_mouse_button_pressed(BUTTON_LEFT):
            set_global_pos(pos)
            object_dragged = true
        else:
            object_dragged = false

func _on_mouse_enter():
    mouse_enter = true

func _on_mouse_exit():
    if object_dragged == false:
        mouse_enter = false


