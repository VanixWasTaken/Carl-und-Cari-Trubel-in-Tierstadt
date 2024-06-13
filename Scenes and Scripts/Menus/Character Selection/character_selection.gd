extends Node2D
@onready var tutorial_scene = preload("res://Scenes and Scripts/Game/Tutorial/tutorial.tscn")

func _on_carl_button_button_up():
	Global.character = "Carl"
	$CanvasLayer/AnimationPlayer.play("fade_out")
	MusicController._fade_to_volume(-80, 1)
	$"CariButton/Cari Button".disabled = true
	$"CarlButton/Carl Button".disabled = true

func _on_cari_button_button_up():
	Global.character = "Cari"
	$CanvasLayer/AnimationPlayer.play("fade_out")
	MusicController._fade_to_volume(-80, 1)
	$"CarlButton/Carl Button".disabled = true
	$"CariButton/Cari Button".disabled = true

func _on_carl_button_button_down():
	$UI.play()

func _on_cari_button_button_down():
	$UI.play()

func _on_cari_button_mouse_entered():
	if !$"CariButton/Cari Button".disabled:
		$VO.stream = load("res://Assets/Sound/VO/Character Selection/Barks/Cari/vo_cari_intro01_var1.mp3")
		$VO.play()

func _on_carl_button_mouse_entered():
	if !$"CarlButton/Carl Button".disabled:
		$VO.stream = load("res://Assets/Sound/VO/Character Selection/Barks/Carl/vo_carl_intro01_var1.mp3")
		$VO.play()



func _on_animation_player_animation_finished(anim_name):
	get_tree().change_scene_to_packed(tutorial_scene)
