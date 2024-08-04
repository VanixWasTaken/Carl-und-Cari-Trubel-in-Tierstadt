extends Node2D

@onready var sound = $UI
@onready var intro_scn = preload("res://Scenes and Scripts/Menus/Intro Cutscene/intro_cutscene.tscn")
@onready var tutorial_scn = preload("res://Scenes and Scripts/Game/Tutorial/tutorial.tscn")
@onready var map_scn = preload("res://Scenes and Scripts/Game/Map/map.tscn")
@onready var laboratory_scn = preload("res://Scenes and Scripts/Game/Laboratory/laboratory_3d.tscn")
@onready var garden_scn = preload("res://Scenes and Scripts/Game/Garden Center/garden_center.tscn")

var mouse_inside_disabled = false


func _ready():
	$"Alpha Label".text = Global.version
	MusicController._play_music("welcome", "title", -18, 0)
	$CloudsWhoosch.play()
	if !FileAccess.file_exists("user://savegame.save"):
		$"VBoxContainer/Load Game".disabled = true
	else:
		$"VBoxContainer/Load Game".disabled = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if mouse_inside_disabled and Input.is_action_just_pressed("left_click"):
		$DisClick.play()

# Input for usability
func _on_start_button_up():
	SaveSystem.reset_game()
	
	Global.first_game_start = false
	$Clouds.play_backwards("default")
	$Clouds.visible = true
	$CloudsWhoosch.play()
	MusicController._fade_to_volume(-80, 1.125)
	await get_tree().create_timer(1.125).timeout
	get_tree().change_scene_to_packed(intro_scn)

func _on_options_button_up():
	$OptionsMenu.visible = true

func _on_credits_button_up():
	$CreditsMenu.visible = true

func _on_quit_button_up():
	get_tree().quit()

# Handles the Hover sounds
func _on_button_hovered():
	$Hover.play()

# Handles the Click sounds
func _on_button_click():
	$Click.play()

func _on_clouds_animation_finished():
	$Clouds.visible = false


func _on_animation_player_animation_finished(anim_name):
	$BackgroundClouds/AnimationPlayer4.play("new_animation")

func _on_animation_player_2_animation_finished(anim_name):
	$BackgroundClouds/AnimationPlayer5.play("new_animation")

func _on_animation_player_3_animation_finished(anim_name):
	$BackgroundClouds/AnimationPlayer6.play("new_animation")



func _on_load_game_button_up():
	Global.comes_from_savefile = true
	$Clouds.play_backwards("default")
	$Clouds.visible = true
	$CloudsWhoosch.play()
	MusicController._fade_to_volume(-80, 1.125)
	if Global.last_scene == "Tutorial":
		await get_tree().create_timer(1.125).timeout
		get_tree().change_scene_to_packed(tutorial_scn)
	elif Global.last_scene == "Map":
		await get_tree().create_timer(1.125).timeout
		get_tree().change_scene_to_packed(map_scn)
	elif Global.last_scene == "Laboratory":
		await get_tree().create_timer(1.125).timeout
		get_tree().change_scene_to_packed(laboratory_scn)
	elif Global.last_scene == "GardenCenter":
		await get_tree().create_timer(1.125).timeout
		get_tree().change_scene_to_packed(garden_scn)


func _on_load_game_mouse_entered():
	if $"VBoxContainer/Load Game".disabled:
		mouse_inside_disabled = true
		$Hover.play()
	else:
		$Hover.play()

func _on_load_game_mouse_exited():
	if $"VBoxContainer/Load Game".disabled:
		mouse_inside_disabled = false
