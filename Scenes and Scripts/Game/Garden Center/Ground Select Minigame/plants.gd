extends AnimatedSprite2D

var mouse_on = false

func _on_area_2d_mouse_entered():
	frame = 1
	mouse_on = true
	$InformationLabel.show()


func _on_area_2d_mouse_exited():
	frame = 0
	mouse_on = false
	$InformationLabel.hide()
