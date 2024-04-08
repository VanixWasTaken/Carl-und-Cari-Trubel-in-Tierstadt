extends Node2D


var mouse_inside = false
var should_change_scene = false

func _process(delta):
	if mouse_inside == true:
		$AnimatedSprite2D.play()
	if should_change_scene == true:
		get_tree().change_scene_to_file("res://Scenes and Scripts/test.tscn")


func _on_area_2d_mouse_entered():
	mouse_inside = true
func _on_area_2d_mouse_exited():
	should_change_scene = true
