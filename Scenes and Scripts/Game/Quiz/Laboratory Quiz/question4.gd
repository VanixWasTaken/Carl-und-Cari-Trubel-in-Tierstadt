extends TextureRect

var written_text_characters : int = 0

signal block_input
signal release_input

var path

func _process(delta):
	written_text_characters = $TextEdit.text.length()


func _on_weiter_button_pressed():
	$"../Click".play()
	
	if written_text_characters == 0:
		$Solutions/NoSolution.show()
		$"../VoiceOver".stream = load(path + "enter_text.mp3")
		$"../VoiceOver".play()
		emit_signal("block_input")
		await get_tree().create_timer(2).timeout
		$Solutions/NoSolution.hide()
		emit_signal("release_input")
	elif written_text_characters > 36:
		$Solutions/Thanks.show()
		$"../VoiceOver".stream = load(path + "feedback.mp3")
		$"../VoiceOver".play()
		emit_signal("block_input")
		await get_tree().create_timer(2).timeout
		$Solutions/Thanks.hide()
		emit_signal("release_input")
		queue_free()
	elif written_text_characters > 0 and written_text_characters <= 36:
		$Solutions/WrongSolution.show()
		$"../VoiceOver".stream = load(path + "write_more.mp3")
		$"../VoiceOver".play()
		emit_signal("block_input")
		await get_tree().create_timer(2).timeout
		$Solutions/WrongSolution.hide()
		emit_signal("release_input")

