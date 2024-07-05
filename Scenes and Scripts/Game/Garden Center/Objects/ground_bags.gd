extends Sprite3D

@onready var bags_highlighted = preload("res://Assets/Art/Environment/Rooms/Garden Center/Objects/garden_sacks.png")
@onready var bags = preload("res://Assets/Art/Environment/Rooms/Garden Center/Objects/garden_sacks_selected.png")

var mouse_inside_bags = false
var player_in_reach = false
var should_enter_bags = false

func _input(event):
	if event.is_action_pressed("left_click") and mouse_inside_bags:
		should_enter_bags = true
	elif event.is_action_pressed("left_click") and !mouse_inside_bags:
		should_enter_bags = false


func _process(delta):
	if should_enter_bags and player_in_reach and GlobalGarden.last_finished_minigame == "CaringGame" && GlobalGarden.talked_to_guido4:
		get_tree().get_first_node_in_group("Animator").play("fade_out")


func _on_hitbox_mouse_entered():
	if GlobalGarden.last_finished_minigame == "CaringGame":
		texture = bags_highlighted
		mouse_inside_bags = true
func _on_hitbox_mouse_exited():
	if GlobalGarden.last_finished_minigame == "CaringGame":
		texture = bags
		mouse_inside_bags = false


func _on_player_detection_body_entered(body):
	player_in_reach = true
func _on_player_detection_body_exited(body):
	player_in_reach = false
