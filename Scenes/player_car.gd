extends CharacterBody2D

@export var max_speed: float = 500.0
@export var rotation_speed: float = 10
@export var friction: float = 800
@export var acceleration: float = 1200

func _physics_process(delta: float) -> void:
	var mouse_position = get_global_mouse_position()
	var distance_to_mouse = global_position.distance_to(mouse_position)
	
	var target_angle = global_position.angle_to_point(mouse_position)
	rotation = lerp_angle(rotation, target_angle, rotation_speed * delta)
	
	if global_position.distance_to(mouse_position) > 30:
		var direction = Vector2.RIGHT.rotated(rotation)
		velocity = velocity.move_toward(direction * max_speed, acceleration * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)

	move_and_slide()
