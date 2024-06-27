extends Node2D

@onready var after_lab_dialog = preload("res://Scenes and Scripts/Dialog/Map Dialoge/After Job Dialog/after_lab_dialog.tscn")
@onready var after_garden_dialog = preload("res://Scenes and Scripts/Dialog/Map Dialoge/After Job Dialog/after_garden_dialog.tscn")
@onready var main_story_dialog_1 = preload("res://Scenes and Scripts/Dialog/Map Dialoge/Bianca Dialog/bianca_dialog_1.tscn")
@onready var profile_help = preload("res://Scenes and Scripts/Menus/Map Menu/help_profiles.tscn")
var job_buildings
var player

func _ready():
	Global.last_scene = "Map"
	Global.menu_open = true
	Global.completed_jobs.append("Garden Center")
	Global.completed_jobs.append("Laboratory Building")
	Global.job_stars_dict[0] = 5
	Global.last_scene = "Laboratory"
	if Global.last_scene == "Laboratory":
		$Player.position = Vector2(776, 2256)
		var dialog_instance = after_lab_dialog.instantiate()
		get_tree().get_current_scene().add_child(dialog_instance)
		Global.inside_laboratory = false
	elif Global.last_scene == "GardenCenter":
		$Player.position = Vector2(4140, 1434)
		var dialog_instance = after_garden_dialog.instantiate()
		get_tree().get_current_scene().add_child(dialog_instance)

	job_buildings = get_tree().get_nodes_in_group("Buildings")
	for jobs in Global.completed_jobs:
		for buildings in job_buildings:
			var building_name = buildings.get_name()
			if building_name == jobs:
				buildings.can_enter = false

	if Global.completed_jobs.size() >= 1:
		$"HUD/Help Movement".queue_free()
		Global.menu_open = false
		$MapTest/Objects/Fireworks.show()
	
	if Global.completed_jobs.size() ==9:
		var dialog_instance = main_story_dialog_1.instantiate()
		get_tree().get_current_scene().add_child(dialog_instance)
	player = get_tree().get_first_node_in_group("Player")


	SaveSystem.save_game()




func _input(event):
	if event.is_action_pressed("escape"):
		if !Global.pause_opened:
			$"HUD/Pause Menu".visible = true
			Global.pause_opened = true
			Global.menu_open = true


func _on_texture_button_button_up():
	Global.menu_open = false
	if $"HUD/Help Movement".visible == true:
		$"HUD/Help Movement".queue_free()

func _paper_hover():
	var stream = AudioStreamRandomizer.new()
	stream.add_stream(0, load("res://Assets/Sound/SFX/UI/Specific/Map/sfx_hub_ui_paper_var1.mp3"))
	stream.add_stream(1, load("res://Assets/Sound/SFX/UI/Specific/Map/sfx_hub_ui_paper_var2.mp3"))
	stream.add_stream(2, load("res://Assets/Sound/SFX/UI/Specific/Map/sfx_hub_ui_paper_var3.mp3"))
	%Hover.stream = stream
	%Hover.play()

func explain_profiles():
	var profile_helper = profile_help.instantiate()
	$HUD.add_child(profile_helper)

func _on_clouds_animation_finished():
	$Clouds.visible = false

func _on_animation_player_animation_finished(anim_name):
	$CloudControl/AnimationPlayer4.play("new_animation")

func _on_animation_player_2_animation_finished(anim_name):
	$CloudControl/AnimationPlayer5.play("new_animation")

func _on_animation_player_3_animation_finished(anim_name):
	$CloudControl/AnimationPlayer6.play("new_animation")





func _on_market_place_animation_animation_finished(anim_name):
	if Global.exit_coordinates != null:
		player.global_position = Global.exit_coordinates
	var camera = get_tree().get_first_node_in_group("Camera")
	get_tree().get_first_node_in_group("Marker").remove_child(camera)
	player.add_child(camera)
	player.visible = true
	camera.position = Vector2(0,0)
	Global.cutscene_playing = false
