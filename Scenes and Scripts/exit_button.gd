extends Node2D

var mouse_inside = false
var outline_shader = preload("res://Shader/outline.tres")
var no_shader = preload("res://Shader/no_shader.tres")

func _process(delta):

			# Handles Input to close the menu via the quit button
	if mouse_inside and Input.is_action_just_pressed("left_click"):
		var note_menu = get_parent()
		note_menu.visible = false


	  # for shaders
func _on_area_2d_mouse_entered():
	mouse_inside = true
	$Sprite2D.material = outline_shader
func _on_area_2d_mouse_exited():
	mouse_inside = false
	$Sprite2D.material = no_shader
