extends Node2D

var direction_to_mouse
var angle_to_mouse
var pointer_distance = 0
var test = -180
var mouse_on = false
var current_temperature



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if mouse_on && Input.is_action_pressed("left_click"):
		direction_to_mouse = (get_global_mouse_position() - global_position).normalized()
		$Pointer.global_position = global_position + direction_to_mouse * pointer_distance
		var angle_to_mouse = atan2(direction_to_mouse.y, direction_to_mouse.x) 
		$Pointer.rotation = angle_to_mouse - 55
	



func _on_area_2d_mouse_entered():
	mouse_on = true


func _on_area_2d_mouse_exited():
	mouse_on = false


