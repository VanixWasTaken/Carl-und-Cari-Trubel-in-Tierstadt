extends Node3D

var first_dialog = preload("res://Scenes and Scripts/Dialog/Tutorial Dialoge/dialog_tutorial.tscn")
var second_dialogue = preload("res://Scenes and Scripts/Dialog/Tutorial Dialoge/dialog_tutorial_2.tscn")
var third_dialogue = preload("res://Scenes and Scripts/Dialog/Tutorial Dialoge/dialog_tutorial_3.tscn")
var got_key = false
@onready var map_scene = preload("res://Scenes and Scripts/Game/Map/map.tscn")
var player


func _ready():
	Global.cutscene_playing = true
	player = get_tree().get_first_node_in_group("Player")
	var playback: AudioStreamPlaybackPolyphonic
	$Ambience.play()
	$POI/Mouse.play("default")
	playback = $Ambience.get_stream_playback()
	playback.play_stream(load("res://Assets/Sound/SFX/Ambience/Tutorial/sfx_tutorial_ambience_birds.mp3"))
	playback.play_stream(load("res://Assets/Sound/SFX/Ambience/Tutorial/sfx_tutorial_ambience_creaks.mp3"))
	playback.play_stream(load("res://Assets/Sound/SFX/Ambience/Tutorial/sfx_tutorial_ambience_wind.mp3"))
	
	MusicController._play_music("learning_by_doing", "tutorial", -18)
	
	#                   BARKS
	var barkies = AudioStreamRandomizer.new()
	$Barks.stream = barkies
	for i in 3:
		var f = i + 1
		if Global.character == "Cari" || Global.character == "":
			barkies.add_stream(i, load("res://Assets/Sound/VO/Tutorial/Barks/Carl/NPC/vo_npc_bark_carl_tutorial01_var" + str(f) + ".mp3"))
		
		elif Global.character == "Carl":
			barkies.add_stream(i, load("res://Assets/Sound/VO/Tutorial/Barks/Cari/NPC/vo_npc_bark_cari_tutorial01_var" + str(f) + ".mp3"))
	
	#$UI/HelpButton/DialogTutorial.visible = false

func _process(delta):
	if $Player.position.x <= 19.5 and $Player.position.x >= -19.5:
		$Camera3D.position.x = $Player.position.x
	if Global.open_tutorial_door:
		$Objects/Door.rotation = (Vector3(0, 1.5707963268, 0))
		$Objects/Door.position = (Vector3(25, 6, -1))
		$Objects/DoorArea3D.position.z = -12
		$NavigationRegion3D/Objects/DoorAfterOpen/CollisionShape3D.disabled = false

func _on_door_area_3d_body_entered(body):
	if body.get_name() == "Player":
		player.play_fade_out()
		MusicController._fade_to_volume(-80, 1)

func _on_poi_sound_finished():
	await get_tree().create_timer(randf_range(5, 10)).timeout
	if !got_key:
		$"POI/POI Sound".play()

func _on_poi_area_body_entered(body):
	if body.get_name() == "Player":
		got_key = true
		$POI/AudioStreamPlayer3D.play()
		Global.tutorial_help_button_state += 1

func _on_audio_stream_player_3d_finished():
	$Key.queue_free()
	$POI.queue_free()
	var dialogue_instance = second_dialogue.instantiate()
	$"NPC Tutorial".add_child(dialogue_instance)
	$"NPC Tutorial/DialogeArea3D".position.y = 0.174


func _on_dialog_area_3d_body_entered(body):
	if body.get_name() == "Player":
		var dialogue_instance = third_dialogue.instantiate()
		$"NPC Tutorial".add_child(dialogue_instance)


func _on_dialog_area_3d_body_exited(body):
	if body.get_name() == "Player":
		$"NPC Tutorial/DialogeArea3D".queue_free()


#                                 BARKS
func _on_timer_timeout():
	
	if got_key:
		var playback = AudioStreamRandomizer.new()
		$Barks.stream = playback
		
		for i in 3:
			var f = i + 1
			if Global.character == "Cari" || Global.character == "":
				playback.add_stream(i, load("res://Assets/Sound/VO/Tutorial/Barks/Carl/NPC/vo_npc_bark_carl_tutorial02_var" + str(f) + ".mp3"))
			
			elif Global.character == "Carl":
				playback.add_stream(i, load("res://Assets/Sound/VO/Tutorial/Barks/Cari/NPC/vo_npc_bark_cari_tutorial02_var" + str(f) + ".mp3"))
			

	
	
	if !Global.dialog_playing:
		$Barks.play()
	
	$Barks/Timer.wait_time = randf_range(10, 20)
	$Barks/Timer.start()

func change_scene():
	get_tree().change_scene_to_packed(map_scene)



func _on_animation_player_animation_finished(anim_name):
	Global.cutscene_playing = false
	var dialogue_instance = first_dialog.instantiate()
	$"NPC Tutorial".add_child(dialogue_instance)
	$Barks/Timer.wait_time = randf_range(5, 15)
	$Barks/Timer.start()
