extends Sprite

const Player = preload("res://scripts/lib_player.gd")
var speed
var velocity

func _ready():
	speed = 5
	velocity = Vector2()

func _process(delta):
	velocity = Player.get_velocity(speed)
	position = Player.set_position(position, velocity)
