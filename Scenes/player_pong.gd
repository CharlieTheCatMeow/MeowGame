extends StaticBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var mouse_pos_x = get_viewport().get_mouse_position().x
	if mouse_pos_x >= 0 and mouse_pos_x <= 1152 - 192 / 2:
		self.position.x = mouse_pos_x - 192 / 2
	elif mouse_pos_x < 0:
		self.position.x = 0
	elif mouse_pos_x > 1152 - 192 / 2:
		self.position.x = 1152 - 192
