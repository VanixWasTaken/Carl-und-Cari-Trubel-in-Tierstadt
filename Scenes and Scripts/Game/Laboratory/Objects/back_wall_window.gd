extends Sprite3D

var outline_shader = preload("res://Assets/Art/Environment/Rooms/Laboratory/Objects/lab_wall_back_window_highlight.png")
var no_shader = null

var into_spray_dialog = preload("res://Scenes and Scripts/Dialog/Laboratory Dialog/laboratory_wall_hole_yes_chemicals.tscn")
var mouse_inside = false
var can_interact = false
var player_inside = false

func _on_area_3d_mouse_entered():
	if Global.talked_to_chameleon_3:
		$".".texture = outline_shader
		mouse_inside = true

func _on_area_3d_mouse_exited():
	$".".texture = no_shader
	mouse_inside = false 

func _input(event):
	if Input.is_action_just_pressed("left_click"):
		if mouse_inside:
			can_interact = true
			if player_inside:
				if Global.talked_to_chameleon_3:
					var dialog_instance = into_spray_dialog.instantiate()
					get_tree().get_current_scene().add_child(dialog_instance)
					reset_mouse()
		elif !mouse_inside:
			can_interact = false

func _on_area_3d_body_entered(body):
	if body.get_name() == "Player":
		player_inside = true
		if can_interact:
			if Global.talked_to_chameleon_3:
				var dialog_instance = into_spray_dialog.instantiate()
				get_tree().get_current_scene().add_child(dialog_instance)
				reset_mouse()


func _on_area_3d_body_exited(body):
	if body.get_name() == "Player":
		player_inside = false

func reset_mouse():
	$".".texture = no_shader
	mouse_inside = false
	can_interact = false


