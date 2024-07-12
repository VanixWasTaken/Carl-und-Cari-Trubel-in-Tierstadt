extends TextureRect



var answer2_pressed : bool = false
var answer3_pressed : bool = false
var answer4_pressed : bool = false
var answer5_pressed : bool = false
var answer6_pressed : bool = false
var answer7_pressed : bool = false

var correct_answer : bool = false 

signal block_input
signal release_input




func _on_weiter_button_pressed():
	$"../Click".play()
	if !answer2_pressed and !answer3_pressed and answer4_pressed and !answer5_pressed and answer6_pressed and answer7_pressed:
		correct_answer = true
		$Solutions/RightSolution.show()
		$"../VoiceOver".stream = load("res://Assets/Sound/VO/Laboratory/Quiz/vo_npc_chameleon_quiz_correct.mp3")
		$"../VoiceOver".play()
		emit_signal("block_input")
		await get_tree().create_timer(2).timeout
		$Solutions/RightSolution.hide()
		emit_signal("release_input")
		$".".queue_free()
	if !answer2_pressed and !answer3_pressed and !answer4_pressed and !answer5_pressed and !answer6_pressed and !answer7_pressed:
		$Solutions/NoSolution.show()
		$"../VoiceOver".stream = load("res://Assets/Sound/VO/Laboratory/Quiz/vo_npc_chameleon_quiz_no_answer_selected.mp3")
		$"../VoiceOver".play()
		emit_signal("block_input")
		await get_tree().create_timer(2).timeout
		$Solutions/NoSolution.hide()
		emit_signal("release_input")
	elif !correct_answer:
		$Solutions/WrongSolution.show()
		$"../VoiceOver".stream = load("res://Assets/Sound/VO/Laboratory/Quiz/vo_npc_chameleon_quiz_incorrect.mp3")
		$"../VoiceOver".play()
		emit_signal("block_input")
		await get_tree().create_timer(2).timeout
		$Solutions/WrongSolution.hide()
		emit_signal("release_input")


func _on_answer_2_button_pressed():
	$"../Click".play()
	if answer2_pressed:
		answer2_pressed = false
	elif !answer2_pressed:
		answer2_pressed = true
func _on_answer_3_button_pressed():
	$"../Click".play()
	if answer3_pressed:
		answer3_pressed = false
	elif !answer3_pressed:
		answer3_pressed = true
func _on_answer_4_button_pressed():
	$"../Click".play()
	if answer4_pressed:
		answer4_pressed = false
	elif !answer4_pressed:
		answer4_pressed = true
func _on_answer_5_button_pressed():
	$"../Click".play()
	if answer5_pressed:
		answer5_pressed = false
	elif !answer5_pressed:
		answer5_pressed = true
func _on_answer_6_button_pressed():
	$"../Click".play()
	if answer6_pressed:
		answer6_pressed = false
	elif !answer6_pressed:
		answer6_pressed = true
func _on_answer_7_button_pressed():
	$"../Click".play()
	if answer7_pressed:
		answer7_pressed = false
	elif !answer7_pressed:
		answer7_pressed = true
