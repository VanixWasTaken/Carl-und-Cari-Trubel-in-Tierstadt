extends Node2D

var tree_1
var tree_2 
var dialog1 = preload("res://Scenes and Scripts/Dialog/Garden Dialog/Minigame 1/minigame1_dialog1.tscn")
var dialog3 = preload("res://Scenes and Scripts/Dialog/Garden Dialog/Minigame 1/minigame1_dialog2.tscn")
var dialog2 = preload("res://Scenes and Scripts/Dialog/Garden Dialog/Minigame 1/minigame1_dialog3.tscn")
var dialog4 = preload("res://Scenes and Scripts/Dialog/Garden Dialog/Minigame 1/minigame1_dialog4.tscn")
	
var garden_scene

@onready var scissor_uncut = preload("res://Assets/Art/Environment/Rooms/Garden Center/Minigames/CuttingTreeMinigame/scissors1.png")
@onready var scissor_cut = preload("res://Assets/Art/Environment/Rooms/Garden Center/Minigames/CuttingTreeMinigame/scissors2.png")

func _ready():
	$CanvasLayer/FadeAnimation.show()
	$CanvasLayer/AnimationPlayer.play("fade_in")
	add_child(dialog1.instantiate())
	tree_2 = $Tree2
	tree_1 = $Tree1

func _process(delta):
	if $Tree3.cuts_done == 8:
		$Tree3.cuts_done += 1


func _on_tree_1_move_camera():
	$Camera2D/AnimationPlayer.play("camera_movement1")
	var next_dialog = dialog2.instantiate()
	add_child(next_dialog)
	$CuttingTreeMinigameScissor.texture = scissor_uncut

func _on_tree_2_move_camera():
	$Camera2D/AnimationPlayer.play("camera_movement2")
	var next_dialog = dialog3.instantiate()
	add_child(next_dialog)
	$CuttingTreeMinigameScissor.texture = scissor_uncut



func _on_animation_player_animation_finished(anim_name):
	if anim_name == "fade_out":
		GlobalGarden.last_finished_minigame = "CuttingGame"
		get_tree().change_scene_to_packed(garden_scene)
	
	elif anim_name == "fade_in":
		garden_scene = load("res://Scenes and Scripts/Game/Garden Center/garden_center.tscn")

func fade_out():
	$CanvasLayer/AnimationPlayer.play("fade_out")

func _on_tree_3_move_camera():
	var next_dialog = dialog4.instantiate()
	add_child(next_dialog)
