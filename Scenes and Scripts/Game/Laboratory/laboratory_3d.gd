extends Node3D

var mouse_on = false
var outline_shader = preload("res://Shader/outline.tres")
var no_shader = preload("res://Shader/no_shader.tres")
var cutscene = true

func _ready():
	if Global.lab_cutscene_played == false:
		$CameraPan.play("camera pan")
		Global.cutscene_playing = true
		Global.moving_allowed = false
	elif Global.lab_cutscene_played == true:
		$Objects/Chameleon.queue_free()
		$CameraPan.queue_free()
	#var playback: AudioStreamPlaybackPolyphonic
	#$Ambience.play()
	#playback = $Ambience.get_stream_playback()
	#playback.play_stream(load("res://Assets/Sound/SFX/Ambience/Tutorial/sfx_tutorial_ambience_birds_var1.mp3"))
	#playback.play_stream(load("res://Assets/Sound/SFX/Ambience/Tutorial/sfx_tutorial_ambience_creaks_var1.mp3"))
	#playback.play_stream(load("res://Assets/Sound/SFX/Ambience/Tutorial/sfx_tutorial_ambience_wind_var1.mp3"))
	
	MusicController._play_music("titration_trap", "laboratory")

func _process(delta):
	if !cutscene:
		if $Player.position.x <= 19.5 and $Player.position.x >= -19.5:
			$Camera3D.position.x = $Player.position.x

func _on_door_area_3d_body_entered(body):
	if body.get_name() == "Player":
		get_tree().change_scene_to_file("res://Scenes and Scripts/Game/Map/map.tscn")



func _on_camera_pan_animation_finished(anim_name):
	cutscene = false
	Global.lab_cutscene_played = true
	Global.cutscene_playing = false
	Global.moving_allowed = true
	$Objects/Chameleon.queue_free()
	$CameraPan.queue_free()
