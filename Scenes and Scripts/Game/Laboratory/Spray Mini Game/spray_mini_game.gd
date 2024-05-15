extends Node2D

var spray_gun = preload("res://Assets/Art/Environment/Rooms/Laboratory/Minigames/Spray Mini Game/minigame3_gun.png")
var spray_gun_highlight = preload("res://Assets/Art/Environment/Rooms/Laboratory/Minigames/Spray Mini Game/minigame3_gun_highlight.png")
var bottle = preload("res://Assets/Art/Environment/Rooms/Laboratory/Minigames/Spray Mini Game/minigame3_bottle.png")
var bottle_highlight = preload("res://Assets/Art/Environment/Rooms/Laboratory/Minigames/Spray Mini Game/minigame3_bottle_highlight.png")
var mouse_inside = false
var dialog2 = preload("res://Scenes and Scripts/Dialog/Laboratory Dialog/Spray Mini Game Dialog/dialog_spray_mini_game2.tscn")

func _ready():
	add_child(dialog2.instantiate())


func _process(delta):
	if mouse_inside and Input.is_action_just_pressed("left_click"):
		$SpinMinigame.visible = true


func _on_area_2d_mouse_entered():
	$BottleAndGun/SprayGun.texture = spray_gun_highlight
	$BottleAndGun/Bottle.texture = bottle_highlight
	mouse_inside = true
func _on_area_2d_mouse_exited():
	$BottleAndGun/SprayGun.texture = spray_gun
	$BottleAndGun/Bottle.texture = bottle
	mouse_inside = false





func _on_button_button_down():
	Global.lab_cutscene_played = true
	Global.return_laboratory_1 = true
	Global.return_laboratory_2 = true
	Global.return_laboratory_3 = true
	get_tree().change_scene_to_file("res://Scenes and Scripts/Game/Laboratory/laboratory_3d.tscn")
