extends Camera2D

const PlayerCamera = preload("res://characters/player/camera/lib.gd")
var world
var player
var debug_font = DynamicFont.new()
var debug = false
var top_left = PlayerCamera.get_top_left(position, self.get_camera_screen_center(), self.zoom)

func _ready():
	world = self.get_parent().get_parent()
	
	for i in world.get_child_count():
		var child = world.get_child(i)
		if child.name == "Player":
			player = child
			break
	
	debug_font.font_data = load("res://fonts/VeraSans-Regular.ttf")
	debug_font.size = 10
	debug_font.outline_color = Color(0,0,0,1)
	debug_font.use_filter = true

func _process(_delta):
	debug = !debug if Input.is_action_just_pressed("debug") else debug
	
	top_left = PlayerCamera.get_top_left(
		self.get_camera_position(), 
		self.get_camera_screen_center(), 
		self.zoom
	)
	
	PlayerCamera.toogle_fullscreen()
	update()

func _draw():
	var text_position = top_left
	var messages
	
	messages = PlayerCamera.get_messages(world, player, self) if debug else ["(F3 for Debug)"]
	
	for msg in messages:
		draw_string(debug_font, text_position, msg)
		text_position.y += debug_font.size+1
