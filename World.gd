extends Node2D


var player
var font
var debug

func _ready():
	player = self.get_child(0)
	
	font = DynamicFont.new()
	font.font_data = load("res://fonts/debug.ttf")
	font.size = 20
	
	debug = false

func _process(delta):
	debug = !debug if Input.is_action_just_pressed("debug") else debug
	update()

func _draw():
	if !debug: return
	
	draw_string(
		font, 
		Vector2(0,20), 
		"Player:"
	)
	draw_string(
		font, 
		Vector2(0,41), 
		"  Deslocation -> X: "+str(player.velocity.x)+" | Y: "+str(player.velocity.y)
	)
	draw_string(
		font, 
		Vector2(0,62), 
		"  Position ----> X: "+str(player.position.x)+" | Y: "+str(player.position.y)
	)
