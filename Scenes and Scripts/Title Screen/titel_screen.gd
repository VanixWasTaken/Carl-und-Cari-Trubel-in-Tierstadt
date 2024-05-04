extends Node2D


func _ready():
	MusicController._play_music("welcome", "title")
	await get_tree().create_timer(0.5).timeout
	$Button.global_position = Vector2.ZERO




func _on_button_button_up():
	get_tree().change_scene_to_file("res://Scenes and Scripts/Main Menu/main_menu.tscn")
