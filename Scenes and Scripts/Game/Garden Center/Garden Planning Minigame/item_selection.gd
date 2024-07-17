extends Node

@onready var arrows = $Arrows
var current_item_selected: String = "PlantPot" # There is PlantPot, StonePlate, Flower, Bush
var allow_switch = true
var mouse_inside_pick_up_area = false
@onready var item_scn = preload("res://Scenes and Scripts/Game/Garden Center/Garden Planning Minigame/item.tscn")

var plantpot = preload("res://Assets/Art/Environment/Rooms/Garden Center/Minigames/GardenPlanning/plantpot/plantpot_icon2.png")
var plantpot_highlight = preload("res://Assets/Art/Environment/Rooms/Garden Center/Minigames/GardenPlanning/plantpot/plantpot_icon_selected.png")
var stoneplate = preload("res://Assets/Art/Environment/Rooms/Garden Center/Minigames/GardenPlanning/floorplate/floorplate_icon2.png")
var stoneplate_highlight = preload("res://Assets/Art/Environment/Rooms/Garden Center/Minigames/GardenPlanning/floorplate/floorplate_icon_selected.png")
var flower = preload("res://Assets/Art/Environment/Rooms/Garden Center/Minigames/GardenPlanning/flower/flower_icon2.png")
var flower_highlight = preload("res://Assets/Art/Environment/Rooms/Garden Center/Minigames/GardenPlanning/flower/flower_icon_selected.png")
var bush = preload("res://Assets/Art/Environment/Rooms/Garden Center/Minigames/GardenPlanning/bush/bush_icon2.png")
var bush_highlight = preload("res://Assets/Art/Environment/Rooms/Garden Center/Minigames/GardenPlanning/bush/bush_icon_selected.png")





signal current_item_state


func _process(delta):
	if current_item_selected == "StonePlate":
		$Arrows/ArrowLeft.hide()
	else:
		$Arrows/ArrowLeft.show()
	if current_item_selected == "Bush":
		$Arrows/ArrowRight.hide()
	else:
		$Arrows/ArrowRight.show()
	

func _input(event):
	var item_scn_local = item_scn.instantiate()
	if event.is_action_pressed("left_click") and mouse_inside_pick_up_area:
		add_child(item_scn_local)
		if current_item_selected == "PlantPot":
			GlobalGarden.plant_pots_placed += 1
		elif current_item_selected == "StonePlate":
			GlobalGarden.stone_plates_placed += 1
		elif current_item_selected == "Flower":
			GlobalGarden.flowers_placed += 1
		elif current_item_selected == "Bush":
			GlobalGarden.bushs_placed += 1
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
	elif current_item_selected == "Bush" and allow_switch:
		allow_switch = false
		$AnimationPlayer.play("bush_to_flower")
		current_item_selected = "Flower"
	


func _on_arrows_move_right():
	if current_item_selected == "StonePlate" and allow_switch:
		allow_switch = false
		$AnimationPlayer.play("stone_plate_to_plant_pot")
		current_item_selected = "PlantPot"
	elif current_item_selected == "PlantPot" and allow_switch:
		allow_switch = false
		$AnimationPlayer.play("plant_pot_to_flower")
		current_item_selected = "Flower"
	elif current_item_selected == "Flower" and allow_switch:
		allow_switch = false
		$AnimationPlayer.play("flower_to_bush")
		current_item_selected = "Bush"


func _on_animation_player_animation_finished(anim_name):
	allow_switch = true


func _on_pick_up_area_mouse_entered():
	mouse_inside_pick_up_area = true
	$Objects/PlantPot.texture = plantpot_highlight
	$Objects/StonePlate.texture = stoneplate_highlight
	$Objects/Flower.texture = flower_highlight
	$Objects/Bush.texture = bush_highlight
	_play_hover()
	
func _on_pick_up_area_mouse_exited():
	mouse_inside_pick_up_area = false
	$Objects/PlantPot.texture = plantpot
	$Objects/StonePlate.texture = stoneplate
	$Objects/Flower.texture = flower
	$Objects/Bush.texture = bush


func _on_finished_button_pressed():
	if GlobalGarden.stone_plates_placed == 3 and GlobalGarden.plant_pots_placed == 2 and GlobalGarden.bushs_placed == 5 and GlobalGarden.flowers_placed == 3 and GlobalGarden.current_stage == 1:
		var areas = get_children()
		for area in areas:
			if area.is_in_group("Items") and !area.get_name() == "Item":
				area.queue_free()
		GlobalGarden.current_stage += 1
		var monitorables = get_parent().get_child(2).get_children()
		for i in monitorables:
			i.monitorable = true
		GlobalGarden.plant_pots_placed = 0
		GlobalGarden.flowers_placed = 0
		GlobalGarden.bushs_placed = 0
		GlobalGarden.stone_plates_placed = 0
		GlobalGarden.stage2_correct_specs = 0
	
	if GlobalGarden.current_stage == 2 and GlobalGarden.stage2_correct_specs == 4 and GlobalGarden.plant_pots_placed >= 10:
		print("Leute ich brech zusammen, aber wenigstens funktioniert das system mittlerweile. Bevor ihr euch beschwert, ja dieser Print ist extra noch drinnen, damir ich weiß wo ich das Minispiel in Zukunft erweitern kann. Wenn du bis hierhin gelsen hast, herzlichen Glückwunsch, dein Schwanz ist klein.")

func _play_hover():
	if current_item_selected == "Flower" or current_item_selected == "Bush":
		$Hover.stream = load("res://Assets/Sound/SFX/Foley/Garden Center/Minigame 2/bush_hover.tres")
	elif current_item_selected == "PlantPot" or current_item_selected == "StonePlate":
		$Hover.stream = load("res://Assets/Sound/SFX/Foley/Garden Center/Minigame 2/pot_hover.tres")
	$Hover.play()
