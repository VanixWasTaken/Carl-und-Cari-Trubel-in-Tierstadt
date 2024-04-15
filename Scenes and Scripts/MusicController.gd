extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	MusicController.bus = "Music"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Used to make the Player start a piece of music, by giving its name, the area and the volume that is needed
func _play_music(piece_name: String, area: String, volume: float = 0):
	MusicController.stream = load("res://Assets/Sound Test/mus_" + area + "_" + piece_name + ".mp3")
	MusicController.volume_db = volume
	MusicController.play()

# Used to stop the music, to make the music stop for a certain amount of time --> give the method a time (float)
func _stop_music(time: float = 0):
	MusicController.stop()
	if time > 0:
		await get_tree().create_timer(time).timeout
		MusicController.play()
