extends TextureRect

var mouse_inside : bool = false
var should_be_picked_up : bool = true
var lemon_inside_ph : bool = false
var current_scale : int = 15

func _physics_process(delta):
	if Input.is_action_pressed("left_click") and mouse_inside and should_be_picked_up:
		$Lemon.position = get_global_mouse_position()
	elif !Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and should_be_picked_up:
		$Lemon.position = Vector2(317, 457)
	
	
	if lemon_inside_ph:
		if current_scale == 14:
			$Lemon/Sprite2D.global_position = Vector2(873, 440)
		if current_scale == 13:
			$Lemon/Sprite2D.global_position = Vector2(873, 470)
		if current_scale == 12:
			$Lemon/Sprite2D.global_position = Vector2(873, 500)
		if current_scale == 11:
			$Lemon/Sprite2D.global_position = Vector2(873, 530)
		if current_scale == 10:
			$Lemon/Sprite2D.global_position = Vector2(873, 560)
		if current_scale == 9:
			$Lemon/Sprite2D.global_position = Vector2(873, 590)
		if current_scale == 7:
			$Lemon/Sprite2D.global_position = Vector2(873, 620)
		if current_scale == 6:
			$Lemon/Sprite2D.global_position = Vector2(873, 650)
		if current_scale == 5:
			$Lemon/Sprite2D.global_position = Vector2(873, 680)
		if current_scale == 4:
			$Lemon/Sprite2D.global_position = Vector2(873, 710)
		if current_scale == 3:
			$Lemon/Sprite2D.global_position = Vector2(873, 740)
		if current_scale == 2:
			$Lemon/Sprite2D.global_position = Vector2(873, 770)
		if current_scale == 1:
			$Lemon/Sprite2D.global_position = Vector2(873, 800)
		if current_scale == 0:
			$Lemon/Sprite2D.global_position = Vector2(873, 830)
	else:
		$Lemon/Sprite2D.position = Vector2.ZERO
	#if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) == false and lemon_inside_ph:
		#should_be_picked_up = false
		#print("asdjalkca")





func _on_pick_up_area_mouse_entered():
	mouse_inside = true
func _on_pick_up_area_mouse_exited():
	mouse_inside = false


func _on_area_2d_area_entered(area):
	if area.is_in_group("PhScaleAreas"):
		lemon_inside_ph = true
		if area == $PhScaleIcon/PhScale14:
			current_scale = 14
		if area == $PhScaleIcon/PhScale13:
			current_scale = 13
		if area == $PhScaleIcon/PhScale12:
			current_scale = 12
		if area == $PhScaleIcon/PhScale11:
			current_scale = 11
		if area == $PhScaleIcon/PhScale10:
			current_scale = 10
		if area == $PhScaleIcon/PhScale9:
			current_scale = 9
		if area == $PhScaleIcon/PhScale7:
			current_scale = 7
		if area == $PhScaleIcon/PhScale6:
			current_scale = 6
		if area == $PhScaleIcon/PhScale5:
			current_scale = 5
		if area == $PhScaleIcon/PhScale4:
			current_scale = 4
		if area == $PhScaleIcon/PhScale3:
			current_scale = 3
		if area == $PhScaleIcon/PhScale2:
			current_scale = 2
		if area == $PhScaleIcon/PhScale1:
			current_scale = 1
		if area == $PhScaleIcon/PhScale0:
			current_scale = 0
func _on_area_2d_area_exited(area):
	if area.is_in_group("PhScaleAreas"):
		lemon_inside_ph = false
