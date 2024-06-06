extends Node2D

var mouse_inside = false
var outline_shader = preload("res://Shader/outline.tres")
var no_shader = preload("res://Shader/no_shader.tres")

	  # for shaders
func _on_area_2d_mouse_entered():
	$Sprite2D.material = outline_shader
	_hover()
func _on_area_2d_mouse_exited():
	$Sprite2D.material = no_shader


func _hover():
	var stream = AudioStreamRandomizer.new()
	stream.add_stream(0, load("res://Assets/Sound/SFX/UI/Hover/sfx_hub_ui_hover_var1.mp3"))
	stream.add_stream(1, load("res://Assets/Sound/SFX/UI/Hover/sfx_hub_ui_hover_var3.mp3"))
	%Hover.stream = stream
	%Hover.play()

func _on_texture_button_button_up():
	$"../..".note_open = false
	%Click.play()
	var note_menu = get_parent()
	var house_thing = note_menu.get_parent()
	house_thing.emit_signal("reactivate_house")
	note_menu.visible = false
	Global.moving_allowed = true
	Global.menu_open = false
