extends RigidBody2D

@onready var collision_shape = $CollisionShape2D

var collected = false
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if name == "Fruit":
		gravity_scale = 0.0
		await get_tree().create_timer(1.0).timeout
		gravity_scale = 0.5
	add_to_group("fruits")
	rng.randomize()
	global_position.x = rng.randf_range(24, 1152 - 24)
	angular_velocity = PI


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
