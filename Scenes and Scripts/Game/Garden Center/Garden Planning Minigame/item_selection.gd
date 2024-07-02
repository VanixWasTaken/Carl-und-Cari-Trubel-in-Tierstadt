extends Node

@onready var arrows = $Arrows
var current_item_selected: String = "PlantPot" # There is PlantPot, StonePlate, Flower
var allow_switch = true
var mouse_inside_pick_up_area = false
@onready var item_scn = preload("res://Scenes and Scripts/Game/Garden Center/Garden Planning Minigame/item.tscn")

signal current_item_state


func _process(delta):
	if current_item_selected == "StonePlate":
		$Arrows/ArrowLeft.hide()
	else:
		$Arrows/ArrowLeft.show()
	if current_item_selected == "Flower":
		$Arrows/ArrowRight.hide()
	else:
		$Arrows/ArrowRight.show()


func _input(event):
	var item_scn_local = item_scn.instantiate()
	if event.is_action_pressed("left_click") and mouse_inside_pick_up_area:
		add_child(item_scn_local)
		current_item_state.emit(current_item_selected)



func _on_arrows_move_left():
	if current_item_selected == "PlantPot" and allow_switch:
		allow_switch = false
		$AnimationPlayer.play("plant_pot_to_stone_plate")
		current_item_selected = "StonePlate"
	elif current_item_selected == "Flower" and allow_switch:
		allow_switch = false
		$AnimationPlayer.play("flower_to_plant_pot")
		current_item_selected = "PlantPot"
	


func _on_arrows_move_right():
	if current_item_selected == "StonePlate" and allow_switch:
		allow_switch = false
		$AnimationPlayer.play("stone_plate_to_plant_pot")
		current_item_selected = "PlantPot"
	elif current_item_selected == "PlantPot" and allow_switch:
		allow_switch = false
		$AnimationPlayer.play("plant_pot_to_flower")
		current_item_selected = "Flower"


func _on_animation_player_animation_finished(anim_name):
	allow_switch = true


func _on_pick_up_area_mouse_entered():
	mouse_inside_pick_up_area = true
func _on_pick_up_area_mouse_exited():
	mouse_inside_pick_up_area = false
