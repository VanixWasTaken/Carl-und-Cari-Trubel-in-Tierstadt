extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _play_music(piece_name: String, area: String, volume: float = 0):
	MusicController.stream = load("res://Assets/Sound Test/mus_" + area + "_" + piece_name + ".mp3")
	MusicController.volume_db = volume
	MusicController.play()
