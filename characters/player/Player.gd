extends KinematicBody2D

const Player = preload("res://characters/player/lib.gd")
const Utils = preload("res://utils.gd")
var life = 100
var inventory = []
var speed = 250
var running = 1
var sprint_duration = 0
var sprint_cooldown = 0
var velocity = Vector2()
var collision_info

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
