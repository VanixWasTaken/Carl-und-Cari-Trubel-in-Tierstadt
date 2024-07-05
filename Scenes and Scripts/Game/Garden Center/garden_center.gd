extends Node3D

# Dialogs
@onready var dialog1 = preload("res://Scenes and Scripts/Dialog/Garden Dialog/garden_center_dialog_1.tscn")
@onready var dialog2 = preload("res://Scenes and Scripts/Dialog/Garden Dialog/garden_center_dialog_2.tscn")
@onready var dialog3 = preload("res://Scenes and Scripts/Dialog/Garden Dialog/garden_center_dialog_3.tscn")

var minigame_1 = preload("res://Scenes and Scripts/Game/Garden Center/CuttingTreeMinigame/cutting_tree_minigame.tscn")
var minigame_2 = preload("res://Scenes and Scripts/Game/Garden Center/PlantCaringMinigame/plant_caring.tscn")
var minigame_3_1 = preload("res://Scenes and Scripts/Game/Garden Center/Ground Select Minigame/ground_select_minigame.tscn")
var minigame_3_2 = preload("res://Scenes and Scripts/Game/Garden Center/Garden Planning Minigame/garden_planning_minigame.tscn")

var player


func _ready():
	MusicController._play_music("peace_and_tranquility", "garden_center", -15)
	Global.last_scene = "GardenCenter"
	player = get_tree().get_first_node_in_group("Player")
	if GlobalGarden.last_finished_minigame == "NONE":
		$CutsceneAnimation.play("camera_pan")
		Global.cutscene_playing = true
	if GlobalGarden.last_finished_minigame == "Minigame1":
		$Player.position = Vector3(16.85, 0.85, 0.65)
		add_child(dialog3.instantiate())
	#if GlobalGarden.finished_minigame_3_2:
		#$Player.position = Vector3(16.85, 0.85, 0.65)

	

func _process(_delta):
	if !Global.cutscene_playing:
		if $Player.position.x <= 19.5 and $Player.position.x >= -19.5:
			$Camera3D.position.x = $Player.position.x



func _on_cutscene_animation_animation_finished(camera_pan):
	Global.cutscene_playing = false
	$CutsceneAnimation/MouseBlock.queue_free()
	add_child(dialog1.instantiate())


func _on_dialog_area_body_entered(body):
	if !GlobalGarden.talked_to_guido1:
		add_child(dialog2.instantiate())
		GlobalGarden.talked_to_guido1 = true

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
	
