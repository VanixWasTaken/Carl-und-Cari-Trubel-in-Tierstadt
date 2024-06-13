extends Node2D
@onready var tutorial_scene = preload("res://Scenes and Scripts/Game/Tutorial/tutorial.tscn")

func _on_carl_button_button_up():
	Global.character = "Carl"
	MusicController._fade_to_volume(-80, 1)
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_packed(tutorial_scene)

func _on_cari_button_button_up():
	Global.character = "Cari"
	MusicController._fade_to_volume(-80, 1)
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_packed(tutorial_scene)

func _on_carl_button_button_down():
	$UI.play()

func _on_cari_button_button_down():
	$UI.play()

func _on_cari_button_mouse_entered():
	$VO.stream = load("res://Assets/Sound/VO/Character Selection/Barks/Cari/vo_cari_intro01_var1.mp3")
	$VO.play()

func _on_carl_button_mouse_entered():
	$VO.stream = load("res://Assets/Sound/VO/Character Selection/Barks/Carl/vo_carl_intro01_var1.mp3")
	$VO.play()
