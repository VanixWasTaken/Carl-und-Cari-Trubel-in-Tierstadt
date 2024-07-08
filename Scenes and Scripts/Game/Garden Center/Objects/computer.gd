extends Sprite3D

const GARDEN_COMPUTER = preload("res://Assets/Art/Environment/Rooms/Garden Center/Objects/garden_desktop_desk.png")
const GARDEN_COMPUTER_HIGHLIGHTED = preload("res://Assets/Art/Environment/Rooms/Garden Center/Objects/garden_desktop_desk_highlights.png")
var mouse_inside_computer = false
var player_in_reach = false
var should_enter_computer = false


func _input(event):
	if event.is_action_pressed("left_click") and mouse_inside_computer && !Global.dialog_playing:
		should_enter_computer = true
	elif event.is_action_pressed("left_click") and !mouse_inside_computer:
		should_enter_computer = false

func _process(delta):
	if should_enter_computer and player_in_reach and GlobalGarden.last_finished_minigame == "GroundGame" && GlobalGarden.talked_to_guido5:
		get_tree().get_first_node_in_group("Animator").play("fade_out")

func _on_hitbox_mouse_entered():
	if GlobalGarden.last_finished_minigame == "GroundGame" && GlobalGarden.talked_to_guido5:
		texture = GARDEN_COMPUTER_HIGHLIGHTED
		mouse_inside_computer = true
func _on_hitbox_mouse_exited():
	if GlobalGarden.last_finished_minigame == "GroundGame":
		texture = GARDEN_COMPUTER
		mouse_inside_computer = false


func _on_player_detection_body_entered(body):
	player_in_reach = true
func _on_player_detection_body_exited(body):
	player_in_reach = false
