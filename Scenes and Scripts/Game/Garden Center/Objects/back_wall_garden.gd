extends Sprite3D

@onready var garden_highlighted = preload("res://Assets/Art/Environment/Rooms/Garden Center/Objects/garden_wall_back_room_highlighted.png")
@onready var garden = preload("res://Assets/Art/Environment/Rooms/Garden Center/Objects/garden_wall_back_room.png")

var mouse_inside_garden = false
var player_in_reach = false
var should_enter_garden = false

func _input(event):
	if event.is_action_pressed("left_click") and mouse_inside_garden && !Global.dialog_playing:
		should_enter_garden = true
	elif event.is_action_pressed("left_click") and !mouse_inside_garden:
		should_enter_garden = false


func _process(delta):
	if should_enter_garden and player_in_reach and GlobalGarden.last_finished_minigame == "CuttingGame" && GlobalGarden.talked_to_guido3:
		get_tree().get_first_node_in_group("Animator").play("fade_out")


func _on_hitbox_mouse_entered():
	if GlobalGarden.last_finished_minigame == "CuttingGame" && GlobalGarden.talked_to_guido3:
		self.texture = garden_highlighted
		mouse_inside_garden = true
func _on_hitbox_mouse_exited():
	if GlobalGarden.last_finished_minigame == "CuttingGame":
		self.texture = garden
		mouse_inside_garden = false


func _on_player_detection_body_entered(body):
	player_in_reach = true
func _on_player_detection_body_exited(body):
	player_in_reach = false
