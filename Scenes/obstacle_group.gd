extends Marker2D

var random_position = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	self.global_position.x = get_viewport_rect().size.x
	self.global_position.y = random_position.randf_range(150, get_viewport_rect().size.y - 150)
