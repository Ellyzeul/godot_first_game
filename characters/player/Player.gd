extends Sprite

const Player = preload("res://scripts/lib_player.gd")
var speed
var velocity
var font

func _ready():
	speed = 5
	velocity = Vector2()
	
	font = DynamicFont.new()
	font.font_data = load("res://fonts/debug.ttf")
	font.size = 20

func _process(delta):
	velocity = Player.get_velocity(speed)
	position = Player.set_position(position, velocity)
	update()

func _draw():
	draw_string(font, Vector2(0, -32), "X: "+str(velocity.x)+" | Y: "+str(velocity.y))
	draw_string(font, Vector2(0,-64), "X: "+str(position.x)+" | Y: "+str(position.y))
