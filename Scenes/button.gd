extends TextureButton
@onready var parent = $".."
@onready var particles = $CPUParticles2D
@onready var audio_player = $AudioStreamPlayer

func _on_pressed() -> void: #YOU NEED TO CONNECT THIS SIGNAL FROM THE TAB NEXT TO INSPECTOR!!
	self_modulate.a = 0.0
	disabled = true
	particles.emitting = true
	parent.buttons_pressed += 1
	audio_player.play()
