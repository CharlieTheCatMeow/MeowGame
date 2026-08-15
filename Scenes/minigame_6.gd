extends Node2D
@onready var themed_timer: Node2D = $CanvasLayer/timer
@onready var audio_player: AudioStreamPlayer = $AudioStreamPlayer
# ^^^ You dragged this in the scene by the way 



var runes_collected = 0 # just keeping track of runes collected
var timer_end = false # boolean (true or false) stating whether the timer ended

func _ready() -> void:

		#Below you can see that I have a function that I named. I grab a 
		#function from it that was created in it's script and use `await` to 
		# tell the script to wait for a signal, or for when a function finshes

	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	await themed_timer.Timer(10.0) #accessing a function from this node
	#after this is compeleted...
	timer_end = true # now we're saying "oh ye you ran out of time"

func _process(delta: float) -> void: # running every frame brochacho
	if timer_end: # if the timer does end...
		Global.minigames_done -=1 #go back a minigame
		Global.lives -= 1 # lose ur lives
		get_tree().change_scene_to_file("res://Scenes/level_scene.tscn") # back to intermission
		



func _on_rune_runes_collected() -> void:
	audio_player.play()
	await get_tree().create_timer(1.0).timeout
	if Global.minigames_done >= Global.minigames_amount: # we access a global script and see how many minigames have been compeleted
			get_tree().change_scene_to_file("res://Scenes/done_screen.tscn") # change current play scene into another, but you make your own finish screen in a later challenge, dont worry abt this rn
	else:
		get_tree().change_scene_to_file("res://Scenes/level_scene.tscn") # go back to the intermission scene
