extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_play_again_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/title_screen.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()
