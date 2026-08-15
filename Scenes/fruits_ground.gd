extends Area2D

var random_position = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("fruits"):
		body.global_position.y = -100
		body.global_position.x = random_position.randf_range(24, 1152 - 24)
		body.linear_velocity = Vector2.ZERO
