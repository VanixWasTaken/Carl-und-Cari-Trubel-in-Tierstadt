extends Node2D

var mouse_inside = false

func _process(delta):
	if mouse_inside and Input.is_action_just_pressed("left_click"):
		get_tree().visible = false


func _on_area_2d_mouse_entered():
	mouse_inside = true
func _on_area_2d_mouse_exited():
	mouse_inside = false
