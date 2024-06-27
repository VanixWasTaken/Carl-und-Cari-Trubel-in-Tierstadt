extends Node

var mouse_full = false
var mouse_in_button = false
var moving_allowed = true #save
var character = "" #save
var open_tutorial_door = false
var dialog_playing = false
var lab_cutscene_played = false 
var cutscene_playing = false 
var talked_to_chris
var should_shoot = false
var menu_open = false
var tutorial_help_button_state = 0
var laboratory_help_button_state = 0
var mini_help_button_state = 0
var exit_coordinates
var first_game_start = true #save

var completed_jobs = [] #save
var job_stars_dict : Dictionary = {  #save
	"ChemistJob" : null
}

var story_dialog_tracker : Dictionary = {
	1: "res://Scenes and Scripts/Dialog/Map Dialoge/Bianca Dialog/bianca_dialog_1.tscn",
	2: "res://Scenes and Scripts/Dialog/Map Dialoge/Band Story Dialog/band_member_dialog_4.tscn"
}

var last_scene : String 

var talked_to_chameleon = false #Wird auf true gesetzt, wenn man mit dem chamäleon geredet hat auf freiwilliger basis
var talked_to_chameleon_2 = false #wird aufn true gesetzt, wenn mann nach dem 1. Minispiel mit dem chameleon geredet hat
var talked_to_chameleon_3 = false #wird aufn true gesetzt, wenn mann nach dem 2. Minispiel mit dem chameleon geredet hat
var talked_to_chameleon_4 = false #wird aufn true gesetzt, wenn mann nach dem 3. Minispiel mit dem chameleon geredet hat
var return_laboratory_1 = false #wird auf true gesetzt, wenn man aus dem ersten minispiel zurück kommt
var return_laboratory_2 = false #wird auf true gesetzt, wenn man aus dem 2 minigame kommt
var return_laboratory_3 = false #wird auf true gesetzt, wenn man aus dem 3 minigame kommt
@onready var map_scene = preload("res://Scenes and Scripts/Game/Map/map.tscn")
@onready var laboratory_scene = preload("res://Scenes and Scripts/Game/Laboratory/laboratory_3d.tscn")
@onready var start_scene = preload("res://Scenes and Scripts/Menus/StartUp/start_up.tscn")                                                                                         
var custom_mouse_cursor = preload("res://Assets/Art/UI/player_mouse.png")
var custom_mouse_cursor_clicked = preload("res://Assets/Art/UI/player_mouse_clicked.png")


###### This variable are used for storing which job is currently played 
var inside_laboratory : bool = false



###### Thess variable are used to create an instance of the pause menu
@onready var pause = preload("res://Scenes and Scripts/Menus/Pause Menu/pause_menu.tscn")
var pause_opened = true ### set to true, to stop the menu from opening before the game starts


###### These variables are used for the volume control using the options menu
var master_volume = 0.7
var dialog_volume = 0.5
var sfx_volume = 0.7
var music_volume = 0.7



func _ready():
	Input.set_custom_mouse_cursor(custom_mouse_cursor)



func _input(event):
	if event.is_action_pressed("escape"): ## when esc is pressed, pause menu is created
		if !pause_opened:
			open_pause_menu()
	if event.is_action_pressed("left_click"):
		Input.set_custom_mouse_cursor(custom_mouse_cursor_clicked)
	if event.is_action_released("left_click"):
		Input.set_custom_mouse_cursor(custom_mouse_cursor)
	if Input.is_action_just_pressed("7"):
		load_map()
	elif Input.is_action_just_pressed("8"):
		load_laboratory_1()
	elif Input.is_action_just_pressed("9"):
		load_laboratory_2()
	elif Input.is_action_just_pressed("0"):
		reset_game()

func load_map():
	character = "Cari"
	dialog_playing = false
	cutscene_playing = false
	moving_allowed = true
	get_tree().change_scene_to_packed(map_scene)

func load_laboratory_1():
	character = "Cari"
	talked_to_chameleon = true
	return_laboratory_1 = true
	lab_cutscene_played = true
	talked_to_chameleon_2 = true
	dialog_playing = false
	cutscene_playing = false
	get_tree().change_scene_to_packed(laboratory_scene)

func load_laboratory_2():
	character = "Cari"
	talked_to_chameleon = true
	return_laboratory_1 = true
	lab_cutscene_played = true
	return_laboratory_2 = true
	dialog_playing = false
	cutscene_playing = false
	moving_allowed = true
	get_tree().change_scene_to_packed(laboratory_scene)

func reset_game():
	character = "Cari"
	talked_to_chameleon = false
	return_laboratory_1 = false
	lab_cutscene_played = false
	return_laboratory_2 = false
	talked_to_chameleon_3 = false
	get_tree().change_scene_to_packed(start_scene)

func downloadFile(img: Image, filename: String) -> void:
	var buffer = img.save_png_to_buffer()
	var base64Data: String = Marshalls.raw_to_base64(buffer)
	var url: String = "data:image/png;base64," + base64Data
	OS.shell_open(url)  # Opens the image in a new tab for download

func open_pause_menu(): ### creates an instance of the pause menu
	var scene = get_tree().get_current_scene()
	if !pause_opened and !dialog_playing and !menu_open and !cutscene_playing: ### checks if the conditions are met to instantiate
		if scene.name == "Map":
			pass
		else:
			var child = pause.instantiate()
			add_child(child)
			menu_open = true
			pause_opened = true ### parameter for the scenes to check if the pause is opened
