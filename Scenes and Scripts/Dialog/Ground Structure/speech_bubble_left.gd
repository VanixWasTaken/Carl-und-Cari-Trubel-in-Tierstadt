extends TextureRect




func _on_rich_text_label_finished():
	if $RichTextLabel.get_line_count() == 1:
		$AnimationPlayer.play("line1")
	elif $RichTextLabel.get_line_count() == 2:
		$AnimationPlayer.play("line2")
	elif $RichTextLabel.get_line_count() == 3:
		$AnimationPlayer.play("line3")
	elif $RichTextLabel.get_line_count() >= 4:
		$AnimationPlayer.play("line4")
