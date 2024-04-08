extends AnimatedSprite2D

var start_position
var mouse_on = false
var mouse_position
# Called when the node enters the scene tree for the first time.
func _ready():
	start_position = position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if mouse_on:
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			mouse_position = get_global_mouse_position()
			position = mouse_position
			Global.mouse_full = true
		else:
			position = start_position


func _on_area_2d_mouse_entered():
	if Global.mouse_full == false:
		mouse_on = true

func _on_area_2d_mouse_exited():
	mouse_on = false
	Global.mouse_full = false
