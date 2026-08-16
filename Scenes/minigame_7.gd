extends Node2D
@onready var themed_timer: Node2D = $timer

var timer_end = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	await themed_timer.Timer(15.0)
	timer_end = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if timer_end:
		if Global.minigames_done >= Global.minigames_amount: # we access a global script and see how many minigames have been compeleted
				get_tree().change_scene_to_file("res://Scenes/done_screen.tscn") # change current play scene into another, but you make your own finish screen in a later challenge, dont worry abt this rn
		else:
			get_tree().change_scene_to_file("res://Scenes/level_scene.tscn") # go back to the intermission scene


func _on_player_raft_player_died() -> void:
	Global.minigames_done -=1 #go back a minigame
	Global.lives -= 1 # lose ur lives
	get_tree().change_scene_to_file("res://Scenes/level_scene.tscn") # back to intermission
