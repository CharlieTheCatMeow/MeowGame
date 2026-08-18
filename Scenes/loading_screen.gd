extends Node2D

@export var objects_to_preload: Array[PackedScene] = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for object in objects_to_preload:
		var instance = object.instantiate()
		add_child(instance)
		
		_trigger_particles(instance)
		
	await get_tree().process_frame
	await get_tree().process_frame
	await get_tree().process_frame
	await get_tree().process_frame
	
	for child in get_children():
		child.queue_free()
	
	get_tree().change_scene_to_file("res://Scenes/title_screen.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _trigger_particles(node: Node):
	if node is GPUParticles2D or node is GPUParticles3D:
		node.emitting = true
		node.restart()
		
	for child in node.get_children():
		_trigger_particles(child)
