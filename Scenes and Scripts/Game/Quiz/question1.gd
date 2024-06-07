extends TextureRect

var answer1_pressed : bool = false
var answer2_pressed : bool = false
var answer3_pressed : bool = false
var no_box_checked : bool = true
var box1_checked : bool = false
var box2_checked : bool = false
var box3_checked : bool = false



func _process(delta):
	if $Answer1/Answer1Button.is_pressed() == true:
		box1_checked = true
	else:
		box1_checked = false
	if $Answer2/Answer2Button.is_pressed() == true:
		box2_checked = true
	else:
		box2_checked = false
	if $Answer3/Answer3Button.is_pressed() == true:
		box3_checked = true
	else:
		box3_checked = false










func _on_weiter_button_pressed():
	if answer1_pressed and box1_checked and !box2_checked and !box3_checked:
		$Answer1/Answer1Button.button_pressed = false
		$Answer1/Label.add_theme_color_override("font_color", Color(0.8,0,0))
		$Answer1/Answer1Button.set_disabled(true)
		$Solutions/WrongSolution.show()
		await get_tree().create_timer(2).timeout
		$Solutions/WrongSolution.hide()
	elif answer3_pressed and !box1_checked and !box2_checked and box3_checked:
		$Answer3/Answer3Button.button_pressed = false
		$Answer3/Label.add_theme_color_override("font_color", Color(0.8,0,0))
		$Answer3/Answer3Button.set_disabled(true)
		$Solutions/WrongSolution.show()
		await get_tree().create_timer(2).timeout
		$Solutions/WrongSolution.hide()
	elif answer2_pressed and !box1_checked and box2_checked and !box3_checked:
		$Answer2/Label.add_theme_color_override("font_color", Color(0,0.8,0))
		$Solutions/RightSolution.show()
		await get_tree().create_timer(2).timeout
		$Solutions/RightSolution.hide()
		$".".queue_free()
	elif !box1_checked and !box2_checked and !box3_checked:
		$Solutions/NoSolution.show()
		await get_tree().create_timer(2).timeout
		$Solutions/NoSolution.hide()


func _on_answer_1_button_pressed():
	answer1_pressed = true
	answer2_pressed = false
	answer3_pressed	= false
	$Answer2/Answer2Button.button_pressed = false
	$Answer3/Answer3Button.button_pressed = false
func _on_answer_2_button_pressed():
	answer2_pressed = true
	answer1_pressed = false
	answer3_pressed = false
	$Answer1/Answer1Button.button_pressed = false
	$Answer3/Answer3Button.button_pressed = false
func _on_answer_3_button_pressed():
	answer3_pressed = true
	answer1_pressed = false
	answer2_pressed = false
	$Answer1/Answer1Button.button_pressed = false
	$Answer2/Answer2Button.button_pressed = false
