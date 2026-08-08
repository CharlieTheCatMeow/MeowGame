extends Node2D
@onready var enemy_pong = $EnemyPong
@onready var pong_ball = $PongBall
@onready var check_loss = $CheckLoss
@onready var themed_timer: Node2D = $timer

var timer_end = false
var player_died = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	await themed_timer.Timer(15.0)
	timer_end = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if pong_ball.position.x - 192 / 2 >= 0 and pong_ball.position.x - 192 / 2 < 1152 - 192:
		enemy_pong.position.x = pong_ball.position.x - 192 / 2
		
	if timer_end:
		if Global.minigames_done >= Global.minigames_amount:
			get_tree().change_scene_to_file("res://Scenes/done_screen.tscn")
		else:
			get_tree().change_scene_to_file("res://Scenes/level_scene.tscn")
		return     


func _on_check_loss_body_entered(body: Node2D) -> void:
	if player_died:
		return
	player_died = true
	Global.minigames_done -=1 #go back a minigame
	Global.lives -= 1 # lose ur lives
	var tree = get_tree()
	if tree:
		tree.change_scene_to_file("res://Scenes/level_scene.tscn") # back to intermission
