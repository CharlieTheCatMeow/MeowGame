extends HSlider

@onready var master_bus_index: int = AudioServer.get_bus_index("Master")

const SETTINGS_PATH := "user://settings.cfg"
const SECTION := "audio"
const KEY := "master_volume"

var _is_ready := false

func _ready() -> void:
	var saved_value := _load_volume()
	_is_ready = false
	value = saved_value
	_is_ready = true
	AudioServer.set_bus_volume_db(master_bus_index, linear_to_db(saved_value))

func _on_value_changed(value: float) -> void:
	if not _is_ready:
		return
	var db_value = linear_to_db(value)
	AudioServer.set_bus_volume_db(master_bus_index, db_value)
	_save_volume(value)

func _load_volume() -> float:
	var config := ConfigFile.new()
	var err := config.load(SETTINGS_PATH)
	if err != OK:
		return 1.0
	return config.get_value(SECTION, KEY, 1.0)

func _save_volume(v: float) -> void:
	var config := ConfigFile.new()
	config.load(SETTINGS_PATH) 
	config.set_value(SECTION, KEY, v)
	config.save(SETTINGS_PATH)
