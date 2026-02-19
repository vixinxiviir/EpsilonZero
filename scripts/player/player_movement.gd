extends CharacterBody3D


@onready var head = $head

var movementSpeed = 5
var jumpVelocity = 4.5
var mouseSensitivity = .005
var minAngle = -1.5
var maxAngle = 1.5
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")



func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	collision_layer = 2
	collision_mask = 1 + 4
	
	
	
func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * mouseSensitivity)
		head.rotate_x(-event.relative.y * mouseSensitivity)
		head.rotation.x = clamp(head.rotation.x, minAngle, maxAngle)
		
	
func _physics_process(delta):
		
	var inputDir = Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	var direction = Vector3.ZERO
	direction = transform.basis.z * inputDir.y + transform.basis.x * inputDir.x
	if direction != Vector3.ZERO:
		direction = direction.normalized()
		velocity.x = direction.x * movementSpeed
		velocity.z = direction.z * movementSpeed
	else:
		velocity.x = 0
		velocity.z = 0
	
		
		
		
		
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = jumpVelocity
		
	move_and_slide()
