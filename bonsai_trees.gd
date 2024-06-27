extends Sprite3D

const GARDEN_BONSAI = preload("res://Assets/Art/Environment/Rooms/Garden Center/garden_bonsai.png")
const GARDEN_BONSAI_HIGHLIGHTED = preload("res://Assets/Art/Environment/Rooms/Garden Center/garden_bonsai_highlighted.png")

@onready var bonsai_trees = $"."


func _on_mouse_detection_mouse_entered():
	bonsai_trees.texture = GARDEN_BONSAI_HIGHLIGHTED
	print("lakshdlakd")
func _on_mouse_detection_mouse_exited():
	bonsai_trees.texture = GARDEN_BONSAI
