extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_carl_button_button_up():
	Global.Character = "Carl"
	get_tree().change_scene_to_file("res://Scenes and Scripts/map.tscn")

func _on_cari_button_button_up():
	Global.character = "Cari"
	get_tree().change_scene_to_file("res://Scenes and Scripts/map.tscn")
