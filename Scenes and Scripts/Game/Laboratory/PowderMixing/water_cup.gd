extends AnimatedSprite2D

var start_position
var mouse_on = false
var mouse_position
var follow_mouse = false
# Called when the node enters the scene tree for the first time.
func _ready():
	start_position = position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("left_click") && mouse_on:
		follow_mouse = true
	if follow_mouse:
		mouse_position = get_global_mouse_position()
		global_position = mouse_position
		Global.mouse_full = true
	if Input.is_action_just_released("left_click"):
		follow_mouse = false
		global_position = start_position
		$Interact.play()
		%PouringWater.stop()


func _on_area_2d_mouse_entered():
	if Global.mouse_full == false:
		mouse_on = true
		

func _on_area_2d_mouse_exited():
	mouse_on = false
	Global.mouse_full = false
