extends Node

var mouse_inside_left_arrow = false
var mouse_inside_right_arrow = false

var item_dict: Dictionary = {
	"PlantPot" : 0,
	"StonePlate" : 1,
	"Flower" : 2
}

const ARROW = preload("res://Assets/Art/Environment/Quiz/Arrow_right.png")
const ARROW_HIGHLIGHT = preload("res://icon.png")

signal move_right
signal move_left

func _input(event):
	if event.is_action_pressed("left_click") and mouse_inside_right_arrow:
		move_right.emit()
	if event.is_action_pressed("left_click") and mouse_inside_left_arrow:
		move_left.emit()

func _on_right_area_mouse_entered():
	mouse_inside_right_arrow = true
	$ArrowRight.texture = ARROW_HIGHLIGHT
func _on_right_area_mouse_exited():
	mouse_inside_right_arrow = false
	$ArrowRight.texture = ARROW

func _on_left_area_mouse_entered():
	mouse_inside_left_arrow = true
	$ArrowLeft.texture = ARROW_HIGHLIGHT
func _on_left_area_mouse_exited():
	mouse_inside_left_arrow = false
	$ArrowLeft.texture = ARROW
