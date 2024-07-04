extends Sprite3D

const GARDEN_BONSAI = preload("res://Assets/Art/Environment/Rooms/Garden Center/garden_bonsai.png")
const GARDEN_BONSAI_HIGHLIGHTED = preload("res://Assets/Art/Environment/Rooms/Garden Center/garden_bonsai_highlighted.png")
var mouse_inside_bonsai_trees = false
var player_in_reach = false
var should_enter_bonsai = false

@onready var bonsai_trees = $"."

func _input(event):
	if event.is_action_pressed("left_click") and mouse_inside_bonsai_trees:
		should_enter_bonsai = true
	elif event.is_action_pressed("left_click") and !mouse_inside_bonsai_trees:
		should_enter_bonsai = false

func _process(delta):
	if should_enter_bonsai and player_in_reach and GlobalGarden.should_enter_minigame1:
		get_tree().get_first_node_in_group("Animator").play("fade_out")

func _on_hitbox_mouse_entered():
	if GlobalGarden.last_finished_minigame == "NONE":
		bonsai_trees.texture = GARDEN_BONSAI_HIGHLIGHTED
		mouse_inside_bonsai_trees = true
func _on_hitbox_mouse_exited():
	if GlobalGarden.last_finished_minigame == "NONE":
		bonsai_trees.texture = GARDEN_BONSAI
		mouse_inside_bonsai_trees = false


func _on_player_detection_body_entered(body):
	player_in_reach = true
func _on_player_detection_body_exited(body):
	player_in_reach = false
