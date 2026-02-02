extends Area3D

func _ready():
	# Connect to itself: "When anything leaves ME, run this function"
	self.area_exited.connect(_on_area_exited)

func _on_area_exited(area: Area3D):
	# This checks EVERY area that leaves, regardless of which enemy spawned it
	if area.is_in_group("Projectiles"):
		area.queue_free()
