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
var chemist_note = preload("res://Assets/Art/UI/HUD/Map/job_note_image.png")
var one_star  = preload("res://Assets/Art/UI/HUD/Map/Stars/profile_stars1.png")
var two_star  = preload("res://Assets/Art/UI/HUD/Map/Stars/profile_stars2.png")
var three_star  = preload("res://Assets/Art/UI/HUD/Map/Stars/profile_stars3.png")
var four_star  = preload("res://Assets/Art/UI/HUD/Map/Stars/profile_stars4.png")
var five_star  = preload("res://Assets/Art/UI/HUD/Map/Stars/profile_stars5.png")

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
		Global.pause_opened = true
		%HelpButton.visible = false
	elif !$JobNoteMenu.visible:
		%HelpButton.visible = true
		Global.pause_opened = false

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
func _on_area_2d_mouse_exited():
	Global.mouse_in_button = false

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
	downloadFile(chemist_note, "Chemielabor-Informationen.jpg")

func downloadFile(img: Image, filename: String) -> void:
	var buffer = img.save_jpg_to_buffer()
	var desktop_path = OS.get_system_dir(OS.SYSTEM_DIR_DESKTOP) + "/" + filename
	var file = FileAccess.open(desktop_path, FileAccess.WRITE)
	if file:
		file.store_buffer(buffer)
		file.close()
	# Verwenden Sie die neue Funktion, um den Puffer herunterzuladen.
	#JavaScriptBridge.download_buffer(buffer, filename) || Das hier ist für Online, aber wenn wirs nicht online nutzen, dann einfach mal auskommentiert lassen, kann ja nicht schaden


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
	elif !$JobNoteMenu.visible && !Global.cutscene_playing:
		emit_signal("deactivate_house")
		$JobNoteMenu.visible = true
		%Click.play()
		note_open = true
		Global.menu_open = true
		if Global.job_stars_dict.size() > 0:
			if Global.job_stars_dict["ChemistJob"] == 1:
				$JobNoteMenu/ChemistNoteSmall/Stars.texture = one_star
			elif Global.job_stars_dict["ChemistJob"] == 2:
				$JobNoteMenu/ChemistNoteSmall/Stars.texture = two_star
			elif Global.job_stars_dict["ChemistJob"] == 3:
				$JobNoteMenu/ChemistNoteSmall/Stars.texture = three_star
			elif Global.job_stars_dict["ChemistJob"] == 4:
				$JobNoteMenu/ChemistNoteSmall/Stars.texture = four_star
			elif Global.job_stars_dict["ChemistJob"] == 5:
				$JobNoteMenu/ChemistNoteSmall/Stars.texture = five_star
			if Global.job_stars_dict["GardenJob"] == 1:
				$JobNoteMenu/ChemistNoteSmall/Stars.texture = one_star
			elif Global.job_stars_dict["GardenJob"] == 2:
				$JobNoteMenu/ChemistNoteSmall/Stars.texture = two_star
			elif Global.job_stars_dict["GardenJob"] == 3:
				$JobNoteMenu/ChemistNoteSmall/Stars.texture = three_star
			elif Global.job_stars_dict["GardenJob"] == 4:
				$JobNoteMenu/ChemistNoteSmall/Stars.texture = four_star
			elif Global.job_stars_dict["GardenJob"] == 5:
				$JobNoteMenu/ChemistNoteSmall/Stars.texture = five_star



func _on_quit_chemist_big_button_up():
	$JobNoteMenu/ChemistNoteBig.visible = false


func _on_open_notes_mouse_entered():
	_paper_hover()
	Global.moving_allowed = false
	Global.mouse_in_button = true



func _on_open_notes_mouse_exited():
	Global.moving_allowed = true
	Global.mouse_in_button = false


func _on_gardener_download_button_up():
	$DownloadExplanation.visible = true
	downloadFile(chemist_note, "Chemielabor-Informationen.jpg")


func _on_open_profile_button_up():
	$JobNoteMenu/Gardener/GardenerNodeBig.show()


func _on_close_big_gardener_button_up():
	$JobNoteMenu/Gardener/GardenerNodeBig.hide()
