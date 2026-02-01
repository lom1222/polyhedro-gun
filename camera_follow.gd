extends Marker3D

@export var target: Node3D        # Drag your Player here
@export var offset: Vector3 = Vector3(0, 5, 5) # Distance behind/above player
@export var smooth_speed: float = 5.0          # Lower = smoother/lazier

func _physics_process(delta):
	if not target:
		return
		
	# Calculate the exact spot the camera WANTs to be
	var target_position = target.global_position + offset
	
	# Use lerp to move slowly toward that spot
	global_position = global_position.lerp(target_position, smooth_speed * delta)
	
