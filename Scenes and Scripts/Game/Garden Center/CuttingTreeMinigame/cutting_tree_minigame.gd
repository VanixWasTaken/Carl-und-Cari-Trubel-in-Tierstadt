extends Node2D

@onready var tree_1 = $Tree1
@onready var tree_2 = $Tree2
@onready var dialog1 = preload("res://Scenes and Scripts/Dialog/Garden Dialog/Minigame 1/minigame1_dialog1.tscn")
@onready var garden_scn = preload("res://Scenes and Scripts/Game/Garden Center/garden_center.tscn")

func _ready():
	$CanvasLayer/FadeAnimation.show()
	$CanvasLayer/AnimationPlayer.play("fade_in")
	add_child(dialog1.instantiate())

func _process(delta):
	if $Tree3.cuts_done == 8:
		await get_tree().create_timer(1).timeout
		$CanvasLayer/AnimationPlayer.play("fade_out")
		$Tree3.cuts_done += 1


func _on_tree_1_move_camera():
	$Camera2D/AnimationPlayer.play("camera_movement1")
	

func _on_tree_2_move_camera():
	$Camera2D/AnimationPlayer.play("camera_movement2")





func _on_animation_player_animation_finished(anim_name):
	if anim_name == "fade_out":
		get_tree().change_scene_to_packed(garden_scn)
