extends Node3D

# References - set these in inspector or find by group
@export var puzzlePanelPath: NodePath
@export var doorPath: NodePath

var puzzlePanel = null
var door = null

func _ready():
	# Set up world geometry collision
	setup_world_collision()
	
	# Connect puzzle to door
	setup_puzzle_connections()

func setup_world_collision():
	# Your existing collision setup for world geometry
	for node in get_tree().get_nodes_in_group("world_geometry"):
		for child in node.find_children("", "StaticBody3D", true, false):
			child.collision_layer = 1
			child.collision_mask = 6

func setup_puzzle_connections():
	# Find puzzle panel
	if puzzlePanelPath:
		puzzlePanel = get_node(puzzlePanelPath)
	else:
		# Try to find by searching for script type
		for node in get_tree().get_nodes_in_group("puzzle_panel"):
			var scriptNode = node.get_node_or_null("PuzzlePanel")  # Assumes script is on child node named this
			if scriptNode:
				puzzlePanel = scriptNode
				break
	
	# Find door
	if doorPath:
		door = get_node(doorPath)
	else:
		door = find_child("doorway*", true, false)  # Find any node starting with "doorway"
	
	# Connect them
	if puzzlePanel and door:
		puzzlePanel.puzzle_solved.connect(_on_puzzle_solved)
		print("Connected puzzle to door")
	else:
		if not puzzlePanel:
			push_error("Puzzle panel not found!")
		if not door:
			push_error("Door not found!")

func _on_puzzle_solved():
	print("Level manager: Puzzle solved! Opening door...")
	door.open()
