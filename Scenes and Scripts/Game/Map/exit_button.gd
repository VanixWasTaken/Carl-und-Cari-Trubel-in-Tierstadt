extends Node2D

var mouse_inside = false
var outline_shader = preload("res://Shader/outline.tres")
var no_shader = preload("res://Shader/no_shader.tres")

func _process(delta):

			# Handles Input to close the menu via the quit button
	if mouse_inside and Input.is_action_just_pressed("left_click"):
		$"../..".note_open = false
		%Click.play()
		var note_menu = get_parent()
		var house_thing = note_menu.get_parent()
		house_thing.emit_signal("reactivate_house")
		note_menu.visible = false
		Global.moving_allowed = true
		var children = note_menu.get_children()
		for child in children:
			if child.name == "JobNote1":
				child.visible = false


	  # for shaders
func _on_area_2d_mouse_entered():
	mouse_inside = true
	$Sprite2D.material = outline_shader
	_hover()
func _on_area_2d_mouse_exited():
	mouse_inside = false
	$Sprite2D.material = no_shader


func _hover():
	var stream = AudioStreamRandomizer.new()
	stream.add_stream(0, load("res://Assets/Sound/SFX/UI/Hover/sfx_hub_ui_hover_var1.mp3"))
	stream.add_stream(1, load("res://Assets/Sound/SFX/UI/Hover/sfx_hub_ui_hover_var3.mp3"))
	%Hover.stream = stream
	%Hover.play()
