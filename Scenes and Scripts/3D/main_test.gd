extends Node3D

func _ready():
	var playback: AudioStreamPlaybackPolyphonic
	$Ambience.play()
	$Mouse.play("default")
	playback = $Ambience.get_stream_playback()
	playback.play_stream(load("res://Assets/Sound Test/sfx_tutorial_ambience_birds_var1.mp3"))
	playback.play_stream(load("res://Assets/Sound Test/sfx_tutorial_ambience_creaks_var1.mp3"))
	playback.play_stream(load("res://Assets/Sound Test/sfx_tutorial_ambience_wind_var1.mp3"))
	
	MusicController._play_music("learning_by_doing", "tutorial")

func _process(delta):
	if $Player.position.x <= 19.5 and $Player.position.x >= -19.5:
		$Camera3D.position.x = $Player.position.x



func _on_area_3d_body_entered(body):
	if body.get_name == "Player":
		get_tree().change_scene_to_file("res://Scenes and Scripts/map.tscn")
