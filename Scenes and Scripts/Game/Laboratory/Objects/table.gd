extends Sprite3D

var outline_shader = preload("res://Assets/Art/Environment/Rooms/Laboratory/Objects/lab_desk_island_highlight.png")
var no_shader = preload("res://Assets/Art/Environment/Rooms/Laboratory/Objects/lab_desk_island.png")
var mouse_inside = false
var can_interact = false
var player_inside = false
var gathered_all_instruments = false
var got_vessel = false
var got_scale = false
var got_glasses = false 

func _process(delta):
	if got_glasses && got_scale && got_vessel:
		gathered_all_instruments = true

func _on_area_3d_mouse_entered():
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
				if !gathered_all_instruments:
					if get_tree().get_first_node_in_group("Root").picked_up_scale == true:
						$Scale.visible = true
						got_scale = true
					if get_tree().get_first_node_in_group("Root").picked_up_vessel == true:
						$Vessel.visible = true
						got_vessel = true
					if get_tree().get_first_node_in_group("Root").picked_up_reagenz_glasses == true:
						$ReagenzGlasses.visible = true
						got_glasses = true
				elif gathered_all_instruments:
					get_tree().change_scene_to_file("res://Scenes and Scripts/Game/Laboratory/chemical_laboratory.tscn")
		elif !mouse_inside:
			can_interact = false

func _on_area_3d_body_entered(body):
	if body.get_name() == "Player":
		player_inside = true
		if can_interact:
			if !gathered_all_instruments:
				if get_tree().get_first_node_in_group("Root").picked_up_scale == true:
					$Scale.visible = true
					got_scale = true
				if get_tree().get_first_node_in_group("Root").picked_up_vessel == true:
					$Vessel.visible = true
					got_vessel = true
				if get_tree().get_first_node_in_group("Root").picked_up_reagenz_glasses == true:
					$ReagenzGlasses.visible = true
					got_glasses = true
			elif gathered_all_instruments:
				get_tree().change_scene_to_file("res://Scenes and Scripts/Game/Laboratory/chemical_laboratory.tscn")



func _on_area_3d_body_exited(body):
	if body.get_name() == "Player":
		player_inside = false
