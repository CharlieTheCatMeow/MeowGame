extends CharacterBody2D
@onready var particles = $Particles

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

signal died

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = JUMP_VELOCITY
		var max_angle = deg_to_rad(30.0)
		var target_angle = clamp(velocity.angle(), -max_angle, max_angle)
		rotation = lerp_angle(rotation, target_angle, delta * 10)
		particles.restart()
		particles.emitting = true
		
	if velocity.length() > 0:
		var max_angle = deg_to_rad(30.0)
		var target_angle = clamp(velocity.angle(), -max_angle, max_angle)
		rotation = lerp_angle(rotation, target_angle, delta * 3)

	move_and_slide()
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()
		
		if collider.is_in_group("obstacles"):
			died.emit()
