extends TextureRect


###### Variables for lemon
var mouse_inside : bool = false
var should_be_picked_up : bool = true
var lemon_inside_ph : bool = false
var current_scale : int = 15
var follow_mouse : bool = false


###### Variables for soap
var soap_mouse_inside : bool = false
var soap_should_be_picked_up : bool = true
var soap_inside_ph : bool = false
var soap_current_scale : int = 15
var soap_follow_mouse : bool = false



signal block_input
signal release_input

func _physics_process(delta):
	if follow_mouse:
		$Lemon.position = get_global_mouse_position()
	if soap_follow_mouse:
		$Soap.position = get_global_mouse_position()
	if $Lemon.global_position == $Soap.global_position:
		$Lemon.position = Vector2(317, 457)
		should_be_picked_up = false
		lemon_inside_ph = false
		mouse_inside = false
		follow_mouse = false




func _input(event):
	if Input.is_action_just_released("left_click") and !lemon_inside_ph:
		$Lemon.position = Vector2(317, 457)
	if Input.is_action_just_released("left_click") and lemon_inside_ph:
		if lemon_inside_ph:
			if current_scale == 14:
				$Lemon.global_position = Vector2(873, 440)
			if current_scale == 13:
				$Lemon.global_position = Vector2(873, 470)
			if current_scale == 12:
				$Lemon.global_position = Vector2(873, 500)
			if current_scale == 11:
				$Lemon.global_position = Vector2(873, 537)
			if current_scale == 10:
				$Lemon.global_position = Vector2(873, 570)
			if current_scale == 9:
				$Lemon.global_position = Vector2(873, 600)
			if current_scale == 7:
				$Lemon.global_position = Vector2(873, 637)
			if current_scale == 6:
				$Lemon.global_position = Vector2(873, 670)
			if current_scale == 5:
				$Lemon.global_position = Vector2(873, 706)
			if current_scale == 4:
				$Lemon.global_position = Vector2(873, 740)
			if current_scale == 3:
				$Lemon.global_position = Vector2(873, 774)
			if current_scale == 2:
				$Lemon.global_position = Vector2(873, 803)
			if current_scale == 1:
				$Lemon.global_position = Vector2(873, 836)
			if current_scale == 0:
				$Lemon.global_position = Vector2(873, 868)
	if Input.is_action_just_pressed("left_click") and mouse_inside and should_be_picked_up:
		follow_mouse = true
	if Input.is_action_just_released("left_click") and mouse_inside and should_be_picked_up:
		follow_mouse = false 
	if Input.is_action_just_pressed("left_click") and mouse_inside:
		should_be_picked_up = true

	if Input.is_action_just_released("left_click") and !soap_inside_ph:
		$Soap.position = Vector2(322, 787)
	if Input.is_action_just_released("left_click") and soap_inside_ph:
		if soap_inside_ph:
			if soap_current_scale == 14:
				$Soap.global_position = Vector2(873, 420)
			if soap_current_scale == 13:
				$Soap.global_position = Vector2(873, 450)
			if soap_current_scale == 12:
				$Soap.global_position = Vector2(873, 480)
			if soap_current_scale == 11:
				$Soap.global_position = Vector2(873, 517)
			if soap_current_scale == 10:
				$Soap.global_position = Vector2(873, 550)
			if soap_current_scale == 9:
				$Soap.global_position = Vector2(873, 580)
			if soap_current_scale == 7:
				$Soap.global_position = Vector2(873, 617)
			if soap_current_scale == 6:
				$Soap.global_position = Vector2(873, 650)
			if soap_current_scale == 5:
				$Soap.global_position = Vector2(873, 686)
			if soap_current_scale == 4:
				$Soap.global_position = Vector2(873, 720)
			if soap_current_scale == 3:
				$Soap.global_position = Vector2(873, 754)
			if soap_current_scale == 2:
				$Soap.global_position = Vector2(873, 783)
			if soap_current_scale == 1:
				$Soap.global_position = Vector2(873, 816)
			if soap_current_scale == 0:
				$Soap.global_position = Vector2(873, 848)
	if Input.is_action_just_pressed("left_click") and soap_mouse_inside and soap_should_be_picked_up:
		soap_follow_mouse = true
	if Input.is_action_just_released("left_click") and soap_mouse_inside and soap_should_be_picked_up:
		soap_follow_mouse = false 
	if Input.is_action_just_pressed("left_click") and soap_mouse_inside:
		soap_should_be_picked_up = true









func _on_pick_up_area_mouse_entered():
	mouse_inside = true
func _on_pick_up_area_mouse_exited():
	mouse_inside = false

func _on_soap_pick_up_area_mouse_entered():
	soap_mouse_inside = true
func _on_soap_pick_up_area_mouse_exited():
	soap_mouse_inside = false








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


func _on_soap_area_2d_area_entered(area):
	if area.is_in_group("PhScaleAreas"):
		soap_inside_ph = true
		if area == $PhScaleIcon/PhScale14:
			soap_current_scale = 14
		if area == $PhScaleIcon/PhScale13:
			soap_current_scale = 13
		if area == $PhScaleIcon/PhScale12:
			soap_current_scale = 12
		if area == $PhScaleIcon/PhScale11:
			soap_current_scale = 11
		if area == $PhScaleIcon/PhScale10:
			soap_current_scale = 10
		if area == $PhScaleIcon/PhScale9:
			soap_current_scale = 9
		if area == $PhScaleIcon/PhScale7:
			soap_current_scale = 7
		if area == $PhScaleIcon/PhScale6:
			soap_current_scale = 6
		if area == $PhScaleIcon/PhScale5:
			soap_current_scale = 5
		if area == $PhScaleIcon/PhScale4:
			soap_current_scale = 4
		if area == $PhScaleIcon/PhScale3:
			soap_current_scale = 3
		if area == $PhScaleIcon/PhScale2:
			soap_current_scale = 2
		if area == $PhScaleIcon/PhScale1:
			soap_current_scale = 1
		if area == $PhScaleIcon/PhScale0:
			soap_current_scale = 0
func _on_soap_area_2d_area_exited(area):
	if area.is_in_group("PhScaleAreas"):
		soap_inside_ph = false





func _on_weiter_button_pressed():
	if $Lemon.global_position.y >= 637 and $Soap.global_position.y <= 580: 
		$Solutions/RightSolution.show()
		$"../VoiceOver".stream = load("res://Assets/Sound/VO/Laboratory/Quiz/vo_npc_chameleon_quiz_correct.mp3")
		$"../VoiceOver".play()
		emit_signal("block_input")
		await get_tree().create_timer(2).timeout
		$Solutions/RightSolution.hide()
		emit_signal("release_input")
		$".".queue_free()
	elif $Lemon.global_position == Vector2(317, 457) or $Soap.global_position == Vector2(322, 787):
		$Solutions/NoSolution.show()
		$"../VoiceOver".stream = load("res://Assets/Sound/VO/Laboratory/Quiz/vo_npc_chameleon_quiz_sort_objects.mp3")
		$"../VoiceOver".play()
		emit_signal("block_input")
		await get_tree().create_timer(2).timeout
		$Solutions/NoSolution.hide()
		emit_signal("release_input")
	else:
		$Solutions/WrongSolution.show()
		$"../VoiceOver".stream = load("res://Assets/Sound/VO/Laboratory/Quiz/vo_npc_chameleon_quiz_incorrect.mp3")
		$"../VoiceOver".play()
		emit_signal("block_input")
		await get_tree().create_timer(2).timeout
		$Solutions/WrongSolution.hide()
		emit_signal("release_input")
