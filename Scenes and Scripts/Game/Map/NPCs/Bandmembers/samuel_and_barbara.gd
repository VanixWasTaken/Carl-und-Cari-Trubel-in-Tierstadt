extends Node2D

var mouse_inside = false
var player_inside = false
var clicked_on = false
var dialog_scene = preload("res://Scenes and Scripts/Dialog/Map Dialoge/Band Story Dialog/band_member_dialog_3.tscn")


func _input(event):
	if event.is_action_released("left_click") && mouse_inside && player_inside:
		start_dialog()
	elif event.is_action_released("left_click") && mouse_inside && !player_inside:
		clicked_on = true
	elif event.is_action_released("left_click") && !mouse_inside:
		clicked_on = false

func _on_area_2d_mouse_entered():
	mouse_inside = true
	if !Global.dialog_playing:
		$AnimatedSprite2D.frame = 1


func _on_area_2d_mouse_exited():
	mouse_inside = false
	$AnimatedSprite2D.frame = 0


func _on_area_2d_body_entered(body):
	player_inside = true
	if clicked_on:
		start_dialog()


func start_dialog():
	if !Global.dialog_playing:
		var dialog_instance
		dialog_instance = dialog_scene.instantiate()
		get_tree().get_current_scene().add_child(dialog_instance)

func _on_area_2d_body_exited(body):
	player_inside = false
