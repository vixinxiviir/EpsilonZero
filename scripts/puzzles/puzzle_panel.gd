extends Node

# Signal emitted when puzzle is solved
signal puzzle_solved

# Puzzle configuration
@export var correctAnswer: String = "number_5"  # Set in inspector
@export var interactionDistance: float = 2.0

var playerInteractionSystem = null

func _ready():
	# Find the player's interaction system
	var player = get_tree().get_first_node_in_group("player")
	if player:
		playerInteractionSystem = player.get_node("interactionController")
		if playerInteractionSystem:
			playerInteractionSystem.interact_pressed.connect(_on_player_interact)
		else:
			push_error("Player doesn't have InteractionSystem node!")
	else:
		push_error("No player found in scene!")
	var panelBody = get_parent()  # Assuming this script is child of the panel
	if not panelBody.is_in_group("puzzle_panel"):
		panelBody.add_to_group("puzzle_panel")

func _on_player_interact(targetObject, heldObject):
	# Check if player is interacting with THIS panel
	print("puzzle_panel received interaction signal!")
	print("  Target: ", targetObject.name)
	print("  Held: ", heldObject.name)
	print("  My parent: ", get_parent().name)
	if not is_interacting_with_panel(targetObject):
		print("  -> Not interacting with THIS panel")
		return
	
	# Check distance
	if heldObject.global_position.distance_to(self.global_position) > interactionDistance:
		return
	
	# Check answer
	check_answer(heldObject)
	
func is_interacting_with_panel(target_object) -> bool:
	# Check if target is our parent (the panel body) or any ancestor
	var current = target_object
	while current != null:
		if current == get_parent():
			return true
		current = current.get_parent()
	return false

func check_answer(submittedObject):
	print("Checking answer: ", submittedObject.name)
	
	if submittedObject.name == correctAnswer:
		print("CORRECT!")
		puzzle_solved.emit()
		# Remove the submitted object
		submittedObject.queue_free()
	else:
		print("WRONG! Try again.")
		# Could add visual/audio feedback here
