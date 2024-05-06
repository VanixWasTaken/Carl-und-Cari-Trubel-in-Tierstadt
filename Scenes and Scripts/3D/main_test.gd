extends Node3D
var second_dialogue = preload("res://Scenes and Scripts/Dialog/dialog_tutorial_2.tscn")
var third_dialogue = preload("res://Scenes and Scripts/Dialog/dialog_tutorial_3.tscn")
var got_key = false
func _ready():
	var playback: AudioStreamPlaybackPolyphonic
	$Ambience.play()
	$POI/Mouse.play("default")
	playback = $Ambience.get_stream_playback()
	playback.play_stream(load("res://Assets/Sound Test/sfx_tutorial_ambience_birds_var1.mp3"))
	playback.play_stream(load("res://Assets/Sound Test/sfx_tutorial_ambience_creaks_var1.mp3"))
	playback.play_stream(load("res://Assets/Sound Test/sfx_tutorial_ambience_wind_var1.mp3"))
	
	MusicController._play_music("learning_by_doing", "tutorial")
	
	#                   BARKS
	var barkies = AudioStreamRandomizer.new()
	$"NPC Tutorial/Barks".stream = barkies
	for i in 3:
		var f = i + 1
		if Global.character == "Cari":
			barkies.add_stream(i, load("res://Assets/Sound Test/Voice Over/barks/Tutorial/Carl/vo_npc_bark_carl_tutorial01_var" + str(f) + ".mp3"))
		
		elif Global.character == "Carl":
			barkies.add_stream(i, load("res://Assets/Sound Test/Voice Over/barks/Tutorial/Cari/vo_npc_bark_cari_tutorial01_var" + str(f) + ".mp3"))
	
	#$UI/HelpButton/DialogTutorial.visible = false

func _process(delta):
	if $Player.position.x <= 19.5 and $Player.position.x >= -19.5:
		$Camera3D.position.x = $Player.position.x
	if Global.open_tutorial_door:
		$Objects/Door.frame = 1
		$Objects/Door/Area3D/CollisionShape3D.position.z = 27

func _on_area_3d_body_entered(body):
	if body.get_name() == "Player":
		get_tree().change_scene_to_file("res://Scenes and Scripts/map.tscn")


func _on_poi_sound_finished():
	await get_tree().create_timer(randf_range(5, 10)).timeout
	if !got_key:
		$"POI/POI Sound".play()

func _on_poi_area_body_entered(body):
	if body.get_name() == "Player":
		got_key = true
		$POI/AudioStreamPlayer3D.play()


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
		$"NPC Tutorial/Barks".stream = playback
		
		for i in 3:
			var f = i + 1
			if Global.character == "Cari":
				playback.add_stream(i, load("res://Assets/Sound Test/Voice Over/barks/Tutorial/Carl/vo_npc_bark_carl_tutorial02_var" + str(f) + ".mp3"))
			
			elif Global.character == "Carl":
				playback.add_stream(i, load("res://Assets/Sound Test/Voice Over/barks/Tutorial/Cari/vo_npc_bark_cari_tutorial02_var" + str(f) + ".mp3"))
			

	
	
	if !Global.dialog_playing:
		$"NPC Tutorial/Barks".play()
	
	$"NPC Tutorial/Barks/Timer".wait_time = randf_range(10, 20)
	$"NPC Tutorial/Barks/Timer".start()
