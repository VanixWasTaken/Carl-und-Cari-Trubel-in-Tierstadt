extends Control

func _ready():
	Global.menu_open = true

func _on_texture_button_mouse_entered():
	$Hover.play()

func _on_texture_button_button_down():
	$Click.play()
	Global.menu_open = false
	queue_free()
