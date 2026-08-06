extends CharacterBody2D
@onready var player_sprite = $PlayerSprite

const SPEED = 300.0
const JUMP_VELOCITY = -500


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		player_sprite.play("jumping")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
		if is_on_floor():
			player_sprite.play("running")
		else:
			player_sprite.play("jumping")
		if direction > 0:
			player_sprite.flip_h = false
		else:
			player_sprite.flip_h = true
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if is_on_floor():
			player_sprite.play("idle")
		else:
			player_sprite.play("jumping")

	move_and_slide()


func _on_rune_garlic_collected() -> void:
	pass # Replace with function body.
