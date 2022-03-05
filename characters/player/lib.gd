static func get_velocity(speed, running):
	var velocity = Vector2()
	
	velocity.x = -(Input.is_action_pressed("left") as int)+(Input.is_action_pressed("right") as int)
	velocity.y = -(Input.is_action_pressed("up") as int)+(Input.is_action_pressed("down") as int)
	
	velocity = velocity.normalized() * speed * running
	velocity.x = ceil(velocity.x) if velocity.x > 0 else floor(velocity.x)
	velocity.y = ceil(velocity.y) if velocity.y > 0 else floor(velocity.y)
	
	return velocity

static func get_running(sprint_time):
	var running
	if sprint_time > 0: running = 2.0
	elif Input.is_action_pressed("run"): running = 1.5
	else: running = 1
	
	return running

static func get_sprint_duration(delta, last_delta):
	var new_delta
	
	if (
		Input.is_action_just_pressed("sprint") or
		(last_delta > 0 and last_delta <= 0.5)
	): new_delta = delta + last_delta
	else: new_delta = 0
	
	return new_delta

static func get_sprint_cooldown(cooldown, delta):
	var new_cooldown = cooldown - delta if cooldown > 0 else 0
	
	return new_cooldown

static func set_position(position, velocity):
	position.x += velocity.x
	position.y += velocity.y
	
	return position
