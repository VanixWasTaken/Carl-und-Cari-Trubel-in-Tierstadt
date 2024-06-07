extends TextureRect

var answer1_pressed : bool = false
var answer2_pressed : bool = false
var answer3_pressed : bool = false















func _on_weiter_button_pressed():
	if answer1_pressed:
		$Answer1/Answer1Button.button_pressed = false
		$Answer1/Label.add_theme_color_override("font_color", Color(1,0,0))
		$Answer1/Answer1Button.set_disabled(true)
	if answer3_pressed:
		$Answer3/Answer3Button.button_pressed = false
		$Answer3/Label.add_theme_color_override("font_color", Color(1,0,0))
		$Answer3/Answer3Button.set_disabled(true)
	if answer2_pressed:
		$".".queue_free()


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
