extends AnimatedSprite3D




func _on_mouse_3d_mouse_entered():
	if Global.open_tutorial_door:
		$".".frame = 1


func _on_mouse_3d_mouse_exited():
	if Global.open_tutorial_door:
		$".".frame = 0
