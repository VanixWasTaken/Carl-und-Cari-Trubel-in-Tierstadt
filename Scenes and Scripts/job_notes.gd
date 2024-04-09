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

		  # Deactivates the houses Area2D, so you cant click it when the notes are open
	if !$JobNoteMenu.visible:
		emit_signal("reactivate_house")
	else:
		emit_signal("deactivate_house")

		   # Handles input to open and close the notes menu via clicking the notes icon
	if mouse_inside and Input.is_action_just_pressed("left_click"):
		$JobNoteMenu.visible = true
	elif mouse_inside and Input.is_action_just_pressed("left_click") and $JobNoteMenu.visible:
		$JobNoteMenu.visible = false

		 # lets the player close the menu by pressing rmb, which is a cool additional feature
	if Input.is_action_just_pressed("right_click") and $JobNoteMenu.visible:
		$JobNoteMenu.visible = false

		   # Handles input to open and close the steckbrief via clicking its icon
	if mouse_inside_job_note1 and Input.is_action_just_pressed("left_click") and !$JobNoteMenu/JobNote1.visible:
		$JobNoteMenu/JobNote1.visible = true
	elif mouse_inside_job_note1 and Input.is_action_just_pressed("left_click") and $JobNoteMenu/JobNote1.visible:
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
