extends Area2D

var mouse_on = false
var follow_mouse = false


@onready var pipe1 = $"."


func _process(delta):
	if Input.is_action_just_pressed("left_click") and mouse_on:
		follow_mouse = true
	elif Input.is_action_just_released("left_click"):
		follow_mouse = false
	
	if follow_mouse:
		pipe1.position = get_global_mouse_position()
	else:
		pipe1.position = Vector2(1371, 632)



func _on_mouse_entered():
	mouse_on = true
func _on_mouse_exited():
	mouse_on = false



