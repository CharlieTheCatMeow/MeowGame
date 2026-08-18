extends StaticBody2D

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("spike_obstacles")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position.x = global_position.x - 400 * delta
	
func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	rng.randomize()
	self.global_position.x = get_viewport_rect().size.x + rng.randf_range(0, get_viewport_rect().size.x / 2)
