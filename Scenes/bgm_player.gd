extends AudioStreamPlayer

@onready var master_bus_index: int = AudioServer.get_bus_index("Master")

const SETTINGS_PATH := "user://settings.cfg"
const SECTION := "audio"
const KEY := "master_volume"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var saved_value := _load_volume()
	AudioServer.set_bus_volume_db(master_bus_index, linear_to_db(saved_value))
	play()


# Called every frame. ''delta'' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func toggle_music():
	if playing:
		stop()
	else:
		play()

func _load_volume() -> float:
	var config := ConfigFile.new()
	var err := config.load(SETTINGS_PATH)
	if err != OK:
		return 1.0
	return config.get_value(SECTION, KEY, 1.0)
