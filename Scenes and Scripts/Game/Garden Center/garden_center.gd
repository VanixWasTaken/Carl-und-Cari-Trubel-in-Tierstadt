extends Node3D

# Dialogs
@onready var dialog1 = preload("res://Scenes and Scripts/Dialog/Garden Dialog/garden_center_dialog_1.tscn")
@onready var dialog2 = preload("res://Scenes and Scripts/Dialog/Garden Dialog/garden_center_dialog_2.tscn")
@onready var dialog3 = preload("res://Scenes and Scripts/Dialog/Garden Dialog/garden_center_dialog_3.tscn")
@onready var dialog4 = preload("res://Scenes and Scripts/Dialog/Garden Dialog/garden_center_dialog_4.tscn")
@onready var dialog5 = preload("res://Scenes and Scripts/Dialog/Garden Dialog/garden_center_dialog_5.tscn")
@onready var dialog6 = preload("res://Scenes and Scripts/Dialog/Garden Dialog/garden_center_dialog_6.tscn")


var minigame_1 = preload("res://Scenes and Scripts/Game/Garden Center/CuttingTreeMinigame/cutting_tree_minigame.tscn")
var minigame_2 = preload("res://Scenes and Scripts/Game/Garden Center/PlantCaringMinigame/plant_caring.tscn")
var minigame_3_1 = preload("res://Scenes and Scripts/Game/Garden Center/Ground Select Minigame/ground_select_minigame.tscn")
var minigame_3_2 = preload("res://Scenes and Scripts/Game/Garden Center/Garden Planning Minigame/garden_planning_minigame.tscn")
var map_scene
var player


func _ready():
	MusicController._play_music("peace_and_tranquility", "garden_center", -15)
	Global.last_scene = "GardenCenter"
	player = get_tree().get_first_node_in_group("Player")
	if GlobalGarden.last_finished_minigame == "NONE":
		$Camera3D/AudioListener3D.make_current()
		$CutsceneAnimation.play("camera_pan")
		Global.cutscene_playing = true
		$Player.position = Vector3(-22.362, 0.85, -0.647)
	elif GlobalGarden.last_finished_minigame == "CuttingGame":
		Global.dialog_playing = false
		$Player.position = Vector3(16.85, 0.85, 0.65)
		$CutsceneAnimation.queue_free()
	elif GlobalGarden.last_finished_minigame == "CaringGame":
		$Player.position = Vector3(-3.992,0.85,-1.5)
		$CutsceneAnimation.queue_free()
	elif GlobalGarden.last_finished_minigame == "GroundGame":
		$Player.position = Vector3(-22.035,0.85,2.492)
		$CutsceneAnimation.queue_free()
	elif GlobalGarden.last_finished_minigame == "PlanningGame":
		$Player.position = Vector3(3.901, 0.85, 0.941)
		$CutsceneAnimation.queue_free()
	
	SaveSystem.save_game()

func _process(_delta):
	if !Global.cutscene_playing:
		if $Player.position.x <= 19.5 and $Player.position.x >= -19.5:
			$Camera3D.position.x = $Player.position.x



func _on_cutscene_animation_animation_finished(camera_pan):
	$Player/AudioListener3D.make_current()
	$Camera3D/AudioListener3D.queue_free()
	Global.cutscene_playing = false
	$CutsceneAnimation/MouseBlock.queue_free()
	add_child(dialog1.instantiate())


func _on_dialog_area_body_entered(body):
	if GlobalGarden.last_finished_minigame == "NONE" and !GlobalGarden.talked_to_guido2:
		add_child(dialog2.instantiate())
		GlobalGarden.talked_to_guido2 = true
	elif GlobalGarden.last_finished_minigame == "CuttingGame" and !GlobalGarden.talked_to_guido3:
		add_child(dialog3.instantiate())
		GlobalGarden.talked_to_guido3 = true
	elif GlobalGarden.last_finished_minigame == "CaringGame" and !GlobalGarden.talked_to_guido4:
		add_child(dialog4.instantiate())
		GlobalGarden.talked_to_guido4 = true
	elif GlobalGarden.last_finished_minigame == "GroundGame" and !GlobalGarden.talked_to_guido5:
		add_child(dialog5.instantiate())
		GlobalGarden.talked_to_guido5 = true
	elif GlobalGarden.last_finished_minigame == "PlanningGame" and !GlobalGarden.talked_to_guido6:
		add_child(dialog6.instantiate())
		GlobalGarden.talked_to_guido6 = true
		map_scene = load("res://Scenes and Scripts/Game/Map/map.tscn")

func change_scene():
	if GlobalGarden.last_finished_minigame == "NONE":
		get_tree().change_scene_to_packed(minigame_1)
	elif GlobalGarden.last_finished_minigame == "CuttingGame":
		get_tree().change_scene_to_packed(minigame_2)
	elif GlobalGarden.last_finished_minigame == "CaringGame":
		get_tree().change_scene_to_packed(minigame_3_1)
	elif GlobalGarden.last_finished_minigame == "GroundGame":
		get_tree().change_scene_to_packed(minigame_3_2)
	elif GlobalGarden.last_finished_minigame == "PlanningGame":
		get_tree().change_scene_to_packed(minigame_1)
	


func _on_exit_body_entered(body):
	if body.is_in_group("Player") && GlobalGarden.talked_to_guido6:
		get_tree().change_scene_to_packed(map_scene)
		Global.completed_jobs.append("Garden Center")
		Global.last_scene = "GardenCenter"


func _on_animated_sprite_3d_frame_changed():
	if $GardenCenterNPC/AnimatedSprite3D.frame == 2:
		$GardenCenterNPC/Swing.stream = load("res://Assets/Sound/SFX/Foley/Garden Center/Swing/swing_left.tres")
		$GardenCenterNPC/Swing.play()
	elif $GardenCenterNPC/AnimatedSprite3D.frame == 7:
		$GardenCenterNPC/Swing.stream = load("res://Assets/Sound/SFX/Foley/Garden Center/Swing/swing_right.tres")
		$GardenCenterNPC/Swing.play()
