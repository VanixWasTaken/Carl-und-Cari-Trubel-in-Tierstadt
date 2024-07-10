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
var neighbor_item_right : String = "FILLER"
var neighbor_item_left : String = "FILLER"
var neighbor_item_up : String = "FILLER"
var neighbor_item_down : String = "FILLER"
var should_send_signal_stage2 = true




func _ready():
	var item_selection = get_parent()
	get_parent().current_item_state.connect(_on_item_selection_current_item_state)
	self.mouse_entered.connect(_on_mouse_entered)
	self.mouse_exited.connect(_on_mouse_exited)
	add_to_group("Items")

func _physics_process(delta):
	if !get_name() == "Item" and should_follow_mouse:
		position = get_global_mouse_position()
	find_closest_marker()
	check_neighbors()
	
	# Stage 2 checks
	if !should_send_signal_stage2 and local_current_item_selected == "StonePlate" and !neighbor_item_right == "Bush":
		GlobalGarden.stage2_correct_specs -= 1
		should_send_signal_stage2 = true
	elif !should_send_signal_stage2 and local_current_item_selected == "StonePlate" and !neighbor_item_left == "Bush":
		GlobalGarden.stage2_correct_specs -= 1
		should_send_signal_stage2 = true
	elif !should_send_signal_stage2 and local_current_item_selected == "StonePlate" and !neighbor_item_up == "Bush":
		GlobalGarden.stage2_correct_specs -= 1
		should_send_signal_stage2 = true
	elif !should_send_signal_stage2 and local_current_item_selected == "StonePlate" and !neighbor_item_down == "Bush":
		GlobalGarden.stage2_correct_specs -= 1
		should_send_signal_stage2 = true
	
	if should_send_signal_stage2 and local_current_item_selected == "StonePlate" and neighbor_item_down == "Bush":
		GlobalGarden.stage2_correct_specs += 1
		should_send_signal_stage2 = false
	elif should_send_signal_stage2 and local_current_item_selected == "StonePlate" and neighbor_item_up == "Bush":
		GlobalGarden.stage2_correct_specs += 1
		should_send_signal_stage2 = false
	elif should_send_signal_stage2 and local_current_item_selected == "StonePlate" and neighbor_item_left == "Bush":
		GlobalGarden.stage2_correct_specs += 1
		should_send_signal_stage2 = false
	elif should_send_signal_stage2 and local_current_item_selected == "StonePlate" and neighbor_item_right == "Bush":
		GlobalGarden.stage2_correct_specs += 1
		should_send_signal_stage2 = false
	



func _input(event):
	if event is InputEventMouseMotion and Input.is_action_pressed("left_click") and !get_name() == "Item":
			var velocity = event.get_velocity()
			if velocity > Vector2(100, 100) and !$Dragging.playing:
				if should_follow_mouse:
					play_dragging()
			elif velocity < Vector2(-100, -100) and !$Dragging.playing:
				if should_follow_mouse:
					play_dragging()
			elif velocity == Vector2(0, 0):
				$Dragging.stop()
	
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
		if should_follow_mouse == true:
			_play_setdown()
			$Dragging.stop()
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




func check_neighbors(): # Scans the neighbor grid fields around the items and stores a variable what item is where.
	var ray_right = $RayCastRight.get_collider()
	var ray_left = $RayCastLeft.get_collider()
	var ray_up = $RayCastUp.get_collider()
	var ray_down = $RayCastDown.get_collider()
	if !ray_right == null:
		var ray_child = ray_right.get_child(1)
		if str(ray_child.texture.get_path()) == "res://Assets/Art/Environment/Rooms/Garden Center/Minigames/GardenPlanning/plantpot/plantpot_icon2.png":
			neighbor_item_right = "PlantPot"
		elif str(ray_child.texture.get_path()) == "res://Assets/Art/Environment/Rooms/Garden Center/Minigames/GardenPlanning/floorplate/floorplate_icon2.png":
			neighbor_item_right = "StonePlate"
		elif str(ray_child.texture.get_path()) == "res://Assets/Art/Environment/Rooms/Garden Center/Minigames/GardenPlanning/flower/flower_icon2.png":
			neighbor_item_right = "Flower"
		elif str(ray_child.texture.get_path()) == "res://Assets/Art/Environment/Rooms/Garden Center/Minigames/GardenPlanning/bush/bush_icon2.png":
			neighbor_item_right = "Bush"

	if !$RayCastRight.is_colliding():
		neighbor_item_right = "FILLER"

	if !ray_left == null:
		var ray_child = ray_left.get_child(1)
		if str(ray_child.texture.get_path()) == "res://Assets/Art/Environment/Rooms/Garden Center/Minigames/GardenPlanning/plantpot/plantpot_icon2.png":
			neighbor_item_left = "PlantPot"
		elif str(ray_child.texture.get_path()) == "res://Assets/Art/Environment/Rooms/Garden Center/Minigames/GardenPlanning/floorplate/floorplate_icon2.png":
			neighbor_item_left = "StonePlate"
		elif str(ray_child.texture.get_path()) == "res://Assets/Art/Environment/Rooms/Garden Center/Minigames/GardenPlanning/flower/flower_icon2.png":
			neighbor_item_left = "Flower"
		elif str(ray_child.texture.get_path()) == "res://Assets/Art/Environment/Rooms/Garden Center/Minigames/GardenPlanning/bush/bush_icon2.png":
			neighbor_item_left = "Bush"
	if !$RayCastLeft.is_colliding():
		neighbor_item_left = "FILLER"

	if !ray_up == null:
		var ray_child = ray_up.get_child(1)
		if str(ray_child.texture.get_path()) == "res://Assets/Art/Environment/Rooms/Garden Center/Minigames/GardenPlanning/plantpot/plantpot_icon2.png":
			neighbor_item_up = "PlantPot"
		elif str(ray_child.texture.get_path()) == "res://Assets/Art/Environment/Rooms/Garden Center/Minigames/GardenPlanning/floorplate/floorplate_icon2.png":
			neighbor_item_up = "StonePlate"
		elif str(ray_child.texture.get_path()) == "res://Assets/Art/Environment/Rooms/Garden Center/Minigames/GardenPlanning/flower/flower_icon2.png":
			neighbor_item_up = "Flower"
		elif str(ray_child.texture.get_path()) == "res://Assets/Art/Environment/Rooms/Garden Center/Minigames/GardenPlanning/bush/bush_icon2.png":
			neighbor_item_up = "Bush"
	if !$RayCastUp.is_colliding():
		neighbor_item_up = "FILLER"
	
	if !ray_down == null:
		var ray_child = ray_down.get_child(1)
		if str(ray_child.texture.get_path()) == "res://Assets/Art/Environment/Rooms/Garden Center/Minigames/GardenPlanning/plantpot/plantpot_icon2.png":
			neighbor_item_down = "PlantPot"
		elif str(ray_child.texture.get_path()) == "res://Assets/Art/Environment/Rooms/Garden Center/Minigames/GardenPlanning/floorplate/floorplate_icon2.png":
			neighbor_item_down = "StonePlate"
		elif str(ray_child.texture.get_path()) == "res://Assets/Art/Environment/Rooms/Garden Center/Minigames/GardenPlanning/flower/flower_icon2.png":
			neighbor_item_down = "Flower"
		elif str(ray_child.texture.get_path()) == "res://Assets/Art/Environment/Rooms/Garden Center/Minigames/GardenPlanning/bush/bush_icon2.png":
			neighbor_item_down = "Bush"
	if !$RayCastDown.is_colliding():
		neighbor_item_down = "FILLER"






func _on_area_entered(area):
	is_on_grid = true
func _on_area_exited(area):
	is_on_grid = false


func _on_mouse_entered():
	local_mouse_inside_pick_up = true
func _on_mouse_exited():
	local_mouse_inside_pick_up = false

func _play_setdown():
	var play_once = 1
	if play_once == 1:
		if local_current_item_selected == "Bush" or local_current_item_selected == "Flower":
			$Setdown.stream = load("res://Assets/Sound/SFX/Foley/Garden Center/Minigame 2/bush_setdown.tres")
		elif local_current_item_selected == "StonePlate" or local_current_item_selected == "PlantPot":
			$Setdown.stream = load("res://Assets/Sound/SFX/Foley/Garden Center/Minigame 2/pot_setdown.tres")
		$Setdown.play()
		play_once += 1

func play_dragging():
	if local_current_item_selected == "Bush" or local_current_item_selected == "Flower":
			$Dragging.stream = load("res://Assets/Sound/SFX/Foley/Garden Center/Minigame 2/bush_drag.tres")
	elif local_current_item_selected == "StonePlate" or local_current_item_selected == "PlantPot":
			$Dragging.stream = load("res://Assets/Sound/SFX/Foley/Garden Center/Minigame 2/pot_drag.tres")
	$Dragging.play()
