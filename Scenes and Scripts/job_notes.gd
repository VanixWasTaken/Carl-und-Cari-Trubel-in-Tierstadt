extends Node2D

signal deactivate_house
signal reactivate_house

var mouse_inside = false
var mouse_inside_job_note1 = false
var mouse_inside_big_note = false
var outline_shader = preload("res://Shader/outline.tres")
var no_shader = preload("res://Shader/no_shader.tres")
var open_note1 = 0


func _process(delta):
	if $JobNoteMenu.visible:
		if Input.is_action_just_pressed("left_click"):
			if mouse_inside:
				emit_signal("deactivate_house")
				$JobNoteMenu.visible = false
				$JobNoteMenu/JobNote1.visible = false

		elif Input.is_action_just_pressed("right_click"):
			emit_signal("reactivate_house")
			$JobNoteMenu.visible = false
			$JobNoteMenu/JobNote1.visible = false

	elif !$JobNoteMenu.visible:
		if Input.is_action_just_pressed("left_click"):
			if mouse_inside:
				emit_signal("deactivate_house")
				$JobNoteMenu.visible = true

		   # Handles input to open and close the steckbrief via clicking its icon
	if mouse_inside_job_note1 and Input.is_action_just_pressed("left_click"):
		if !$JobNoteMenu/JobNote1.visible:
			$JobNoteMenu/JobNote1.visible = true
		elif $JobNoteMenu/JobNote1:
			$JobNoteMenu/JobNote1.visible = false


	elif mouse_inside_big_note and Input.is_action_just_pressed("left_click"):
		$JobNoteMenu/JobNote1.visible = false

# for shaders
func _on_area_2d_mouse_entered():
	mouse_inside = true
	$Sprite2D.material = outline_shader
func _on_area_2d_mouse_exited():
	mouse_inside = false
	$Sprite2D.material = no_shader


func _on_area_2d_InJobMenuJobNote1_mouse_entered():
	mouse_inside_job_note1 = true
	$JobNoteMenu/InJobMenuJobNote1/Sprite2D.material = outline_shader
func _on_area_2d_InJobMenuJobNote1_mouse_exited():
	mouse_inside_job_note1 = false
	$JobNoteMenu/InJobMenuJobNote1/Sprite2D.material = no_shader


func _on_paper_quit_mouse_entered():
	mouse_inside_big_note = true
	$JobNoteMenu/JobNote1/Sprite2D/QuitButton.material = outline_shader

func _on_paper_quit_mouse_exited():
	mouse_inside_big_note = false
	$JobNoteMenu/JobNote1/Sprite2D/QuitButton.material = no_shader
