extends Node2D

const WorldModule = preload("res://levels/lib.gd")
var items

func _ready():
	items = WorldModule.get_items(self)

func _process(_delta):
	items = WorldModule.get_items(self)
