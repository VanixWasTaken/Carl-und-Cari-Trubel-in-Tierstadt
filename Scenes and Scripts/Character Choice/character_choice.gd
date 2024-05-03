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
	$UI.play()

func _on_cari_button_button_down():
	$UI.play()

func _on_cari_button_mouse_entered():
	$VO.stream = load("res://Assets/Sound Test/Voice Over/barks/Selection/vo_cari_intro01_var1.mp3")
	$VO.play()

func _on_carl_button_mouse_entered():
	$VO.stream = load("res://Assets/Sound Test/Voice Over/barks/Selection/vo_carl_intro01_var1.mp3")
	$VO.play()
