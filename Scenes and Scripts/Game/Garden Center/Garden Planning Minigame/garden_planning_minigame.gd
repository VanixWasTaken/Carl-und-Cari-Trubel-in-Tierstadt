extends Node2D


func _process(delta):
	$Label.text = "so viele stone plates " + str(GlobalGarden.stone_plates_placed) + "     so viele plant pots " + str(GlobalGarden.plant_pots_placed)

func _on_texture_button_pressed():
	if GlobalGarden.stone_plates_placed == 3 and GlobalGarden.plant_pots_placed == 2:
		queue_free()
