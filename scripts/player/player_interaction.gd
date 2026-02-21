extends Node

signal interact_pressed(target_object, held_object)

# References
@onready var player = get_parent()  # The CharacterBody3D player
@onready var head = player.get_node("head")
@onready var raycast = head.get_node("RayCast3D")
#@onready var numberContainer = get_tree().current_scene.get_node("numberObjects")

# Interaction state
var heldObject = null


func handle_interaction():
	# If holding something, try to interact with what we're looking at
	if heldObject != null:
		var nearbyObjects = get_nearby_interactables()
		if nearbyObjects.size() > 0:
			# Interact with the closest one
			var closestTarget = nearbyObjects[0]
			print(closestTarget)
			interact_pressed.emit(closestTarget, heldObject)
		else:
			# Not looking at anything, just drop it
			drop_object()
	else:
		# Not holding anything, try to pick up
		attempt_pickup()

func get_nearby_interactables() -> Array:
	# Find objects near the held object that we can interact with
	var nearby = []
	var checkRadius = 2.0  # Distance to check
	
	# Check all objects in puzzle_panel group
	for node in get_tree().get_nodes_in_group("puzzle_panel"):
		var distance = heldObject.global_position.distance_to(node.global_position)
		if distance < checkRadius:
			nearby.append(node)
			
	return nearby

func attempt_pickup():
	if raycast.is_colliding():
		var hitObject = raycast.get_collider()
		if hitObject.is_in_group("interactable"):
			pickup_object(hitObject)

func pickup_object(object):
	heldObject = object
	heldObject.collision_layer = 16  # Layer 5 - not detected by raycast or player
	heldObject.collision_mask = 1 + 4  # Only detects world while held
	# Don't reparent - keep in world for physics

func drop_object():
	if heldObject == null:
		return
	
	var dropPosition = heldObject.global_position
	#heldObject.reparent(numberContainer)
	heldObject.global_position = dropPosition
	heldObject.collision_layer = 4  # Back to layer 3
	heldObject.collision_mask = 1 + 4  # Detects world AND other objects
	heldObject = null
	
func _ready():
	# Set raycast collision mask
	raycast.collision_mask = 1 + 4 

func _input(event):
	if event.is_action_pressed("interact"):
		handle_interaction()

func _physics_process(delta):
	# Update held object position to follow camera
	if heldObject != null:
		var targetPos = head.global_position + (-head.global_transform.basis.z * 1.5)
		var direction = targetPos - heldObject.global_position
		heldObject.move_and_collide(direction * delta * 20)
		
		heldObject.global_rotation = head.global_rotation
		heldObject.linear_velocity = Vector3.ZERO
		heldObject.angular_velocity = Vector3.ZERO
