extends StaticBody2D

const PADDLE_WIDTH: float = 192.0
const SCREEN_WIDTH: float = 1152.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var mouse_pos_x = get_viewport().get_mouse_position().x
	var target_x = mouse_pos_x - (PADDLE_WIDTH / 2.0)
	var max_x = SCREEN_WIDTH - PADDLE_WIDTH
	
	position.x = clampf(target_x, 0.0, max_x)
