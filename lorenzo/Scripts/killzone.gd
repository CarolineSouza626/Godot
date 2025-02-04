extends Area2D

@onready var timer: Timer = $Timer
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _on_body_entered(body):
	print('You died') # Replace with function body.
	Engine.time_scale = 0.5
	body.get_node('CollisionShape2D').queue_free()
	timer.start()
	
func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
