extends Area2D


@onready var flower_sprite = preload("res://Assets/Art/Environment/Rooms/Garden Center/Minigames/GardenPlanning/flower/flower_icon2.png")
@onready var plant_pot_sprite = preload("res://Assets/Art/Environment/Rooms/Garden Center/Minigames/GardenPlanning/plantpot/plantpot_icon2.png")
@onready var stone_plate_sprite = preload("res://Assets/Art/Environment/Rooms/Garden Center/Minigames/GardenPlanning/floorplate/floorplate_icon2.png")

var is_on_grid = false

func _ready():
	var item_selection = get_parent()
	get_parent().current_item_state.connect(_on_item_selection_current_item_state)

func _process(delta):
	if !get_name() == "Item":
		position = get_global_mouse_position()
	

func _input(event):
	if event.is_action_released("left_click") and !$".".get_name() == "Item" and !is_on_grid:
		queue_free()

func _on_item_selection_current_item_state(current_item_selected):
	if current_item_selected == "PlantPot":
		$Sprite2D.texture = plant_pot_sprite
	elif current_item_selected == "Flower":
		$Sprite2D.texture = flower_sprite
	elif current_item_selected == "StonePlate":
		$Sprite2D.texture = stone_plate_sprite


func _on_area_entered(area):
	is_on_grid = true
func _on_area_exited(area):
	is_on_grid = false
