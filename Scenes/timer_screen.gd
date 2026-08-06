extends Node2D
@onready var lives_container: HBoxContainer = $LivesContainer
@onready var life: TextureRect = $LivesContainer/Life
@onready var life_2: TextureRect = $LivesContainer/Life2
@onready var life_3: TextureRect = $LivesContainer/Life3
@onready var life_4: TextureRect = $LivesContainer/Life4
@onready var life_5: TextureRect = $LivesContainer/Life5
@onready var level: RichTextLabel = $Level
@onready var timer: RichTextLabel = $Timer

var time

func _ready() -> void:
	await Timer(2.0) # using the function created
	
	if Global.minigames_done < 3: # if you havent completed 3 minigames yet 
		Global.minigames_done = Global.minigames_done +1
		get_tree().change_scene_to_file("res://Scenes/minigame_" + str(Global.minigames_done) + ".tscn") # changes your scene by arranging this frankenstein path. 
# Above, your script is being told to go to the next minigame. If the 
# current minigame is Level 1, then you would be on minigame 1. If you 
# complete that level, you have the minigames_done add one, and then you 
# look for the scene titled `minigame_` and then whatever minigame number 
# should be next. Make sure you name your minigame saves appropriately.

	else:
		get_tree().change_scene_to_file("res://Scenes/title_screen.tscn") # changes your scene
	

func _process(delta: float) -> void: # runs EVERY FRAME
	match Global.lives: # asks or checks if lives is equal to one of 
#these values, cool hack. by the way this is a horrid way to illustrate the 
#lives visually so later you can always find alternative code. Now, dw abt it.

		4:
			life.hide()
		3:
			life.hide()
			life_2.hide()
		2:
			life.hide()
			life_2.hide()
			life_3.hide()
		1:
			life.hide()
			life_2.hide()
			life_3.hide()
			life_4.hide()
		0:
			lives_container.hide() # just hides everything
			get_tree().change_scene_to_file("res://Scenes/lose_screen.tscn")
			
	
	timer.text = "[center]" + str(time) + "[/center]" # make the text reflect the value of the time variable. this makes names easier. the str() converts the int to a String
	level.text = "[center]" + "Level " + str(Global.minigames_done + 1) + "[/center]" # this tells you want minigame you're on using concatenation (google the word yo)

func Timer(start_time: float): # making a new function for timer countdown!
	# we want the timer to go down, and when it reaches 0 it transitions 
	# to the next scene!
	
	time = start_time # make the timer, which is reflected through the timer text, start at your desired number
	
	while time > 0.0: # run if timer hasnt reached 0
		await wait(0.1) # asks script to wait on this function. the 'wait' name for the function does nothing here, as await is just telling the scrpit to wait for the function to complete before progressing
		time -= 0.1 # remove 0.1
		# progressively get the value smaller and smaller
	
	#when timer reaches 0
	return

func wait(seconds: float) -> void: # write this simple function out for wait!
	await get_tree().create_timer(seconds).timeout # makes u wait, dw abt this being complex '''
