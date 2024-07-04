extends Node2D

@onready var garden_scn = preload("res://Scenes and Scripts/Game/Garden Center/garden_center.tscn")
var dialog_introduction = preload("res://Scenes and Scripts/Dialog/Garden Dialog/Planning Minigame/garden_planning_minigame_dialog1.tscn")
var dialog2 = preload("res://Scenes and Scripts/Dialog/Garden Dialog/Planning Minigame/garden_planning_minigame_dialog2.tscn")
var dialog3 = preload("res://Scenes and Scripts/Dialog/Garden Dialog/Planning Minigame/garden_planning_minigame_dialog3.tscn")

var check = preload("res://Assets/Art/Environment/Rooms/Garden Center/Minigames/GardenPlanning/checkbox_checked.png")
var uncheck = preload("res://Assets/Art/Environment/Rooms/Garden Center/Minigames/GardenPlanning/checkbox_unchecked.png")

func _ready():
	$CanvasLayer/FadeAnimation.show()
	$CanvasLayer/AnimationPlayer.play("fade_in")
	add_child(dialog_introduction.instantiate())

func _process(delta):
	if GlobalGarden.current_stage == 2:
		$TaskBackground/Task1.hide()
		$TaskBackground/Task2.show()
	
	# First Stage checks
	if GlobalGarden.current_stage == 1:
		if GlobalGarden.stone_plates_placed == 3:
			$TaskBackground/Task1/MinorTask1.texture = check
		else:
			$TaskBackground/Task1/MinorTask1.texture = uncheck
		if GlobalGarden.plant_pots_placed == 2:
			$TaskBackground/Task1/MinorTask2.texture = check
		else:
			$TaskBackground/Task1/MinorTask2.texture = uncheck
		if GlobalGarden.bushs_placed == 5:
			$TaskBackground/Task1/MinorTask3.texture = check
		else:
			$TaskBackground/Task1/MinorTask3.texture = uncheck
		if GlobalGarden.flowers_placed == 3:
			$TaskBackground/Task1/MinorTask4.texture = check
		else:
			$TaskBackground/Task1/MinorTask4.texture = uncheck
	
	# Second Stage checks
	if GlobalGarden.current_stage == 2:
		if GlobalGarden.stage2_correct_specs == 4:
			$TaskBackground/Task2/MinorTask1.texture = check
		else:
			$TaskBackground/Task2/MinorTask1.texture = uncheck
		if GlobalGarden.plant_pots_placed >= 10:
			$TaskBackground/Task2/MinorTask2.texture = check
		else:
			$TaskBackground/Task2/MinorTask2.texture = uncheck
	
func _on_texture_button_pressed():
	if GlobalGarden.stone_plates_placed == 3 and GlobalGarden.plant_pots_placed == 2 and GlobalGarden.bushs_placed == 5 and GlobalGarden.flowers_placed == 3:
		add_child(dialog2.instantiate())
	if GlobalGarden.current_stage == 2 and GlobalGarden.stage2_correct_specs == 4 and GlobalGarden.plant_pots_placed >= 10:
		add_child(dialog3.instantiate())



func _on_animation_player_animation_finished(anim_name):
	if anim_name == "fade_out":
		get_tree().change_scene_to_packed(garden_scn)
