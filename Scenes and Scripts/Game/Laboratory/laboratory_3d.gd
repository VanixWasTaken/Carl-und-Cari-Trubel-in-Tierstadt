extends Node3D

var first_dialogue = preload("res://Scenes and Scripts/Dialog/Laboratory Dialog/laboratory_dialog_1.tscn")
var second_dialog = preload("res://Scenes and Scripts/Dialog/Laboratory Dialog/laboratory_dialog_2.tscn")

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
	
	#Camera is glitching out after reentering the scene (didnt work at all before)
	if Global.lab_cutscene_played == true:
		cutscene = false
	
	
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
	
	if Global.return_laboratory_1 == true:
		picked_up_scale = true
		picked_up_reagenz_glasses = true
		picked_up_vessel = true
		$Objects/Chameleon.position = Vector3(-22,5.982,-2.072)
		#sound disablen habs aber nich hinbekommen#
	


func _on_door_area_3d_body_entered(body):
	if body.get_name() == "Player":
		get_tree().change_scene_to_file("res://Scenes and Scripts/Game/Map/map.tscn")



func _on_camera_pan_animation_finished(anim_name):
	cutscene = false
	Global.lab_cutscene_played = true
	Global.cutscene_playing = false
	Global.dialog_playing = true
	Global.moving_allowed = false
	
	$"NPC Chameleon".visible = true
	
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




func _on_dialog_area_body_entered(body):
	if body.get_name() == "Player":
		var dialogue_instance = second_dialog.instantiate()
		$"NPC Chameleon".add_child(dialogue_instance)
		Global.dialog_playing = true
