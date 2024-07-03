extends Node2D


var dialog_introduction = preload()

func _process(delta):
	$Label.text = "so viele stone plates " + str(GlobalGarden.stone_plates_placed) + "     so viele plant pots " + str(GlobalGarden.plant_pots_placed) + "     so viele flowers " + str(GlobalGarden.flowers_placed) + "     so viele büsche " + str(GlobalGarden.bushs_placed)

func _on_texture_button_pressed():
	if GlobalGarden.stone_plates_placed == 3 and GlobalGarden.plant_pots_placed == 2:
		queue_free()
