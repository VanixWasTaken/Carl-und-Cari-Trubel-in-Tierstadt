extends Sprite3D

var no_shader = preload("res://Assets/Art/Environment/Rooms/Laboratory/Objects/lab_coats.png")
var outline_shader = preload("res://Assets/Art/Environment/Rooms/Laboratory/Objects/lab_coats_highlight.png")
var mouse_inside = false
var player_inside = false
var dialog_instance
var filler_dialog = preload("res://Scenes and Scripts/Dialog/Laboratory Dialog/Inspection Dialog/inspection_before_talking.tscn")
var inspection_dialog = preload("res://Scenes and Scripts/Dialog/Laboratory Dialog/Inspection Dialog/inspection_coats.tscn")
var can_interact = false

func _input(event):
	if Input.is_action_just_pressed("left_click"):
		if mouse_inside:
			$"../../Click".play()
			can_interact = true
			if player_inside:
				if !Global.talked_to_chameleon:
					dialog_instance = filler_dialog.instantiate()
					get_tree().get_current_scene().add_child(dialog_instance)
					reset_mouse()
				else:
					dialog_instance = inspection_dialog.instantiate()
					get_tree().get_current_scene().add_child(dialog_instance)
					reset_mouse()

func _on_area_3d_body_entered(body):
	if body.get_name() == "Player":
		player_inside = true
		if can_interact:
			if !Global.talked_to_chameleon:
				dialog_instance = filler_dialog.instantiate()
				get_tree().get_current_scene().add_child(dialog_instance)
				reset_mouse()
			else:
				dialog_instance = inspection_dialog.instantiate()
				get_tree().get_current_scene().add_child(dialog_instance)
				reset_mouse()




func _on_area_3d_mouse_entered():
	$".".texture = outline_shader
	$"../../Hover".play()
	mouse_inside = true

func _on_area_3d_mouse_exited():
	$".".texture = no_shader
	mouse_inside = false

func reset_mouse():
	$".".texture = no_shader
	mouse_inside = false
	can_interact = false


func _on_area_3d_body_exited(body):
	player_inside = false
