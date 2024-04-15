extends Node2D


var mouse_inside = false
var my_name = "null"
@export var scene_name: String

func _ready():
	my_name = get_name()
	MusicController._play_music("happyday", "hub", -20)

func _process(delta):
	if mouse_inside:
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	if mouse_inside and Input.is_action_just_pressed("left_click"):
		$Click.play()
		$"../Player"._get_clicked_object(my_name, scene_name)

# handles the input for clicking on the house to enter the level
func _on_area_2d_mouse_entered():
	mouse_inside = true
	$Hover.play()
func _on_area_2d_mouse_exited():
	mouse_inside = false

# deactivates the functionality of the house, by making the area2d invisible
func _on_job_notes_deactivate_house():
	$Area2D.visible = false

func _on_job_notes_reactivate_house():
	$Area2D.visible = true
