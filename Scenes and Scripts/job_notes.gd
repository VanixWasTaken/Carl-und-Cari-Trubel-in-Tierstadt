extends Node2D


var mouse_inside = false
var outline_shader = preload("res://Shader/outline.tres")
var no_shader = preload("res://Shader/no_shader.tres")


func _process(delta):
	if mouse_inside:
		$Sprite2D.material = outline_shader
	else:
		$Sprite2D.material = no_shader


func _on_area_2d_mouse_entered():
	mouse_inside = true
func _on_area_2d_mouse_exited():
	mouse_inside = false
