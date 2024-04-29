extends Control
signal HelpOpened
signal HelpClosed
var helpbuttonopen = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_texture_button_button_up():
	if !helpbuttonopen:
		emit_signal("HelpOpened")
		helpbuttonopen = true
	elif helpbuttonopen:
		emit_signal("HelpClosed")
		helpbuttonopen = false
	

