extends CharacterBody3D

@export var speed = 8
@export var fall_acceleration = 75

@export var player: Node3D

var target_velocity = Vector3.ZERO

func _process(_delta):
	
	var facing_direction = player.position
	facing_direction.y = position.y
	look_at(facing_direction)

func _physics_process(delta):
	
	var direction = (player.position - position)
	direction.y = 0
	direction = direction.normalized()
	
	target_velocity = direction * speed
	target_velocity.y = target_velocity.y - (fall_acceleration * delta)
	
	velocity = target_velocity
	
	move_and_slide()
