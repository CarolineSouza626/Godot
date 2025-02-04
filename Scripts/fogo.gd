extends KinematicBody2D


var speed = 5



func _ready():
	look_at(get_local_mouse_position())
	#pass # Replace with function body.



func _process(_delta):
	var collision_info = move_and_collide(Vector2(1,0).rotated(rotation)*speed)
	if collision_info:
		if "inimigo" in collision_info.collider.name:
			collision_info.collider.set("vida", collision_info.collider.vida - 10)
			queue_free()
		if "block" in collision_info.collider.name:	
			queue_free()

#	pass
