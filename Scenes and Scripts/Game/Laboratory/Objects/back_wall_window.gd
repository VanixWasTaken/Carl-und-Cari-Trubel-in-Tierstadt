extends AnimatedSprite3D

var into_spray_dialog = preload("res://Scenes and Scripts/Dialog/Laboratory Dialog/laboratory_into_spray_game.tscn")
var mouse_inside = false
var can_interact = false
var player_inside = false
var changed_scenery = false

func _on_area_3d_mouse_entered():
	if Global.talked_to_chameleon_3 && !Global.return_laboratory_3:
		frame = 2
		mouse_inside = true
	else:
		frame = 0

func _on_area_3d_mouse_exited():
	if Global.talked_to_chameleon_3 && !Global.return_laboratory_3:
		frame = 1
		mouse_inside = false 
	else:
		frame = 0

func _input(event):
	if Input.is_action_just_pressed("left_click"):
		if mouse_inside:
			can_interact = true
			if player_inside:
				if Global.talked_to_chameleon_3 && !Global.return_laboratory_3:
					var dialog_instance = into_spray_dialog.instantiate()
					get_tree().get_current_scene().add_child(dialog_instance)
					reset_mouse()
		elif !mouse_inside:
			can_interact = false

func _on_area_3d_body_entered(body):
	if body.get_name() == "Player":
		player_inside = true
		if can_interact:
			if Global.talked_to_chameleon_3 && !Global.return_laboratory_3:
				var dialog_instance = into_spray_dialog.instantiate()
				get_tree().get_current_scene().add_child(dialog_instance)
				reset_mouse()


func _on_area_3d_body_exited(body):
	if body.get_name() == "Player":
		player_inside = false

func reset_mouse():
	mouse_inside = false
	can_interact = false
	if Global.talked_to_chameleon_3 && !Global.return_laboratory_3:
		frame = 1
	else:
		frame = 0

func _process(delta):
	if Global.talked_to_chameleon_3 && !changed_scenery:
		frame = 1
		changed_scenery = true
