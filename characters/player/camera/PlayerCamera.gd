extends Camera2D

const PlayerCamera = preload("res://characters/player/camera/lib.gd")
var world
var player
var debug_font
var debug
var top_left

func _ready():
	world = self.get_parent().get_parent()
	player = world.get_child(0)
	
	self.current = true
	
	debug_font = DynamicFont.new()
	debug_font.font_data = load("res://fonts/VeraSans-Regular.ttf")
	debug_font.size = 10
	
	debug = false
	top_left = PlayerCamera.get_top_left()

func _process(delta):
	debug = !debug if Input.is_action_just_pressed("debug") else debug
	top_left = PlayerCamera.get_top_left()
	PlayerCamera.toogle_fullscreen()
	update()

func _draw():
	var text_position = top_left
	var messages
	
	messages = PlayerCamera.get_messages(world, player) if debug else ["(F3 for Debug)"]
	
	for msg in messages:
		draw_string(debug_font, text_position, msg)
		text_position.y += debug_font.size+1
