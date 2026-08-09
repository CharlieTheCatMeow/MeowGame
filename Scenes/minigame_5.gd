extends Node2D
@onready var themed_timer: Node2D = $timer
@onready var checkpoints = [$Checkpoint2, $Checkpoint3, $Checkpoint4, $Checkpoint5, $Checkpoint6, $Checkpoint]

var checkpoints_reached: int = 0
var timer_end = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for checkpoint in checkpoints:
		checkpoint.body_entered.connect(_on_checkpoint_body_entered.bind(checkpoint))
	await themed_timer.Timer(10.0) #accessing a function from this node
	#after this is compeleted...
	timer_end = true # now we're saying "oh ye you ran out of time"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if checkpoints_reached == checkpoints.size():
		if Global.minigames_done >= Global.minigames_amount:
			get_tree().change_scene_to_file("res://Scenes/done_screen.tscn")
		else:
			get_tree().change_scene_to_file("res://Scenes/level_scene.tscn")
		return
	if timer_end: # if the timer does end...
		Global.minigames_done -=1 #go back a minigame
		Global.lives -= 1 # lose ur lives
		get_tree().change_scene_to_file("res://Scenes/level_scene.tscn") # back to intermission

func _on_checkpoint_body_entered(body: Node2D, emitting_checkpoint: Area2D) -> void:
	if not body.is_in_group("player car"):
		return
	
	if checkpoints_reached >= checkpoints.size():
		return
		
	var next_checkpoint = checkpoints[checkpoints_reached]
	if emitting_checkpoint == next_checkpoint:
		checkpoints_reached += 1
		print(checkpoints_reached)
		emitting_checkpoint.set_deferred("monitoring", false)
