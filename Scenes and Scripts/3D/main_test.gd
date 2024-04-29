extends Node3D

func _ready():
	var playback: AudioStreamPlaybackPolyphonic
	$Ambience.play()
	playback = $Ambience.get_stream_playback()
	playback.play_stream(load("res://Assets/Sound Test/sfx_tutorial_ambience_birds_var1.mp3"))
	playback.play_stream(load("res://Assets/Sound Test/sfx_tutorial_ambience_creaks_var1.mp3"))
	playback.play_stream(load("res://Assets/Sound Test/sfx_tutorial_ambience_wind_var1.mp3"))
	
	MusicController._play_music("learning_by_doing", "tutorial")

func _process(delta):
	if $Player.position.x <= 19.5 and $Player.position.x >= -19.5:
		$Camera3D.position.x = $Player.position.x

