extends Sprite

const Player = preload("res://scripts/lib_player.gd")
var speed
var velocity
var camera

func _ready():
	speed = 5
	velocity = Vector2()
	camera = self.get_child(0)

func _process(delta):
	velocity = Player.get_velocity(speed)
	position = Player.set_position(position, velocity)
