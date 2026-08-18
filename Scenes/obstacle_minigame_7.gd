extends Area2D

@onready var texture = $ColorRect

const SCREEN_WIDTH = 1152
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("raft_obstacles") # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position.y += delta * 400


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	rng.randomize()
	global_position = Vector2(rng.randf_range(SCREEN_WIDTH / 4, SCREEN_WIDTH / 4 * 3 - texture.size.x), -100)
