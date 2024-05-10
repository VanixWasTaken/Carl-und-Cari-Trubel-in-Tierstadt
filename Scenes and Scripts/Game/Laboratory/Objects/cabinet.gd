extends AnimatedSprite3D
var door_open = false
var mouse_inside = false

func _on_area_3d_mouse_entered():
	frame = 1
	mouse_inside = true

func _on_area_3d_mouse_exited():
	frame = 0
	mouse_inside = false

func _input(event):
	if Input.is_action_just_pressed("left_click"):
		if mouse_inside:
			if !door_open:
				door_open = true
				$Sprite3D.visible = false
				if $"Reagenz Glasses" != null:
					$"Reagenz Glasses".position.y += 100
			elif door_open:
				door_open = false
				$Sprite3D.visible = true
				if $"Reagenz Glasses" != null:
					$"Reagenz Glasses".position.y -= 100
