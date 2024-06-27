extends Sprite3D

const GARDEN_BONSAI = preload("res://Assets/Art/Environment/Rooms/Garden Center/garden_bonsai.png")
const GARDEN_BONSAI_HIGHLIGHTED = preload("res://Assets/Art/Environment/Rooms/Garden Center/garden_bonsai_highlighted.png")

@onready var bonsai_trees = $"."



func _on_hitbox_mouse_entered():
	bonsai_trees.texture = GARDEN_BONSAI_HIGHLIGHTED
func _on_hitbox_mouse_exited():
	bonsai_trees.texture = GARDEN_BONSAI
