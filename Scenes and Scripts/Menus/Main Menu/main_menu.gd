extends Node2D

@onready var sound = $UI
@onready var intro_scene = preload("res://Scenes and Scripts/Menus/Intro Cutscene/intro_cutscene.tscn")
@onready var tutorial_scene = preload("res://Scenes and Scripts/Game/Tutorial/tutorial.tscn")
@onready var map_scene = preload("res://Scenes and Scripts/Game/Map/map.tscn")
@onready var laboratory_scene = preload("res://Scenes and Scripts/Game/Laboratory/laboratory_3d.tscn")


func _ready():
	$CloudsWhoosch.play()
	if Global.first_game_start:
		$"VBoxContainer/Load Game".disabled = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Input for usability
func _on_start_button_up():
	Global.first_game_start = false
	$Clouds.play_backwards("default")
	$Clouds.visible = true
	$CloudsWhoosch.play()
	MusicController._fade_to_volume(-80, 1.125)
	await get_tree().create_timer(1.125).timeout
	get_tree().change_scene_to_packed(intro_scene)

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


func _on_load_game_button_down():
	$Click.play()


func _on_load_game_button_up():
	$Clouds.play_backwards("default")
	$Clouds.visible = true
	$CloudsWhoosch.play()
	MusicController._fade_to_volume(-80, 1.125)
	if Global.last_scene == "Tutorial":
		await get_tree().create_timer(1.125).timeout
		get_tree().change_scene_to_packed(tutorial_scene)
	elif Global.last_scene == "Map":
		await get_tree().create_timer(1.125).timeout
		get_tree().change_scene_to_packed(map_scene)
	elif Global.last_scene == "Laboratory":
		await get_tree().create_timer(1.125).timeout
		get_tree().change_scene_to_packed(laboratory_scene)
