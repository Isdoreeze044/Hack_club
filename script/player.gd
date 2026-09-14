extends CharacterBody2D

var bullet_scene = preload("res://scene/bullet.tscn")
@onready var player: CharacterBody2D = $"."
const speed = 200
@onready var shoot_point: Node2D = $shoot_point


func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	
	velocity.x = Input.get_axis("left","right")* speed
	velocity.y = Input.get_axis("up","down")* speed
	velocity = lerp(get_real_velocity(),velocity,0.1)
	
	
	if Input.is_action_just_pressed("shoot"):
		var bullet = bullet_scene.instantiate()
		bullet.position = shoot_point.position
		add_child(bullet)
		bullet.direction = (get_global_mouse_position()-player.global_position).normalized()
		
	
	
	
	
	move_and_slide()
