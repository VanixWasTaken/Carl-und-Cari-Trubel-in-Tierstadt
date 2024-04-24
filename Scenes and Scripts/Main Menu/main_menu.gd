extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Backround.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_button_up():
	get_tree().change_scene_to_file("res://Scenes and Scripts/map.tscn")


func _on_options_button_up():
	get_tree().change_scene_to_file("res://Scenes and Scripts/Options/options.tscn")


func _on_credits_button_up():
	get_tree().change_scene_to_file("res://Scenes and Scripts/Credits/credits.tscn")


func _on_quit_button_up():
	get_tree().quit()
