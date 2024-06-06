extends Node2D

signal deactivate_house
signal reactivate_house
var mouse_inside = false
var note_open = false
var mouse_inside_job_note1 = false
var mouse_inside_big_note = false
var outline_shader = preload("res://Shader/outline.tres")
var no_shader = preload("res://Shader/no_shader.tres")
var open_note1 = 0
var chemist_note = preload("res://Assets/Art/Characters/Cari/Dialog Icon/TESTIMAGE.png")

func _ready():
	if Global.return_laboratory_3:
		$JobNoteMenu/ChemistNoteSmall.visible = true
		

func _process(delta):
	if $JobNoteMenu.visible:
		Global.moving_allowed = false
		 # lets players close the note-menu by pressing rmb
		if Input.is_action_just_pressed("right_click"):
			close_menu()

	if $JobNoteMenu.visible:
		%HelpButton.visible = false
	elif !$JobNoteMenu.visible:
		%HelpButton.visible = true

# function to close the entire menu and reactivate the house
func close_menu():
	emit_signal("reactivate_house")
	$JobNoteMenu.visible = false
	$JobNoteMenu/ChemistNoteBig.visible = false
	%Click.play()
	note_open = false
	Global.moving_allowed = true
	Global.menu_open = false
	%HelpButton.menu_open = false

# for shaders
func _on_area_2d_mouse_entered():
	_paper_hover()
	Global.moving_allowed = false
	Global.mouse_in_button = true
	print("cockpenicock")
func _on_area_2d_mouse_exited():
	Global.mouse_in_button = false
	print("AAAAAAAAAAcockAAAAAA")

		  # checks for input on the paper-quitbutton and handles its shaders and sounds
func _on_paper_quit_mouse_entered():
	_paper_hover()

func _paper_hover():
	var stream = AudioStreamRandomizer.new()
	stream.add_stream(0, load("res://Assets/Sound/SFX/UI/Specific/Map/sfx_hub_ui_paper_var1.mp3"))
	stream.add_stream(1, load("res://Assets/Sound/SFX/UI/Specific/Map/sfx_hub_ui_paper_var2.mp3"))
	stream.add_stream(2, load("res://Assets/Sound/SFX/UI/Specific/Map/sfx_hub_ui_paper_var3.mp3"))
	%Hover.stream = stream
	%Hover.play()


func _on_chemist_download_button_up():
	$DownloadExplanation.visible = true
	downloadFile(chemist_note, "Chemielabor-Informationen")

func downloadFile(img: Image, filename: String) -> void:
	var buffer = img.save_png_to_buffer()
	var base64Data: String = Marshalls.raw_to_base64(buffer)
	var url: String = "data:image/png;base64," + base64Data
	OS.shell_open(url)  # Opens the image in a new tab for download


func _on_texture_button_button_up():
	$DownloadExplanation.visible = false


func _on_chemist_symbol_button_up():
	if !$JobNoteMenu/ChemistNoteBig.visible:
		$JobNoteMenu/ChemistNoteBig.visible = true
		%Click.play()
	elif $JobNoteMenu/ChemistNoteBig:
		$JobNoteMenu/ChemistNoteBig.visible = false
		%Click.play()


func _on_open_notes_button_up():
	if $JobNoteMenu.visible:
		close_menu()
	elif !$JobNoteMenu.visible:
		emit_signal("deactivate_house")
		$JobNoteMenu.visible = true
		%Click.play()
		note_open = true
		Global.menu_open = true



func _on_quit_chemist_big_button_up():
	$JobNoteMenu/ChemistNoteBig.visible = false
