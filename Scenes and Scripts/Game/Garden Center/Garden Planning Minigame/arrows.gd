extends Node

var mouse_inside_left_arrow = false
var mouse_inside_right_arrow = false

const ARROW = preload("res://Assets/Art/Environment/Rooms/Garden Center/Minigames/GardenPlanning/arrow.png")
const ARROW_HIGHLIGHT = preload("res://Assets/Art/Environment/Rooms/Garden Center/Minigames/GardenPlanning/arrow_selected.png")

signal move_right
signal move_left


func _input(event):
	if event.is_action_pressed("left_click") and mouse_inside_right_arrow:
		move_right.emit()
		$Click.play()
	if event.is_action_pressed("left_click") and mouse_inside_left_arrow:
		move_left.emit()
		$Click.play()

func _on_right_area_mouse_entered():
	mouse_inside_right_arrow = true
	$Hover.play()
	$ArrowRight.texture = ARROW_HIGHLIGHT
func _on_right_area_mouse_exited():
	mouse_inside_right_arrow = false
	$ArrowRight.texture = ARROW

func _on_left_area_mouse_entered():
	mouse_inside_left_arrow = true
	$Hover.play()
	$ArrowLeft.texture = ARROW_HIGHLIGHT
func _on_left_area_mouse_exited():
	mouse_inside_left_arrow = false
	$ArrowLeft.texture = ARROW
