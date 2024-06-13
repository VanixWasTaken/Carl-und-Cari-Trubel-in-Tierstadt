extends Node2D

@onready var next_scene = preload("res://Scenes and Scripts/Menus/Main Menu/main_menu.tscn")

func _ready():
	MusicController._play_music("welcome", "title", -6, 0)
	await get_tree().create_timer(0.5).timeout
	$Button.global_position = Vector2.ZERO




func _on_button_button_up():
	MusicController._fade_to_volume(-18, 1.125)
	get_tree().change_scene_to_packed(next_scene)


