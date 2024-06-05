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
	if mouse_inside:
		Global.moving_allowed = false
		  # handles input when the note-menu is visible
	if $JobNoteMenu.visible:
		Global.moving_allowed = false
		if Input.is_action_just_pressed("left_click"):
			Global.moving_allowed = false
			if mouse_inside:
				emit_signal("reactivate_house")
				$JobNoteMenu.visible = false
				$JobNoteMenu/JobNote1.visible = false
				%Click.play()

		 # lets players close the note-menu by pressing rmb
		elif Input.is_action_just_pressed("right_click"):
			close_menu()

		   # handles input when the note-menu is not visible
	elif !$JobNoteMenu.visible:
		if Input.is_action_just_pressed("left_click"):
			if mouse_inside:
				emit_signal("deactivate_house")
				$JobNoteMenu.visible = true
				%Click.play()

		   # Handles input to open and close the steckbrief via clicking its icon
	if mouse_inside_job_note1 and Input.is_action_just_pressed("left_click"):
		if !$JobNoteMenu/JobNote1.visible:
			$JobNoteMenu/JobNote1.visible = true
			%Click.play()
		elif $JobNoteMenu/JobNote1:
			$JobNoteMenu/JobNote1.visible = false
			%Click.play()

	  # handles input to close the big-note via its exit-button
	elif mouse_inside_big_note and Input.is_action_just_pressed("left_click"):
		$JobNoteMenu/JobNote1.visible = false
		%Click.play()
	
	if $JobNoteMenu.visible:
		%HelpButton.visible = false
	elif !$JobNoteMenu.visible:
		%HelpButton.visible = true

# function to close the entire menu and reactivate the house
func close_menu():
	emit_signal("reactivate_house")
	$JobNoteMenu.visible = false
	$JobNoteMenu/JobNote1.visible = false
	%Click.play()
	Global.moving_allowed = true
	%HelpButton.menu_open = false

# for shaders
func _on_area_2d_mouse_entered():
	mouse_inside = true
	$Sprite2D.material = outline_shader
	_paper_hover()
func _on_area_2d_mouse_exited():
	mouse_inside = false
	$Sprite2D.material = no_shader
	Global.moving_allowed = true

	# checks for input on the note menu and handles its shaders and sounds
func _on_area_2d_InJobMenuJobNote1_mouse_entered():
	mouse_inside_job_note1 = true
	$JobNoteMenu/InJobMenuJobNote1/Sprite2D.material = outline_shader
	_paper_hover()
func _on_area_2d_InJobMenuJobNote1_mouse_exited():
	mouse_inside_job_note1 = false
	$JobNoteMenu/InJobMenuJobNote1/Sprite2D.material = no_shader

		  # checks for input on the paper-quitbutton and handles its shaders and sounds
func _on_paper_quit_mouse_entered():
	mouse_inside_big_note = true
	$JobNoteMenu/JobNote1/Sprite2D/QuitButton.material = outline_shader
	_paper_hover()
func _on_paper_quit_mouse_exited():
	mouse_inside_big_note = false
	$JobNoteMenu/JobNote1/Sprite2D/QuitButton.material = no_shader

func _paper_hover():
	var stream = AudioStreamRandomizer.new()
	stream.add_stream(0, load("res://Assets/Sound/SFX/UI/Specific/Map/sfx_hub_ui_paper_var1.mp3"))
	stream.add_stream(1, load("res://Assets/Sound/SFX/UI/Specific/Map/sfx_hub_ui_paper_var2.mp3"))
	stream.add_stream(2, load("res://Assets/Sound/SFX/UI/Specific/Map/sfx_hub_ui_paper_var3.mp3"))
	%Hover.stream = stream
	%Hover.play()
	
