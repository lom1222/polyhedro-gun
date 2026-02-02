extends Area3D

var speed = 0
var damage = 0

func _physics_process(delta):
	global_position += -global_transform.basis.z * speed * delta
	
func initialize(start_pos, player_pos, bullet_speed, bullet_damage, random_offset):
	speed = bullet_speed
	damage = bullet_damage
	look_at_from_position(start_pos, player_pos, Vector3.UP)
	rotate_y(randf_range(-random_offset, random_offset))
