extends Control


signal hover
signal click


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_texture_button_button_up():
	$".".visible = false


func _on_texture_button_mouse_entered():
	emit_signal("hover")

func _on_texture_button_button_down():
	emit_signal("click")
