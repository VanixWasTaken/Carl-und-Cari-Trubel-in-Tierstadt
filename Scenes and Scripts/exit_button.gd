extends Node2D

var mouse_inside = false
var outline_shader = preload("res://Shader/outline.tres")
var no_shader = preload("res://Shader/no_shader.tres")

func _process(delta):

			# Handles Input to close the menu via the quit button
	if mouse_inside and Input.is_action_just_pressed("left_click"):
		_randomize_sounds()
		var note_menu = get_parent()
		var house_thing = note_menu.get_parent()
		house_thing.emit_signal("reactivate_house")
		note_menu.visible = false
		var children = note_menu.get_children()
		for child in children:
			if child.name == "JobNote1":
				child.visible = false


	  # for shaders
func _on_area_2d_mouse_entered():
	mouse_inside = true
	$Sprite2D.material = outline_shader
	$Hover.play()
func _on_area_2d_mouse_exited():
	mouse_inside = false
	$Sprite2D.material = no_shader

func _randomize_sounds():
	var random = randi_range(1, 3) % 3
	match random:
		0:
			$Click.stream = load("res://Assets/Sound Test/sfx_hub_ui_click_var1.mp3")
		1:
			$Click.stream = load("res://Assets/Sound Test/sfx_hub_ui_click_var2.mp3")
		2:
			$Click.stream = load("res://Assets/Sound Test/sfx_hub_ui_click_var3.mp3")
	$Click.play()
