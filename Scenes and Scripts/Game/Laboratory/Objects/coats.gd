extends Sprite3D

var no_shader = preload("res://Assets/Art/Environment/Rooms/Laboratory/Objects/lab_coats.png")
var outline_shader = preload("res://Assets/Art/Environment/Rooms/Laboratory/Objects/lab_coats_highlight.png")
var mouse_inside = false
var player_inside = false
var dialog_instance
var filler_dialog = preload("res://Scenes and Scripts/Dialog/Laboratory Dialog/Inspection Dialog/inspection_before_talking.tscn")

func _input(event):
	if Input.is_action_just_pressed("left_click"):
		if mouse_inside:
			if player_inside:
				if !Global.talked_to_chameleon:
					dialog_instance = filler_dialog.instantiate()
					get_tree().get_current_scene().add_child(dialog_instance)
					_on_area_3d_mouse_exited()
				else:
					pass

func _on_area_3d_body_entered(body):
	if body.get_name() == "Player":
		player_inside = true
		if !Global.talked_to_chameleon:
			dialog_instance = filler_dialog.instantiate()
			get_tree().get_current_scene().add_child(dialog_instance)
			_on_area_3d_mouse_exited()
		else:
			pass




func _on_area_3d_mouse_entered():
	$".".texture = outline_shader
	mouse_inside = true

func _on_area_3d_mouse_exited():
	$".".texture = no_shader
	mouse_inside = false



func _on_area_3d_body_exited(body):
	player_inside = false
