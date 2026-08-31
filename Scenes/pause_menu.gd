extends CanvasLayer

var previous_mouse_mode: Input.MouseMode 

func _ready() -> void:
	hide()

func can_pause() -> bool:
	var scene_path = get_tree().current_scene.scene_file_path
	return "minigame_" in scene_path

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		if can_pause() or get_tree().paused:
			toggle_pause_menu()

func toggle_pause_menu():
	var toggle_pause = not get_tree().paused
	get_tree().paused = toggle_pause
	visible = toggle_pause
	if toggle_pause:
		previous_mouse_mode = Input.mouse_mode
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		Global.timer_paused = true
	else:
		Input.mouse_mode = previous_mouse_mode
		Global.timer_paused = false
