extends KinematicBody2D

const Player = preload("res://characters/player/lib.gd")
const Utils = preload("res://utils.gd")
var inventory
var speed
var running
var sprint_duration
var sprint_cooldown
var velocity
var camera
var collision_info

func _ready():
	inventory = []
	speed = 250
	running = 1
	velocity = Vector2()
	camera = self.get_child(0)
	sprint_duration = 0
	sprint_cooldown = 0
	
func _physics_process(delta):
	sprint_cooldown = Player.get_sprint_cooldown(sprint_cooldown, delta)
	
	if sprint_cooldown == 0 or sprint_duration != 0:
		sprint_duration = Player.get_sprint_duration(delta, sprint_duration)
		if sprint_duration > 0:
			sprint_cooldown = 2
	
	running = Player.get_running(sprint_duration)
	velocity = Player.get_velocity(speed, running)
	
	var _velocity = move_and_slide(velocity, Vector2.UP)
	
	var collisions = []
	for i in get_slide_count():
		collisions.append(get_slide_collision(i).collider)
	
	var unique_collisions = Utils.filter_array_for_uniques(collisions)
	Player.process_collisions(self, unique_collisions)
