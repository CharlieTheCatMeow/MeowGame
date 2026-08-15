extends CharacterBody2D
@onready var player_sprite = $PlayerSprite
@onready var jump_buffer = $JumpBufferTimer

const SPEED = 300.0
const JUMP_VELOCITY = -600
const JUMP_CUT_MULTIPLIER = 0.5

signal player_died()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept"):
		jump_buffer.start()
	if is_on_floor() and not jump_buffer.is_stopped():
		velocity.y = JUMP_VELOCITY
		player_sprite.play("jumping")
		jump_buffer.stop()
	if Input.is_action_just_released("ui_accept") and velocity.y < 0:
		velocity.y *= JUMP_CUT_MULTIPLIER

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if is_on_floor():
		player_sprite.play("running")
	else:
		player_sprite.play("jumping")
	if direction > 0:
		player_sprite.flip_h = false
	if not is_on_floor():
		player_sprite.play("jumping")

	move_and_slide()
	
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()
		
		if collider.is_in_group("spike_obstacles"):
			player_died.emit()
