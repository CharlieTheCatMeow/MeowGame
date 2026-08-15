extends Node2D
@onready var themed_timer: Node2D = $timer
@onready var player: Area2D = $PlayerBasket
@onready var audio_player = $AudioStreamPlayer

var timer_end = false
var fruits_collected = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	await themed_timer.Timer(10.0)
	timer_end = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:		
	if fruits_collected == 8:
		await get_tree().create_timer(1.0).timeout
		if Global.minigames_done >= Global.minigames_amount:
			get_tree().change_scene_to_file("res://Scenes/done_screen.tscn")
		else:
			get_tree().change_scene_to_file("res://Scenes/level_scene.tscn")
		return
	if timer_end:
		Global.minigames_done -=1 #go back a minigame
		Global.lives -= 1 # lose ur lives
		var tree = get_tree()
		if tree:
			tree.change_scene_to_file("res://Scenes/level_scene.tscn") # back to intermission	     

func _on_player_basket_collected() -> void:
	audio_player.play()
	fruits_collected += 1
