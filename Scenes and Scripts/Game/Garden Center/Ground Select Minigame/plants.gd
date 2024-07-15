extends AnimatedSprite2D

var mouse_on = false

func _on_area_2d_mouse_entered():
	if Global.dialog_playing == false:
		$Hover.play()
		mouse_on = true
		$InformationLabel.show()


func _on_area_2d_mouse_exited():
	frame = 0
	mouse_on = false
	$InformationLabel.hide()
