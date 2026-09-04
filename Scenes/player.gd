extends CharacterBody2D
@onready var player_sprite = $PlayerSprite
@onready var jump_buffer = $JumpBufferTimer
@onready var coyote_time = $CoyoteTimeTimer

const SPEED = 300.0
const JUMP_VELOCITY = -550
const JUMP_CUT_MULTIPLIER = 0.5

var was_on_floor := false
var jumped_this_frame := false 

func _physics_process(delta: float) -> void:
	was_on_floor = is_on_floor()
	jumped_this_frame = false 

	if not was_on_floor:
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("ui_accept"):
		jump_buffer.start()

	var can_jump: bool = was_on_floor or not coyote_time.is_stopped()
	if can_jump and not jump_buffer.is_stopped():
		velocity.y = JUMP_VELOCITY
		player_sprite.play("jumping")
		jump_buffer.stop()
		coyote_time.stop()
		jumped_this_frame = true 
	if Input.is_action_just_released("ui_accept") and velocity.y < 0:
		velocity.y *= JUMP_CUT_MULTIPLIER

	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
		player_sprite.play("running" if was_on_floor else "jumping")
		player_sprite.flip_h = direction < 0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		player_sprite.play("idle" if was_on_floor else "jumping")

	if velocity.y > 0:
		velocity += get_gravity() * delta * 0.5

	if global_position.x < 0:
		global_position.x = 1152
	elif global_position.x > 1152:
		global_position.x = 0

	move_and_slide()

	if was_on_floor and not is_on_floor() and not jumped_this_frame:
		coyote_time.start()
