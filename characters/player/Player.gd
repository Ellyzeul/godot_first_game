extends KinematicBody2D

const Player = preload("res://characters/player/lib.gd")
var speed
var running
var sprint_duration
var velocity
var camera
var collision_info
var font

func _ready():
	speed = 250
	running = 1
	velocity = Vector2()
	camera = self.get_child(0)
	sprint_duration = 0
	
func _physics_process(delta):
	sprint_duration = Player.get_sprint_delta(delta, sprint_duration)
	running = Player.get_running(sprint_duration)
	velocity = Player.get_velocity(speed, running)
	var collision_info = move_and_slide(velocity, Vector2.UP)
	update()
