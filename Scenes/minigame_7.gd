extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_player_raft_player_died() -> void:
	Global.minigames_done -=1 #go back a minigame
	Global.lives -= 1 # lose ur lives
	get_tree().change_scene_to_file("res://Scenes/level_scene.tscn") # back to intermission
