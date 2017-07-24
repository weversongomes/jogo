extends AnimatedSprite

var tempElapsed = 0

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	tempElapsed = tempElapsed + delta

	if(tempElapsed > 0.5):
		if(get_frame() == self.get_sprite_frames().get_frame_count("default")-1):
			set_frame(0)
		else:
			self.set_frame(get_frame() + 1)      
		tempElapsed = 0   
	print(str(get_frame() + 1))