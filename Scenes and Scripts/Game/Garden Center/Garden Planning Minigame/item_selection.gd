extends Node

@onready var arrows = $Arrows



func _on_arrows_move_left():
	if arrows.item_dict == "PlantPot":
		$AnimationPlayer.play("pick_stone")

func _on_arrows_move_right():
	pass # Replace with function body.
