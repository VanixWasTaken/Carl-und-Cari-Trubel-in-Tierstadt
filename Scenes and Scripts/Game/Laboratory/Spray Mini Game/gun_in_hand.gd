extends AnimatedSprite2D


signal is_shooting
signal isnt_shooting

var should_shoot_intern = false


func _input(event):
	if visible and !should_shoot_intern:
		if event is InputEventMouseMotion:
			var velocity = event.get_velocity()
			if velocity > Vector2(5000, 5000):
				if !$ShakeSound.playing:
					$ShakeSound.play()
				should_shoot_intern = true
				Global.should_shoot = true
			elif velocity < Vector2(-5000, -5000):
				if !$ShakeSound.playing:
					$ShakeSound.play()
				should_shoot_intern = true
				Global.should_shoot = true

func _process(delta):
	should_shoot_intern = Global.should_shoot
	position = get_global_mouse_position()
	
	if Input.is_action_pressed("left_click") and should_shoot_intern:
		if !$SpraySound.playing and self.visible:
			$Trigger.play()
			$SpraySound.play()
		$".".play("shooting")
		is_shooting.emit()

	elif Input.is_action_just_pressed("left_click") and !should_shoot_intern:
		if !$Jamming.playing and self.visible:
			$Trigger.play()
			$Jamming.play()
			$HoseNoise.play()

	else:
		$SpraySound.stop()
		$".".play("default")
		isnt_shooting.emit()
	






func _on_swipe_area_should_shoot():
	should_shoot_intern = true


func _on_visible_chameleon_gun_is_jamming():
	$Jamming.play()
	should_shoot_intern = false
	Global.should_shoot = false
