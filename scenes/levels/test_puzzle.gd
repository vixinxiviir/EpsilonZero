extends Node3D

func _ready():
	for node in get_tree().get_nodes_in_group("world_geometry"):
		for child in node.find_children("", "StaticBody3D", true, false):
			child.collision_layer = 1
			child.collision_mask = 6
