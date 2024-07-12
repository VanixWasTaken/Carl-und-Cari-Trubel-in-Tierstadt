extends TextureRect

var path

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
				$Lemon.global_position =  Vector2(1231, 726)
			if current_scale == 13:
				$Lemon.global_position =  Vector2(1231, 457)

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
				$Soap.global_position = Vector2(1231, 726)
			if soap_current_scale == 13:
				$Soap.global_position = Vector2(1231, 457)

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

func _on_soap_area_2d_area_exited(area):
	if area.is_in_group("PhScaleAreas"):
		soap_inside_ph = false





func _on_weiter_button_pressed():
	if $Lemon.global_position == Vector2(1231, 726) and $Soap.global_position == Vector2(1231, 457):
		$Solutions/RightSolution.show()
		$"../VoiceOver".stream = load(path + "correct.mp3")
		$"../VoiceOver".play()
		emit_signal("block_input")
		await get_tree().create_timer(2).timeout
		$Solutions/RightSolution.hide()
		emit_signal("release_input")
		$".".queue_free()
	elif $Lemon.global_position == Vector2(317, 457) or $Soap.global_position == Vector2(322, 787):
		$Solutions/NoSolution.show()
		$"../VoiceOver".stream = load(path + "sort_objects.mp3")
		$"../VoiceOver".play()
		emit_signal("block_input")
		await get_tree().create_timer(2).timeout
		$Solutions/NoSolution.hide()
		emit_signal("release_input")
	else:
		$Solutions/WrongSolution.show()
		$"../VoiceOver".stream = load(path + "incorrect.mp3")
		$"../VoiceOver".play()
		emit_signal("block_input")
		await get_tree().create_timer(2).timeout
		$Solutions/WrongSolution.hide()
		emit_signal("release_input")
