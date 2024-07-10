extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	MusicController.bus = "Music"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Used to make the Player start a piece of music, by giving its name, the area and the volume that is needed
func _play_music(piece_name: String, area: String, volume: float = 0, transition_time: float = 1.125):
	if _get_current_song() != load("res://Assets/Sound/BGM/" + area + "/mus_" + area +"_" + piece_name + ".mp3"):
		MusicController.stream = load("res://Assets/Sound/BGM/" + area + "/mus_" + area +"_" + piece_name + ".mp3")
		MusicController.volume_db = -60
		MusicController.play()
		get_tree().create_tween().tween_property(MusicController, "volume_db", volume, transition_time)
	else:
		pass


# Used to stop the music, to make the music stop for a certain amount of time --> give the method a time (float)
func _stop_music(time: float = 0):
	MusicController.stop()
	if time > 0:
		await get_tree().create_timer(time).timeout
		MusicController.play()


##### Used to fade music in and out, depending on the current volume 
##### and the desired volume, using the tween node
##### https://docs.godotengine.org/de/4.x/classes/class_tween.html#class-tween-method-tween-property

func _fade_to_volume(desired_volume: float = -80, transition_time: float = 1.125):
	get_tree().create_tween().tween_property(MusicController, "volume_db", desired_volume, transition_time)

func _get_current_song():
	var current_song = self.stream
	return current_song
