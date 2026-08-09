extends Node2D
@onready var obstacle_group = $ObstacleGroup
@onready var obstacle_group_2 = $ObstacleGroup2
@onready var obstacle_group_3 = $ObstacleGroup3
@onready var themed_timer: Node2D = $timer
@onready var player = $PlayerFlappyBird

@export var obstacle_speed: float = 300.0

var timer_end = false
var player_died = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	player.died.connect(on_player_died)
	await themed_timer.Timer(10.0)
	timer_end = true

func on_player_died() -> void:
	if player_died:
		return
	player_died = true
	Global.minigames_done -=1 #go back a minigame
	Global.lives -= 1 # lose ur lives
	var tree = get_tree()
	if tree:
		tree.change_scene_to_file("res://Scenes/level_scene.tscn") # back to intermission

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var movement_vector = Vector2(-obstacle_speed * delta, 0)
	obstacle_group.position += Vector2(-5, 0)
	obstacle_group_2.position += Vector2(-5, 0)
	obstacle_group_3.position += Vector2(-5, 0)
	
	if timer_end:
		if Global.minigames_done >= Global.minigames_amount:
			get_tree().change_scene_to_file("res://Scenes/done_screen.tscn")
		else:
			get_tree().change_scene_to_file("res://Scenes/level_scene.tscn")
		return       
