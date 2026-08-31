extends Node2D
@onready var timer: RichTextLabel = $timer

var time : float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	timer.text = str(snapped(time, 0.10)) # this makes names easier

func Timer(start_time: float): # making a new function for timer countdown!
	# we want the timer to go down, and when it reaches 0 it transitions 
	# to the next scene!
	
	time = start_time
	
	while time > 0.0:
		if Global.timer_paused:
			# Freeze here until unpaused — don't return!
			await get_tree().create_timer(0.05, false).timeout
			continue
		await wait(0.10)
		time = time - 0.10
		timer.text = str(snapped(time, 0.1))
	#when timer reaches 0
	return
	
	
func wait(seconds: float) -> void:
	if not is_inside_tree():
		return
	await get_tree().create_timer(seconds, false).timeout
