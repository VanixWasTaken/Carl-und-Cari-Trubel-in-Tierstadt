extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	MusicController._play_music("welcome", "title")
	await get_tree().create_timer(0.5).timeout


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass





func _on_backround_animation_finished():
	get_tree().change_scene_to_file("res://Scenes and Scripts/Main Menu/main_menu.tscn")
