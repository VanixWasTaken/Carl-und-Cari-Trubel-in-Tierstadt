extends Node3D

var first_dialogue = preload("res://Scenes and Scripts/Dialog/Laboratory Dialog/laboratory_dialog_1.tscn")

var mouse_on = false
var outline_shader = preload("res://Shader/outline.tres")
var no_shader = preload("res://Shader/no_shader.tres")
var cutscene = true
var picked_up_scale = false
var picked_up_reagenz_glasses = false
var picked_up_vessel = false

func _ready():
	if Global.lab_cutscene_played == false:
		$CameraPan.play("camera pan")
		Global.cutscene_playing = true
		Global.moving_allowed = false
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
	Global.dialog_playing = true
	Global.moving_allowed = false
	
	var dialogue_instance = first_dialogue.instantiate()
	add_child(dialogue_instance)
	
	################# ALLE OBJEKTE DER CUTSCENE ENTFERNEN + AUDIOLISTENER WECHSELN #########################
	$Player/AudioListener3D.make_current()
	$NavigationRegion3D/Walls/WallRight/CutsceneFootsteps.queue_free()
	$Camera3D/AudioListener3D.queue_free()
	$Objects/Chameleon.queue_free()
	$CameraPan.queue_free()


func _on_timer_timeout():
	if !Global.lab_cutscene_played:
		$NavigationRegion3D/Walls/WallRight/CutsceneFootsteps.play()
		$NavigationRegion3D/Walls/WallRight/CutsceneFootsteps/Timer.wait_time = 0.45
		$NavigationRegion3D/Walls/WallRight/CutsceneFootsteps/Timer.start()
