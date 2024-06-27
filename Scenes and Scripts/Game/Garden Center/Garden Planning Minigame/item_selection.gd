extends Node

@onready var arrows = $Arrows
var current_item_selected: String = "PlantPot" # There is PlantPot, StonePlate, Flower


func _on_arrows_move_left():
	if current_item_selected == "PlantPot":
		$AnimationPlayer.play("plant_pot_to_stone_plate")
		current_item_selected = "StonePlate"
	


func _on_arrows_move_right():
	if current_item_selected == "StonePlate":
		$AnimationPlayer.play("stone_plate_to_plant_pot")
		current_item_selected = "PlantPot"
	elif current_item_selected == "PlantPot":
		$AnimationPlayer.play("plant_pot_to_flower")
		current_item_selected = "Flower"
