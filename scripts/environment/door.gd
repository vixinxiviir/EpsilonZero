extends Node3D

# Door animation settings
@export var slide_direction: Vector3 = Vector3(0, 2, 0)  # Slide up
@export var slide_duration: float = 1.5
@export var remove_after_opening: bool = true

var is_open: bool = false

func open():
	if is_open:
		return
	
	is_open = true
	print("Door opening...")
	
	var tween = create_tween()
	tween.tween_property(self, "position", position + slide_direction, slide_duration)
	
	if remove_after_opening:
		tween.tween_callback(func(): queue_free())
	
