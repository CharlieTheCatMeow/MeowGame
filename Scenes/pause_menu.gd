extends CanvasLayer

@onready var PauseMenu: VBoxContainer = $PauseMenu
@onready var SettingsMenu: VBoxContainer = $Settings

@onready var clickSound: AudioStreamPlayer = $ClickSound

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
			clickSound.stop()
			clickSound.play()
			await await get_tree().create_timer(0.03, false).timeout

func toggle_pause_menu():
	var toggle_pause = not get_tree().paused
	get_tree().paused = toggle_pause
	visible = toggle_pause
	PauseMenu.visible = true
	if toggle_pause:
		previous_mouse_mode = Input.mouse_mode
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		Global.timer_paused = true
		SettingsMenu.hide()
	else:
		Input.mouse_mode = previous_mouse_mode
		Global.timer_paused = false
		SettingsMenu.hide()


func _on_resume_pressed() -> void:
	toggle_pause_menu()
	clickSound.stop()
	clickSound.play()
	await await get_tree().create_timer(0.03, false).timeout


func _on_menu_pressed() -> void:
	toggle_pause_menu()
	get_tree().change_scene_to_file("res://Scenes/title_screen.tscn")
	clickSound.stop()
	clickSound.play()
	await await get_tree().create_timer(0.03, false).timeout


func _on_settings_pressed() -> void:
	PauseMenu.hide()
	SettingsMenu.visible = true

func _on_meow_pressed() -> void:
	BgmPlayer.toggle_music()
	
func _on_return_pressed() -> void:
	PauseMenu.visible = true
	SettingsMenu.visible = false
