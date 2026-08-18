extends StaticBody2D

var random_position = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	random_position.randomize()
	random_position.seed = Time.get_ticks_usec() + get_instance_id()
	self.global_position.x = random_position.randf_range(50, get_viewport_rect().size.x - 346)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
