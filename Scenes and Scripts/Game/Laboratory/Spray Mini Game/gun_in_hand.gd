extends AnimatedSprite2D


signal is_shooting
signal isnt_shooting

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = get_global_mouse_position()
	
	if Input.is_action_pressed("left_click"):
		$".".play("shooting")
		is_shooting.emit()
	else:
		$".".play("default")
		isnt_shooting.emit()


