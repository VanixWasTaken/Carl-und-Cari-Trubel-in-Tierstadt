extends Node

var mouse_full = false
var mouse_in_button = false
var moving_allowed = true
var character = ""
var open_tutorial_door = false
var dialog_playing = false
var lab_cutscene_played = false
var cutscene_playing = false
var talked_to_chris
var should_shoot = true
var menu_open = false
var tutorial_help_button_state = 0
var laboratory_help_button_state = 0
var mini_help_button_state = 0

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
var test_image = preload("res://Assets/Art/Characters/Cari/Dialog Icon/TESTIMAGE.png")

func _input(event):
	if Input.is_action_just_pressed("7"):
		load_map()
	elif Input.is_action_just_pressed("8"):
		load_laboratory_1()
	elif Input.is_action_just_pressed("9"):
		load_laboratory_2()
	elif Input.is_action_just_pressed("0"):
		reset_game()
	elif Input.is_action_just_pressed("2"):
		downloadFile(test_image, "YIPPIE")

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
