static func get_velocity(speed):
	var velocity = Vector2()
	
	velocity.x = -(Input.is_action_pressed("left") as int)+(Input.is_action_pressed("right") as int)
	velocity.y = -(Input.is_action_pressed("up") as int)+(Input.is_action_pressed("down") as int)
	
	velocity = velocity.normalized() * speed
	velocity.x = ceil(velocity.x) if velocity.x > 0 else floor(velocity.x)
	velocity.y = ceil(velocity.y) if velocity.y > 0 else floor(velocity.y)
	
	return velocity

static func set_position(position, velocity):
	position.x += velocity.x
	position.y += velocity.y
	
	return position
