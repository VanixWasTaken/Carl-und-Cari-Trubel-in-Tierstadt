extends Node2D


var mouse_inside = false
var mouse_inside_job_note1 = false
var outline_shader = preload("res://Shader/outline.tres")
var no_shader = preload("res://Shader/no_shader.tres")
var open_note_menu = false
var open_note1 = 0


func _process(delta):
	if mouse_inside:
		$Sprite2D.material = outline_shader
	else:
		$Sprite2D.material = no_shader
	if Input.is_action_just_pressed("left_click") and open_note_menu == true:
		open_note_menu = false
	if mouse_inside and Input.is_action_just_pressed("left_click"):
		open_note_menu = true
	if open_note_menu == true:
		$JobNoteMenu.visible = true
		$JobNoteMenu/InJobMenuJobNote1.visible = true
	else:
		$JobNoteMenu.visible = false
		$JobNoteMenu/InJobMenuJobNote1.visible = false

	if mouse_inside_job_note1 and Input.is_action_just_pressed("left_click"):
		$JobNoteMenu/InJobMenuJobNote1/JobNote1.visible = true

# for shaders
func _on_area_2d_mouse_entered():
	mouse_inside = true
func _on_area_2d_mouse_exited():
	mouse_inside = false


func _on_area_2d_InJobMenuJobNote1_mouse_entered():
	mouse_inside_job_note1 = true
func _on_area_2d_InJobMenuJobNote1_mouse_exited():
	mouse_inside_job_note1 = true
