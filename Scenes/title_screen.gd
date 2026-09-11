extends Node2D

@onready var master_bus_index: int = AudioServer.get_bus_index("Master")
@onready var clickSound: AudioStreamPlayer = $ClickSound

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	var db_value = linear_to_db(0.5)
	AudioServer.set_bus_volume_db(master_bus_index, db_value)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_begin_pressed() -> void:
	clickSound.stop()
	clickSound.play()
	await await get_tree().create_timer(0.03, false).timeout
	get_tree().change_scene_to_file("res://Scenes/level_scene.tscn")
	Global.lives = 5
	Global.minigames_done = 0


func _on_quit_pressed() -> void:
	clickSound.stop()
	clickSound.play()
	await await get_tree().create_timer(0.03, false).timeout
	get_tree().quit()


func _on_settings_pressed() -> void:
	clickSound.stop()
	clickSound.play()
	await await get_tree().create_timer(0.03, false).timeout
	get_tree().change_scene_to_file("res://Scenes/settings.tscn")
