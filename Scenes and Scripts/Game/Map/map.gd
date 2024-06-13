extends Node2D

@onready var main_story_dialog_1 = preload("res://Scenes and Scripts/Dialog/Map Dialoge/Bianca Dialog/bianca_dialog_1.tscn")
@onready var laboratory_quiz = preload("res://Scenes and Scripts/Game/Quiz/Laboratory Quiz/quiz_laboratory.tscn")
var job_buildings


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.menu_open = true
	if Global.inside_laboratory == true:
		$"HUD/Help Movement".hide()
		$Player.position = Vector2(319, 313)
		add_child(laboratory_quiz.instantiate())
		Global.moving_allowed = false
		Global.inside_laboratory = false
		$HUD/HelpProfiles.show()
	
	job_buildings = get_tree().get_nodes_in_group("Buildings")
	for jobs in Global.completed_jobs:
		for buildings in job_buildings:
			var building_name = buildings.get_name()
			if building_name == jobs:
				buildings.can_enter = false
				
	if Global.completed_jobs.size() >= 1:
		$"HUD/Help Movement".queue_free()
		Global.menu_open = false
	
	if Global.completed_jobs.size() == 1:
		var dialog_instance = main_story_dialog_1.instantiate()
		get_tree().get_current_scene().add_child(dialog_instance)



func _on_texture_button_button_up():
	Global.menu_open = false
	if $"HUD/Help Movement".visible == true:
		$"HUD/Help Movement".queue_free()
	if $HUD/HelpProfiles.visible == true:
		$HUD/HelpProfiles.queue_free()

func _paper_hover():
	var stream = AudioStreamRandomizer.new()
	stream.add_stream(0, load("res://Assets/Sound/SFX/UI/Specific/Map/sfx_hub_ui_paper_var1.mp3"))
	stream.add_stream(1, load("res://Assets/Sound/SFX/UI/Specific/Map/sfx_hub_ui_paper_var2.mp3"))
	stream.add_stream(2, load("res://Assets/Sound/SFX/UI/Specific/Map/sfx_hub_ui_paper_var3.mp3"))
	%Hover.stream = stream
	%Hover.play()

func _on_clouds_animation_finished():
	$Clouds.visible = false

func _on_animation_player_animation_finished(anim_name):
	$CloudControl/AnimationPlayer4.play("new_animation")

func _on_animation_player_2_animation_finished(anim_name):
	$CloudControl/AnimationPlayer5.play("new_animation")

func _on_animation_player_3_animation_finished(anim_name):
	$CloudControl/AnimationPlayer6.play("new_animation")


func _on_npc_movement_animation_finished(anim_name):
	Global.dialog_playing = false
