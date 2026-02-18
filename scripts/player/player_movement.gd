extends CharacterBody3D
@onready var head = $head
@onready var raycast = $head/RayCast3D
@onready var numberContainer = get_node("../numberObjects")

var heldObject = null
var movementSpeed = 5
var jumpVelocity = 5
var mouseSensitivity = .005
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var cameraRotationX = 0.0
var puzzlePanel = null
var doorway = null


func open_door():
	# We'll implement this in step 4
	if doorway != null:
		print("Door opening...")
		
		# Create a tween for smooth animation
		var tween = create_tween()
		
		# Slide the door 2 units to the right (positive X)
		# Duration: 1.5 seconds
		tween.tween_property(doorway, "position", doorway.position + Vector3(0, 3, 0), 3)
		
		# After animation completes, optionally remove it
		tween.tween_callback(func(): doorway.queue_free())
	
func submit_number():
	print("Submitted: ", heldObject.name)
	if heldObject.name == "number_4":
		print("CORRECT! Opening door...")
		open_door()
		# Optionally: destroy or hide the submitted number
		heldObject.queue_free()
		heldObject = null
	else:
		print("WRONG! Try again.")
	
func handle_interaction():
	if heldObject != null:
		var distanceToPanel = heldObject.global_position.distance_to(puzzlePanel.global_position)
		if distanceToPanel < 2.0:
			submit_number()
			return  # Exit early, don't drop the objec
			
	if heldObject == null:
		if raycast.is_colliding():
			var hitObject = raycast.get_collider()
			if hitObject.is_in_group("interactable"):
				heldObject = hitObject
				heldObject.collision_layer = 16  # Object is on layer 3 (bit value 4)
				heldObject.collision_mask = 1
				heldObject.gravity_scale = 0
				
				heldObject.position=Vector3(0,0,-1.5)
	else:
		var dropPosition = heldObject.global_position
		heldObject.collision_layer = 4  # Object is on layer 3 (bit value 4)
		heldObject.collision_mask = 1
		heldObject.reparent(numberContainer)
		heldObject.global_position = dropPosition
		heldObject.gravity_scale = 1 
		heldObject = null

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	collision_layer = 2
	collision_mask = 1 + 4
	raycast.collision_mask = 1 + 4
	
	var panelNodes = get_tree().get_nodes_in_group("puzzle_panel")
	if panelNodes.size() > 0:
		puzzlePanel = panelNodes[0]
	
	# Find the doorway (adjust the path to match your scene)
	doorway = get_node("../doors/door01")
	
	
func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * mouseSensitivity)
		cameraRotationX += -event.relative.y * mouseSensitivity
		cameraRotationX = clamp(cameraRotationX, deg_to_rad(-80), deg_to_rad(80))
		head.rotation.x = cameraRotationX
		
	if event.is_action_pressed("interact"):
		handle_interaction()
	
func _physics_process(delta):
		
	var inputDir = Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	var direction = (transform.basis * Vector3(inputDir.x, 0, inputDir.y)).normalized()
	velocity.x = direction.x * movementSpeed
	velocity.z = direction.z * movementSpeed
	
	if heldObject != null:
		var targetPos = head.global_position + (-head.global_transform.basis.z * 1.5)
		var objectDirection = targetPos - heldObject.global_position
		var objectCollision = heldObject.move_and_collide(objectDirection*delta*20)
		heldObject.global_rotation = head.global_rotation
		heldObject.linear_velocity = Vector3.ZERO
		heldObject.angular_velocity - Vector3.ZERO
		# Match camera's rotation
		
		
		
		
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = jumpVelocity
		
	move_and_slide()
