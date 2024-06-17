extends CanvasLayer




func _on_question_block_input():
	$InputBlock.show()
func _on_question_release_input():
	$InputBlock.hide()

func _play_hover_sounds_buttons():
	$Hover.play()
