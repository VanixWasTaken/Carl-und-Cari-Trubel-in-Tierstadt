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
			if mouse_inside:
				emit_signal("reactivate_house")
				$JobNoteMenu.visible = false
				$JobNoteMenu/JobNote1.visible = false
				_randomize_sounds()

		 # lets players close the note-menu by pressing rmb
		elif Input.is_action_just_pressed("right_click"):
			close_menu()

		   # handles input when the note-menu is not visible
	elif !$JobNoteMenu.visible:
		if Input.is_action_just_pressed("left_click"):
			if mouse_inside:
				emit_signal("deactivate_house")
				$JobNoteMenu.visible = true
				_randomize_sounds()

		   # Handles input to open and close the steckbrief via clicking its icon
	if mouse_inside_job_note1 and Input.is_action_just_pressed("left_click"):
		if !$JobNoteMenu/JobNote1.visible:
			$JobNoteMenu/JobNote1.visible = true
			_randomize_sounds()
		elif $JobNoteMenu/JobNote1:
			$JobNoteMenu/JobNote1.visible = false
			_randomize_sounds()

	  # handles input to close the big-note via its exit-button
	elif mouse_inside_big_note and Input.is_action_just_pressed("left_click"):
		$JobNoteMenu/JobNote1.visible = false
		_randomize_sounds()

# function to close the entire menu and reactivate the house
func close_menu():
	emit_signal("reactivate_house")
	$JobNoteMenu.visible = false
	$JobNoteMenu/JobNote1.visible = false
	_randomize_sounds()
	Global.moving_allowed = true

# for shaders
func _on_area_2d_mouse_entered():
	mouse_inside = true
	$Sprite2D.material = outline_shader
	$Hover.play()
func _on_area_2d_mouse_exited():
	mouse_inside = false
	$Sprite2D.material = no_shader

	# checks for input on the note menu and handles its shaders and sounds
func _on_area_2d_InJobMenuJobNote1_mouse_entered():
	mouse_inside_job_note1 = true
	$JobNoteMenu/InJobMenuJobNote1/Sprite2D.material = outline_shader
	$Hover.play()
func _on_area_2d_InJobMenuJobNote1_mouse_exited():
	mouse_inside_job_note1 = false
	$JobNoteMenu/InJobMenuJobNote1/Sprite2D.material = no_shader

		  # checks for input on the paper-quitbutton and handles its shaders and sounds
func _on_paper_quit_mouse_entered():
	mouse_inside_big_note = true
	$JobNoteMenu/JobNote1/Sprite2D/QuitButton.material = outline_shader
	$Hover.play()
func _on_paper_quit_mouse_exited():
	mouse_inside_big_note = false
	$JobNoteMenu/JobNote1/Sprite2D/QuitButton.material = no_shader

   # randomizes the click sounds
func _randomize_sounds():
	var random = randi_range(1, 3) % 3
	match random:
		0:
			$Click.stream = load("res://Assets/Sound Test/sfx_hub_ui_click_var1.mp3")
		1:
			$Click.stream = load("res://Assets/Sound Test/sfx_hub_ui_click_var2.mp3")
		2:
			$Click.stream = load("res://Assets/Sound Test/sfx_hub_ui_click_var3.mp3")
	$Click.play()
