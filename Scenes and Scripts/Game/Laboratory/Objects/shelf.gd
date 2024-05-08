extends Sprite3D

var no_shader = preload("res://Assets/Art/Environment/Rooms/Laboratory/Objects/laboratory_shelf.png")
var outline_shader = preload("res://Assets/Art/Environment/Rooms/Laboratory/Objects/laboratory_shelf_highlight.png")




func _on_area_3d_mouse_entered():
	$".".texture = outline_shader

func _on_area_3d_mouse_exited():
	$".".texture = no_shader
