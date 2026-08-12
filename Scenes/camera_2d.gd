extends Camera2D

@export var player: CharacterBody2D
@export var fixed_position_x = 576

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player:
		if player.global_position.y < global_position.y:
			global_position.y = player.global_position.y
	global_position.x = fixed_position_x
