extends Area2D

const RAFT_WIDTH: float = 64.0
const SCREEN_WIDTH: float = 1152.0

signal player_died

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var mouse_pos_x = get_viewport().get_mouse_position().x
	var max_x = SCREEN_WIDTH / 4 * 3 - RAFT_WIDTH / 2
	var min_x = SCREEN_WIDTH / 4 + RAFT_WIDTH / 2
	
	position.x = clampf(mouse_pos_x, min_x, max_x)
	
	


func _on_area_entered(area: Area2D) -> void:
	player_died.emit()
