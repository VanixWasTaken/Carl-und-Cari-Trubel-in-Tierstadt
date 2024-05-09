extends AnimatedSprite3D
var door_open = false
var mouse_inside = false
func _on_area_3d_mouse_entered():
	if door_open:
		frame = 3
	elif !door_open:
		frame = 1
	mouse_inside = true

func _on_area_3d_mouse_exited():
	if door_open:
		frame = 2
	elif !door_open:
		frame = 0
	mouse_inside = false

func _input(event):
	if Input.is_action_just_pressed("left_click"):
		if mouse_inside:
			if !door_open:
				door_open = true
				frame = 3
			elif door_open:
				door_open = false
				frame = 1
