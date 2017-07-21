extends Sprite

var start_pos = Vector2()
var box1 = null
var box2 = null

func _ready():
	set_process(true)
	start_pos = get_pos()
	box1 = RectangleShape2D.new()
	box2 = RectangleShape2D.new()

func _process(delta):
	# Get a reference to the other sprite
	var sprite2 = get_node("/root/Node2D/Questao1")
   
	# Update our location
	#self.move_local_x(1.5)
   
	# set the boundaries of each RectangleShape2D to those of the texture making up our sprite
	# values are relative to center, thus half width and height
	box1.set_extents(Vector2(self.get_texture().get_size().width/2,self.get_texture().get_size().height/2))
	box2.set_extents(Vector2(sprite2.get_texture().get_size().width/2,sprite2.get_texture().get_size().height/2))
   
	#Now check to see if box1 at sprite1's pos collided with box2 and sprite2's position
	if(box1.collide(get_transform(),box2,sprite2.get_transform())):
		set_pos(start_pos) # it did, so reset position to beginning, what's old is new again!
