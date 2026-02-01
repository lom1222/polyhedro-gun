extends AnimatableBody3D

# Minimum speed of the boolet in meters per second.
@export var min_speed = 10
# Maximum speed of the boolet in meters per second.
@export var max_speed = 18

func _physics_process(_delta):
	move_and_collide(constant_linear_velocity)

# This function will be called from the Main scene.
func initialize(start_position, player_position):
	
	look_at_from_position(start_position, player_position, Vector3.UP)
	
	rotate_y(randf_range(-PI / 4, PI / 4))

	var random_speed = randi_range(min_speed, max_speed)
	
	constant_linear_velocity = Vector3.FORWARD * random_speed
	
	constant_linear_velocity = constant_linear_velocity.rotated(Vector3.UP, rotation.y)

func _on_visible_on_screen_notifier_3d_screen_exited():
	queue_free()
