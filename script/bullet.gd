extends Area2D

var direction:Vector2
var speed = 40

func _process(delta: float) -> void:
	global_position +=direction * speed
	

func _on_timer_timeout() -> void:
	queue_free()
