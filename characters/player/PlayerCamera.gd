extends Camera2D

var world
var player
var font
var debug
var top_left

func _ready():
	world = self.get_parent().get_parent()
	player = world.get_child(0)
	
	self.current = true
	
	font = DynamicFont.new()
	font.font_data = load("res://fonts/VeraSans-Regular.ttf")
	font.size = 10
	
	debug = false

func _process(delta):
	debug = !debug if Input.is_action_just_pressed("debug") else debug
	top_left = Vector2(
		-ProjectSettings.get_setting("display/window/size/width")/2,
		-ProjectSettings.get_setting("display/window/size/height")/2
	)
	update()

func _draw():
	if !debug: return
	
	var messages = [
		"Player:",
		"  Position ----- X: "+str(player.position.x)+" | Y: "+str(player.position.y),
		"  Deslocation -- X: "+str(player.velocity.x)+" | Y: "+str(player.velocity.y)
	]
	var text_position = top_left
	text_position.y += 10
	
	for msg in messages:
		draw_string(font, text_position, msg)
		text_position.y += font.size+1
