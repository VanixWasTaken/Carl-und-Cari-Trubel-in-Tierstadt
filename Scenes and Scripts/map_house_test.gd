extends Node2D


var mouse_inside = false

func _process(delta):
	if mouse_inside:
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	if mouse_inside and Input.is_action_just_pressed("left_click"):
		get_tree().change_scene_to_file("res://Scenes and Scripts/test.tscn")
	


func _on_area_2d_mouse_entered():
	mouse_inside = true
func _on_area_2d_mouse_exited():
	mouse_inside = false


func _on_job_notes_deactivate_house():
	$Area2D.visible = false

func _on_job_notes_reactivate_house():
	$Area2D.visible = true
