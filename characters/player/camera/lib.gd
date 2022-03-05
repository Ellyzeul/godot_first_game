static func get_top_left():
	var top_left = Vector2(
		-OS.window_size.x/2,
		-OS.window_size.y/2
	)
	
	top_left.y += 10
	
	return top_left

static func toogle_fullscreen():
	var fullscreen = OS.window_fullscreen
	var new_fullscreen = !fullscreen if Input.is_action_just_pressed("fullscreen") else fullscreen
	
	OS.set_window_fullscreen(new_fullscreen)

static func get_messages(world, player):
	var items = world.items
	var item_count
	
	item_count = items.size()
	
	var messages = [
		"Project:",
		"  Fullscreen --- %s" % ["true" if OS.window_fullscreen else "false"],
		"Player:",
		"  Position ----- X: %d | Y: %d" % [player.position.x, player.position.y],
		"  Deslocation -- X: %d | Y: %d" % [player.velocity.x, player.velocity.y],
		"  Run Modifier - %2.1f" % [player.running],
		"  Sprint delta - %f" % [player.sprint_duration],
		"Items:",
		"  Count -------- %d" % [item_count]
	]
	
	for i in range(item_count):
		messages.push_back("  Item%d:" % [i+1])
		messages.push_back("    Position --- X: %d | Y: %d" % [items[i].position.x, items[i].position.y])
	
	return messages
