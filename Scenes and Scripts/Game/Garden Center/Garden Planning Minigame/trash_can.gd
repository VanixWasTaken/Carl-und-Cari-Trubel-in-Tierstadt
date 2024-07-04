extends Sprite2D

@onready var trashcan_closed = preload("res://Assets/Art/Environment/Rooms/Garden Center/Minigames/GardenPlanning/trashcan_closed.png")
@onready var trashcan_open = preload("res://Assets/Art/Environment/Rooms/Garden Center/Minigames/GardenPlanning/trashcan_open.png")

func _on_area_2d_area_entered(area):
	self.texture = trashcan_open


func _on_area_2d_area_exited(area):
	self.texture = trashcan_closed
