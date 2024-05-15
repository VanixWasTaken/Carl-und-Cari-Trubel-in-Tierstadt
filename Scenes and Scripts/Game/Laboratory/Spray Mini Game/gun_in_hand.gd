extends AnimatedSprite2D


signal is_shooting
signal isnt_shooting

var should_shoot_intern = false


func _input(event):
	if event is InputEventMouseMotion:
		var velocity = event.get_velocity()
		if velocity > Vector2(5000, 5000):
			should_shoot_intern = true
			Global.should_shoot = true
		

func _process(delta):
	should_shoot_intern = Global.should_shoot
	position = get_global_mouse_position()
	
	if Input.is_action_pressed("left_click") and should_shoot_intern:
		$".".play("shooting")
		is_shooting.emit()
	else:
		$".".play("default")
		isnt_shooting.emit()
	






func _on_swipe_area_should_shoot():
	should_shoot_intern = true


func _on_visible_chameleon_gun_is_jamming():
	should_shoot_intern = false
	Global.should_shoot = false

