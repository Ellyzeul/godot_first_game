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
	var map_items = world.items
	var map_items_count
	var inventory = player.inventory
	var inventory_count = inventory.size()
	
	map_items_count = map_items.size()
	
	var messages = [
		"Project:",
		"  Fullscreen --- %s" % ["true" if OS.window_fullscreen else "false"],
		"Player:",
		"  Position --------- X: %d | Y: %d" % [player.position.x, player.position.y],
		"  Deslocation ------ X: %d | Y: %d" % [player.velocity.x, player.velocity.y],
		"  Run Modifier ----- %2.1f" % [player.running],
		"  Sprint duration -- %f" % [player.sprint_duration],
		"  Sprint cooldown -- %f" % [player.sprint_cooldown],
		"  Inventory:",
		"    Count ---------- %d" % [inventory_count]
	]
	
	for item in player.inventory:
		messages.append("    %s" % [item.name])
	
	messages.append_array([
		"Items on map:",
		"  Count ------------ %d" % [map_items_count]
	])
	
	for item in map_items:
		messages.append("  %s:" % [item.name])
		messages.append("    Position --- X: %d | Y: %d" % [item.position.x, item.position.y])
	
	return messages
