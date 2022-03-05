static func get_items(world):
	var items = []
	
	for child in world.get_children():
		if child.name.find("Item") > -1: items.push_back(child)
	
	return items
