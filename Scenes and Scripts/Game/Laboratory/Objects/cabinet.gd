extends AnimatedSprite3D
var door_open = false
var mouse_inside = false
var filler_dialog = preload ("res://Scenes and Scripts/Dialog/Laboratory Dialog/Inspection Dialog/inspection_before_talking.tscn")
var player_inside = false
var dialog_instance
func  _ready():
	if Global.return_laboratory_1:
		$"Reagenz Glasses".queue_free()

func _on_area_3d_mouse_entered():
	frame = 1
	mouse_inside = true

func _on_area_3d_mouse_exited():
	frame = 0
	mouse_inside = false

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
			if !door_open:
				door_open = true
				$Sprite3D.visible = false
				if $"Reagenz Glasses" != null:
					$"Reagenz Glasses".position.y += 100
			elif door_open:
				door_open = false
				$Sprite3D.visible = true
				if $"Reagenz Glasses" != null:
					$"Reagenz Glasses".position.y -= 100


func _on_area_3d_body_entered(body):
	if body.get_name() == "Player":
		player_inside = true
		if !Global.talked_to_chameleon:
			dialog_instance = filler_dialog.instantiate()
			get_tree().get_current_scene().add_child(dialog_instance)
			_on_area_3d_mouse_exited()
		else:
			pass

func _on_area_3d_body_exited(body):
	player_inside = false
