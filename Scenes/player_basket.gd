extends Area2D

const PADDLE_WIDTH: float = 96.0
const SCREEN_WIDTH: float = 1152.0

var random_position = RandomNumberGenerator.new()

signal collected()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var mouse_pos_x = get_viewport().get_mouse_position().x
	var target_x = mouse_pos_x - (PADDLE_WIDTH / 2.0)
	var max_x = SCREEN_WIDTH - PADDLE_WIDTH
	
	position.x = clampf(target_x, 0.0, max_x)

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("fruits"):
		# Hide and disable the RigidBody2D
		body.global_position.y = -100
		random_position.randomize()
		body.global_position.x = random_position.randf_range(24, 1152 - 24)
		body.linear_velocity = Vector2.ZERO
		body.angular_velocity = PI
		collected.emit()
