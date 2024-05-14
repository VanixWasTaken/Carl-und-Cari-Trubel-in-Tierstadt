extends TextureRect

var selected = false

func _process(delta):
	if selected:
		follow_mouse()


func follow_mouse():
	position = get_global_mouse_position()



func _on_bottle_2_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			selected = true
		else:
			selected = false
