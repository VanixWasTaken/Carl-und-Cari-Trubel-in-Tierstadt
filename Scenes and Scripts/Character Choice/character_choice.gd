extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_carl_button_button_up():
	Global.character = "Carl"
	get_tree().change_scene_to_file("res://Scenes and Scripts/3D/main_test.tscn")

func _on_cari_button_button_up():
	Global.character = "Cari"
	get_tree().change_scene_to_file("res://Scenes and Scripts/3D/main_test.tscn")

func _on_carl_button_button_down():
	play_ui_sound()

func _on_cari_button_button_down():
	play_ui_sound()

func _on_cari_button_mouse_entered():
	if !$UI.playing:
		$UI.stream = load("res://Assets/Sound Test/Voice Over/barks/vo_cari_intro01_var1.mp3")
		$UI.play()

func _on_carl_button_mouse_entered():
	if !$UI.playing:
		$UI.stream = load("res://Assets/Sound Test/Voice Over/barks/vo_carl_intro01_var1.mp3")
		$UI.play()

func play_ui_sound():
	var random = randi() % 3
	
	match random:
		0:
			$UI.stream = load("res://Assets/Sound Test/sfx_hub_ui_click_var1.mp3")
		1:
			$UI.stream = load("res://Assets/Sound Test/sfx_hub_ui_click_var2.mp3")
		2:
			$UI.stream = load("res://Assets/Sound Test/sfx_hub_ui_click_var3.mp3")
	
	$UI.play()
