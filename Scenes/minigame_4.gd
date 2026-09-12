extends Node2D
@onready var themed_timer: Node2D = $timer
@onready var player: Area2D = $PlayerBasket
@onready var audio_player = $AudioStreamPlayer
@onready var fruit_container: VBoxContainer = $FruitCountContainer

@onready var fruit_1: RigidBody2D = $Fruit
@onready var fruit_2: RigidBody2D = $Fruit2

var fruit_counter: Array[TextureRect] = []

var timer_end = false
var fruits_collected = 0
var scene_changed = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	for child in fruit_container.get_children():
		if child is TextureRect:
			fruit_counter.append(child)
	for child in fruit_counter:
		child.hide()
	await themed_timer.Timer(10.0)
	timer_end = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if fruits_collected == 8:
		if scene_changed:
			return
		scene_changed = true
		await get_tree().create_timer(1.0).timeout
		if Global.minigames_done >= Global.minigames_amount:
			get_tree().change_scene_to_file("res://Scenes/done_screen.tscn")
		else:
			get_tree().change_scene_to_file("res://Scenes/level_scene.tscn")
		return
	if timer_end:
		if scene_changed:
			return
		scene_changed = true
		Global.minigames_done -=1 #go back a minigame
		Global.lives -= 1 # lose ur lives
		var tree = get_tree()
		if tree:
			tree.change_scene_to_file("res://Scenes/level_scene.tscn") # back to intermission	     

func _on_player_basket_collected() -> void:
	audio_player.play()
	fruits_collected += 1
	
	var fruit_counter_index: int = fruit_counter.size() - fruits_collected
	if fruit_counter_index >= 0 and fruit_counter_index <= fruit_counter.size():
		fruit_counter[fruit_counter_index].show()
	
