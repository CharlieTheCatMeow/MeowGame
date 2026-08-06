# the onreadys below run immediately at the start of the game, preventing 
# errors related to variable that haven't been defined yet in later scripts 

extends Node2D
@onready var player: CharacterBody2D = $"../Player" # grabs the parent node
@onready var self_area = $Area2D
@onready var player_area = $"../Player/Area2D"

# make a signal
signal runes_collected

func _process(delta: float) -> void: # this runs EVERY FRAME! 
	
	if player_area.overlaps_area(self_area): # checks if overlapping
		if self.visible:
			emit_signal("runes_collected") #signal broadcast
			self.hide() #removed from player sight; collected
		

# Because you're emitting a signal here, you need to connect that signal to 
# something to actually make it do a function. To do that, go to the
# `Signals` menu next to the inspector tab and double click it. 
# You would then need to connect it to the parent script or scene script
# and also name it something. You can name it ` garlic_collect` as seen 
# below, in the next script.
