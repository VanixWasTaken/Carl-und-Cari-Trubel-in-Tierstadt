extends Node2D


var dialog_introduction = preload("res://Scenes and Scripts/Dialog/Garden Dialog/Planning Minigame/garden_planning_minigame_dialog1.tscn")
var dialog2 = preload("res://Scenes and Scripts/Dialog/Garden Dialog/Planning Minigame/garden_planning_minigame_dialog2.tscn")

func _ready():
	add_child(dialog_introduction.instantiate())

func _process(delta):
	$Label.text = "so viele stone plates " + str(GlobalGarden.stone_plates_placed) + "     so viele plant pots " + str(GlobalGarden.plant_pots_placed) + "     so viele flowers " + str(GlobalGarden.flowers_placed) + "     so viele büsche " + str(GlobalGarden.bushs_placed)
	if GlobalGarden.current_stage == 2:
		$TaskBackground/Task1.hide()
		$TaskBackground/Task2.show()


func _on_texture_button_pressed():
	if GlobalGarden.stone_plates_placed == 3 and GlobalGarden.plant_pots_placed == 2 and GlobalGarden.bushs_placed == 5 and GlobalGarden.flowers_placed == 3:
		add_child(dialog2.instantiate())

