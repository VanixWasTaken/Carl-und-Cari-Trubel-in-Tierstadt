extends Sprite3D

const GARDEN_BONSAI = preload("res://Assets/Art/Environment/Rooms/Garden Center/garden_bonsai.png")
const GARDEN_BONSAI_HIGHLIGHTED = preload("res://Assets/Art/Environment/Rooms/Garden Center/garden_bonsai_highlighted.png")
var mouse_inside_bonsai_trees = false
@onready var cutting_tree_minigame_scn = preload("res://Scenes and Scripts/Game/Garden Center/CuttingTreeMinigame/cutting_tree_minigame.tscn")


@onready var bonsai_trees = $"."

func _input(event):
	if event.is_action_pressed("left_click") and mouse_inside_bonsai_trees:
		get_tree().change_scene_to_packed(cutting_tree_minigame_scn)
		


func _on_hitbox_mouse_entered():
	bonsai_trees.texture = GARDEN_BONSAI_HIGHLIGHTED
	mouse_inside_bonsai_trees = true
func _on_hitbox_mouse_exited():
	bonsai_trees.texture = GARDEN_BONSAI
	mouse_inside_bonsai_trees = false
