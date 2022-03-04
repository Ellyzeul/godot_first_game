extends Node2D


var player
var font
var debug

func _ready():
	player = self.get_child(0)
	
	font = DynamicFont.new()
	font.font_data = load("res://fonts/debug.ttf")
	font.size = 10
	
	debug = false

func _process(delta):
	debug = !debug if Input.is_action_just_pressed("debug") else debug
	update()

func _draw():
	if !debug: return
	
	var messages = [
		"Player:",
		"  Position ----- X: "+str(player.position.x)+" | Y: "+str(player.position.y),
		"  Deslocation -- X: "+str(player.velocity.x)+" | Y: "+str(player.velocity.y)
	]
	var spacement = 10
	
	for msg in messages:
		draw_string(font, Vector2(0,spacement), msg)
		spacement += font.size+1
