extends Control


func _on_texture_button_button_up():
	self.queue_free()

func _on_texture_button_mouse_entered():
	$Hover.play()

func _on_texture_button_button_down():
	$Click.play()
