static func get_velocity(speed):
	var velocity = Vector2()
	
	velocity.x = -(Input.is_action_pressed("left") as int)+(Input.is_action_pressed("right") as int)
	velocity.y = -(Input.is_action_pressed("up") as int)+(Input.is_action_pressed("down") as int)
	
	velocity = velocity.normalized() * speed
	
	return velocity

static func set_position(position, velocity):
	position.x += velocity.x
	position.y += velocity.y
	
	return position
