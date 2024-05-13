extends AnimatedSprite2D

var water_in_1 = false
var water_in_2 = false
var water_in_3 = false
var pulver_in_1 = false
var pulver_in_2 = false
var pulver_in_3 = false
var area_name
var played_1 = false
var played_2 = false
var played_3 = false
var new_water = false
var water_in_current = false
var needed_color = "Purple"
var return_laboratory = false
var red_powder_dialog = preload("res://Scenes and Scripts/Dialog/Laboratory Dialog/Powder Dialog/powder_dialog_2.tscn")
var yellow_powder_dialog = preload("res://Scenes and Scripts/Dialog/Laboratory Dialog/Powder Dialog/powder_dialog_3.tscn")
var end_powder_dialog = preload("res://Scenes and Scripts/Dialog/Laboratory Dialog/Powder Dialog/powder_dialog_4.tscn")
var not_enough_water_dialog = preload ("res://Scenes and Scripts/Dialog/Laboratory Dialog/Powder Dialog/powder_dialog_no_water.tscn")

func _on_area_2d_area_entered(area):
	var dialog_instance
	area_name = area.get_name()
	if area_name.contains("WaterCup"):
		water_in_current = true
		new_water = true
		area.get_parent().play("new_animation")
		%PouringWater.play()
		if water_in_1 == false && pulver_in_1 == false:
			$".".frame = 1
			water_in_1 = true

		elif water_in_2 == false && pulver_in_1 == true:
			$".".frame = 3
			water_in_2 = true

		elif water_in_3 == false && pulver_in_2 == true:
			$".".frame = 5
			water_in_3 = true

	if area_name.contains("PulverBowl"):
		area.get_parent().bowl_full = false
		if water_in_current:
			if area.get_parent().pulver_color != null && area.get_parent().pulver_color == needed_color && area.get_parent().enough == true:
				if water_in_1 == true && pulver_in_1 == false:
					$".".frame = 2
					pulver_in_1 = true
					remove_glass()
				elif water_in_2 == true && pulver_in_2 == false:
					$".".frame = 4
					pulver_in_2 = true
					remove_glass()
				elif water_in_3 == true && pulver_in_3 == false:
					$".".frame = 6
					pulver_in_3 = true
					remove_glass()
		else:
			dialog_instance = not_enough_water_dialog.instantiate()
			get_tree().get_current_scene().add_child(dialog_instance)
func remove_glass():
	var dialog_instance
	if pulver_in_1 && !played_1:
		$Area2D.position.y += 100000
		$Area2D2.monitoring = true
		needed_color = "Red"
		played_1 = true
		dialog_instance = red_powder_dialog.instantiate()
		get_tree().get_current_scene().add_child(dialog_instance)

	if pulver_in_2 && !played_2:
		$Area2D2.position.y += 10000
		$Area2D3.monitoring = true
		needed_color = "Yellow"
		played_2 = true
		dialog_instance = yellow_powder_dialog.instantiate()
		get_tree().get_current_scene().add_child(dialog_instance)


	if pulver_in_3:
		$Area2D2.position.y += 10000
		needed_color = "NULL"
		dialog_instance = end_powder_dialog.instantiate()
		get_tree().get_current_scene().add_child(dialog_instance)

func _on_area_2d_area_exited(area):
	var dialog_instance
	if area_name.contains("WaterCup"):
		area.get_parent().play("default")
	if area_name.contains("PulverBowl"):
		$"../PulverBowl"._reset_bowl()

