extends Node2D

@onready var tree_1 = $Tree1
@onready var tree_2 = $Tree2


func _process(delta):
	$CanvasLayer/Label.text = "Tree 1 Cuts: " + str(tree_1.cuts_done) + "
	Tree 2 Cuts:" + str(tree_2.cuts_done)


func _on_tree_1_move_camera():
	$Camera2D/AnimationPlayer.play("camera_movement1")
	

func _on_tree_2_move_camera():
	$Camera2D/AnimationPlayer.play("camera_movement2")
