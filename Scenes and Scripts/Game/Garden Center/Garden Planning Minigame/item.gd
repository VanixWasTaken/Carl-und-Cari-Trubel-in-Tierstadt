extends Area2D


@onready var flower_sprite = preload("res://Assets/Art/Environment/Rooms/Garden Center/Minigames/GardenPlanning/flower/flower_icon2.png")
@onready var plant_pot_sprite = preload("res://Assets/Art/Environment/Rooms/Garden Center/Minigames/GardenPlanning/plantpot/plantpot_icon2.png")
@onready var stone_plate_sprite = preload("res://Assets/Art/Environment/Rooms/Garden Center/Minigames/GardenPlanning/floorplate/floorplate_icon2.png")
@onready var bush_sprite = preload("res://Assets/Art/Environment/Rooms/Garden Center/Minigames/GardenPlanning/bush/bush_icon2.png")


var is_on_grid = false
var should_follow_mouse = true
var script_nearest_marker 
var should_change_item_icon = true
var should_change_current_item = true
var local_mouse_inside_pick_up = false 
var local_current_item_selected : String = "FILLER"


func _ready():
	var item_selection = get_parent()
	get_parent().current_item_state.connect(_on_item_selection_current_item_state)
	self.mouse_entered.connect(_on_mouse_entered)
	self.mouse_exited.connect(_on_mouse_exited)

func _process(delta):
	if !get_name() == "Item" and should_follow_mouse:
		position = get_global_mouse_position()
	find_closest_marker()



func _input(event):
	if event.is_action_released("left_click") and !$".".get_name() == "Item" and !is_on_grid:
		$".".queue_free()
		if local_current_item_selected == "PlantPot":
			GlobalGarden.plant_pots_placed -= 1
		elif local_current_item_selected == "StonePlate":
			GlobalGarden.stone_plates_placed -= 1
		elif local_current_item_selected == "Flower":
			GlobalGarden.flowers_placed -= 1
		elif local_current_item_selected == "Bush":
			GlobalGarden.bushs_placed -= 1
	elif event.is_action_released("left_click") and is_on_grid:
		should_follow_mouse = false
		global_position = script_nearest_marker.global_position
		script_nearest_marker.get_parent().monitorable = false
		should_change_item_icon = false
	elif event.is_action_pressed("left_click") and local_mouse_inside_pick_up:
		should_follow_mouse = true
		script_nearest_marker.get_parent().monitorable = true



func _on_item_selection_current_item_state(current_item_selected):
	if should_change_current_item:
		if current_item_selected == "PlantPot" and should_change_item_icon:
			$Sprite2D.texture = plant_pot_sprite
		elif current_item_selected == "Flower" and should_change_item_icon:
			$Sprite2D.texture = flower_sprite
		elif current_item_selected == "StonePlate" and should_change_item_icon:
			$Sprite2D.texture = stone_plate_sprite
		elif current_item_selected == "Bush" and should_change_item_icon:
			$Sprite2D.texture = bush_sprite
		local_current_item_selected = current_item_selected
		should_change_current_item = false

func find_closest_marker():
	var grid_markers : Array = get_tree().get_nodes_in_group("GridMarkers")
	var nearest_marker = grid_markers[0]
	for i in grid_markers:
		if i.global_position.distance_to(global_position) < nearest_marker.global_position.distance_to(global_position):
			nearest_marker = i
	script_nearest_marker = nearest_marker



func _on_area_entered(area):
	is_on_grid = true
func _on_area_exited(area):
	is_on_grid = false


func _on_mouse_entered():
	local_mouse_inside_pick_up = true
func _on_mouse_exited():
	local_mouse_inside_pick_up = false
