static func get_top_left(actual_position, center_position, zoom):
	var top_left = Vector2(
		-OS.window_size.x/2,
		-OS.window_size.y/2
	)
	
	top_left.x += center_position.x-actual_position.x - (top_left.x * (1-zoom.x))
	top_left.y += center_position.y-actual_position.y - (top_left.y * (1-zoom.y))
	
	top_left.y += 10
	
	return top_left

static func toogle_fullscreen():
	var fullscreen = OS.window_fullscreen
	var new_fullscreen = !fullscreen if Input.is_action_just_pressed("fullscreen") else fullscreen
	
	OS.set_window_fullscreen(new_fullscreen)

static func get_messages(world, player, camera):
	var map_items = world.items
	var map_items_count = map_items.size()
	var player_position = player.position
	var inventory = player.inventory
	var inventory_count = inventory.size()
	var camera_center = camera.get_camera_screen_center()
	var camera_position = camera.get_camera_position()
	var camera_zoom = camera.zoom
	
	var messages = [
		"Project:",
		"  Fullscreen --- %s" % [str(OS.window_fullscreen)],
		"Player:",
		"  Life ------------- %d" % [player.life],
		"  Position --------- X: %d | Y: %d" % [player_position.x, player_position.y],
		"  Deslocation ------ X: %d | Y: %d" % [player.velocity.x, player.velocity.y],
		"  Run Modifier ----- %2.1f" % [player.running],
		"  Sprint duration -- %f" % [player.sprint_duration],
		"  Sprint cooldown -- %f" % [player.sprint_cooldown],
		"  Camera",
		"    Camera center ---- X: %2.1f | Y: %2.1f" % [camera_center.x, camera_center.y],
		"    Position --------- X: %2.1f | Y: %2.1f" % [camera_position.x, camera_position.y],
		"    Zoom ------------- X: %2.2f | Y: %2.2f" % [camera_zoom.x, camera_zoom.y],
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
