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
		$POI/CPUParticles3D.emitting = true

func _on_poi_area_body_entered(body):
	if body.get_name() == "Player":
		got_key = true
		$POI/AudioStreamPlayer3D.play()


func _on_audio_stream_player_3d_finished():
	$Key.queue_free()
	$POI.queue_free()
	var dialogue_instance = second_dialogue.instantiate()
	$"NPC Tutorial".add_child(dialogue_instance)
