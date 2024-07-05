extends Node2D

var garden_scene 
var dialog_1 = preload("res://Scenes and Scripts/Dialog/Garden Dialog/Minigame 3_1/garden_minigame_3_1_dialog_1.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$CanvasLayer/FadeAnimation.show()
	$CanvasLayer/AnimationPlayer.play("fade_in")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "fade_out":
		GlobalGarden.last_finished_minigame = "GroundGame"
		get_tree().change_scene_to_packed(garden_scene)
	elif anim_name == "fade_in":
		garden_scene = load("res://Scenes and Scripts/Game/Garden Center/garden_center.tscn")
		var next_dialog = dialog_1.instantiate()
		get_tree().get_current_scene().add_child(next_dialog)
