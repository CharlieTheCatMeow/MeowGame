extends Node2D
@onready var themed_timer: Node2D = $timer

var buttons_pressed := 0
var timer_end = false

func _ready() -> void:
	# start the countdown; when it finishes timer_end becomes true
	await themed_timer.Timer(7.0)
	timer_end = true

func _process(delta: float) -> void:
	if buttons_pressed == 10:
		if Global.minigames_done >= 3:
			get_tree().change_scene_to_file("res://Scenes/done_screen.tscn")
		else:
			get_tree().change_scene_to_file("res://Scenes/level_scene.tscn")
		return               # stop further processing this frame

	elif timer_end:
		Global.lives -= 1
		Global.minigames_done -= 1
		# reset so a fresh timer can be started if the scene is re‑entered
		timer_end = false
		get_tree().change_scene_to_file("res://Scenes/level_scene.tscn")
