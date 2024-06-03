extends Node3D

# actual dialogs
var first_dialogue = preload("res://Scenes and Scripts/Dialog/Laboratory Dialog/laboratory_dialog_1.tscn")
var second_dialog = preload("res://Scenes and Scripts/Dialog/Laboratory Dialog/laboratory_dialog_2.tscn")
var third_dialog = preload("res://Scenes and Scripts/Dialog/Laboratory Dialog/laboratory_dialog_3.tscn")
var fourth_dialog = preload("res://Scenes and Scripts/Dialog/Laboratory Dialog/laboratory_dialog_4.tscn")
var fifth_dialog = preload("res://Scenes and Scripts/Dialog/Laboratory Dialog/laboratory_dialog_5.tscn")
var player
var mouse_on = false
var outline_shader = preload("res://Shader/outline.tres")
var no_shader = preload("res://Shader/no_shader.tres")
var cutscene = true
var picked_up_scale = false
var picked_up_reagenz_glasses = false
var picked_up_vessel = false
var picked_up_chemicals = false
@onready var map_scene = preload("res://Scenes and Scripts/Game/Map/map.tscn")

func _ready():
	player = get_tree().get_first_node_in_group("Player")
	if Global.return_laboratory_1:
		Global.lab_cutscene_played == true
		cutscene = false
		$Objects/Shelf/Scale.queue_free()
		$Objects/Sink/Vessel.queue_free()
		$CameraPan/MouseClickBlock.queue_free()
		$Objects/Chameleon.queue_free()
		$"NPC Chameleon".visible = true
		$Objects/Chameleon.queue_free()
		$NavigationRegion3D/Walls/WallRight/CutsceneFootsteps.queue_free()
		$NavigationRegion3D/Walls/WallRight/CutsceneDoorOpen.queue_free()
		if !Global.return_laboratory_2 && !Global.return_laboratory_3:
			$Player.global_position = Vector3(0.285038, 2.349433, 4.709138)
			$"NPC Chameleon/AnimatedSprite3D".play("idle")
		elif Global.return_laboratory_2 && !Global.return_laboratory_3:
			$Player.global_position = Vector3(-27.47779, 2.349433, 2.097231)
			$"NPC Chameleon/AnimatedSprite3D".play("idle")
		elif Global.return_laboratory_2 && Global.return_laboratory_3:
			$Player.global_position = Vector3(-12.14836, 2.349433, -2.04137)
			$"NPC Chameleon/AnimatedSprite3D".play("visible")

	elif !Global.return_laboratory_1:
		$"NPC Chameleon/AnimatedSprite3D".play("idle")
		if Global.lab_cutscene_played == false:
			Global.lab_cutscene_played = true
			$CameraPan.play("camera pan")
			Global.cutscene_playing = true
			Global.moving_allowed = false
			MusicController._play_music("titration_trap", "laboratory")
		
		#Camera is glitching out after reentering the scene (didnt work at all before)
	if Global.lab_cutscene_played == true:
		cutscene = false
	
	
	#var playback: AudioStreamPlaybackPolyphonic
	#$Ambience.play()
	#playback = $Ambience.get_stream_playback()
	#playback.play_stream(load("res://Assets/Sound/SFX/Ambience/Tutorial/sfx_tutorial_ambience_birds_var1.mp3"))
	#playback.play_stream(load("res://Assets/Sound/SFX/Ambience/Tutorial/sfx_tutorial_ambience_creaks_var1.mp3"))
	#playback.play_stream(load("res://Assets/Sound/SFX/Ambience/Tutorial/sfx_tutorial_ambience_wind_var1.mp3"))
	

func _process(delta):
	if !cutscene:
		if $Player.position.x <= 19.5 and $Player.position.x >= -19.5:
			$Camera3D.position.x = $Player.position.x



func _on_door_area_3d_body_entered(body):
	if body.get_name() == "Player":
		player.play_fade_out()



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
	$NavigationRegion3D/Walls/WallRight/CutsceneDoorOpen.queue_free()
	$Camera3D/AudioListener3D.queue_free()
	$Objects/Chameleon.queue_free()
	$CameraPan.queue_free()


func _on_timer_timeout():
	$NavigationRegion3D/Walls/WallRight/CutsceneFootsteps.play()
	$NavigationRegion3D/Walls/WallRight/CutsceneFootsteps/Timer.wait_time = 0.45
	$NavigationRegion3D/Walls/WallRight/CutsceneFootsteps/Timer.start()

func _on_timer_2_timeout():
	var pp = 0
	if pp == 0:
		$NavigationRegion3D/Walls/WallRight/CutsceneDoorOpen.play()
		$NavigationRegion3D/Walls/WallRight/CutsceneDoorOpen/Timer2.wait_time = 2
		$NavigationRegion3D/Walls/WallRight/CutsceneDoorOpen/Timer2.start()
		pp += 1
	elif pp == 1:
		$NavigationRegion3D/Walls/WallRight/CutsceneDoorOpen.stream = load("res://Assets/Sound/SFX/Foley/Laboratory/sfx_laboratory_foley_doorclose_var1.mp3")
		$NavigationRegion3D/Walls/WallRight/CutsceneDoorOpen.play()


func _on_dialog_area_body_entered(body):
	if body.get_name() == "Player":
		if !Global.return_laboratory_1:
			var dialogue_instance = second_dialog.instantiate()
			$"NPC Chameleon".add_child(dialogue_instance)
			Global.dialog_playing = true
		elif Global.return_laboratory_1 && !Global.return_laboratory_2:
			var dialogue_instance = third_dialog.instantiate()
			$"NPC Chameleon".add_child(dialogue_instance)
			Global.dialog_playing = true
		elif Global.return_laboratory_1 && Global.return_laboratory_2 && !Global.return_laboratory_3:
			var dialogue_instance = fourth_dialog.instantiate()
			$"NPC Chameleon".add_child(dialogue_instance)
			Global.dialog_playing = true
		elif Global.return_laboratory_1 && Global.return_laboratory_2 && Global.return_laboratory_3:
			var dialogue_instance = fifth_dialog.instantiate()
			$"NPC Chameleon".add_child(dialogue_instance)
			Global.dialog_playing = true
			$Objects/Exit.global_position.y += 100


func change_scene():
	get_tree().change_scene_to_packed(map_scene)


func _on_exit_body_entered(body):
	if body.get_name() == "Player":
		player.play_fade_out()
