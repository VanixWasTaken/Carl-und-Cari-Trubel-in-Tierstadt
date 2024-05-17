extends Node3D
var mouse_inside = false
var can_pick_up = false
var player_inside = false


func _input(event):
	if Global.talked_to_chameleon_2:
		if Input.is_action_just_pressed("left_click"):
			if mouse_inside:
				can_pick_up = true
				if player_inside:
					get_tree().get_first_node_in_group("Root").picked_up_chemicals = true
					$AnimatedSprite3D.visible = false
					$AudioStreamPlayer.play()
			elif !mouse_inside:
				can_pick_up = false

func _on_area_3d_body_entered(body):
	if Global.talked_to_chameleon_2:
		if body.get_name() == "Player":
			player_inside = true
			if can_pick_up:
				Global.laboratory_help_button_state += 1
				get_tree().get_first_node_in_group("Root").picked_up_chemicals = true
				$AnimatedSprite3D.visible = false
				$AudioStreamPlayer.play()


func _on_area_3d_body_exited(body):
	if body.get_name() == "Player":
		player_inside = false


func _on_audio_stream_player_finished():
	queue_free()


func _on_mouse_area_mouse_entered():
	if Global.talked_to_chameleon_2:
		$AnimatedSprite3D.frame = 1
		mouse_inside = true


func _on_mouse_area_mouse_exited():
	$AnimatedSprite3D.frame = 0
	mouse_inside = false