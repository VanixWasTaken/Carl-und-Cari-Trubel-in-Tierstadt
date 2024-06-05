extends Node2D

var mouse_on = false
var outline_shader = preload("res://Shader/outline.tres")
var no_shader = preload("res://Shader/no_shader.tres")

func _ready():
	var playback: AudioStreamPlaybackPolyphonic
	$Ambience.play()
	playback = $Ambience.get_stream_playback()
	playback.play_stream(load("res://Assets/Sound/SFX/Ambience/Laboratory/sfx_laboratory_ambience_faucet_var1.mp3"))
	playback.play_stream(load("res://Assets/Sound/SFX/Ambience/Laboratory/sfx_laboratory_ambience_ventilation_var1.mp3"), 0, -12)

func _process(delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) && mouse_on == true:
		$Laborraum.visible = false

func _on_labor_area_2d_mouse_entered():
	mouse_on = true


func _on_labor_area_2d_mouse_exited():
	mouse_on = false
