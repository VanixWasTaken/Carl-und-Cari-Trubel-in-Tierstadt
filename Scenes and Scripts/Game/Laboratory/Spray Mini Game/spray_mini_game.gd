extends Node2D

var spray_gun = preload("res://Assets/Art/Environment/Rooms/Laboratory/Minigames/Spray Mini Game/minigame3_gun.png")
var spray_gun_highlight = preload("res://Assets/Art/Environment/Rooms/Laboratory/Minigames/Spray Mini Game/minigame3_gun_highlighted.png")
var bottle = preload("res://Assets/Art/Environment/Rooms/Laboratory/Minigames/Spray Mini Game/minigame3_bottle.png")
var bottle_highlight = preload("res://Assets/Art/Environment/Rooms/Laboratory/Minigames/Spray Mini Game/minigame3_bottle_highlighted.png")
var mouse_inside = false
var dialog2 = preload("res://Scenes and Scripts/Dialog/Laboratory Dialog/Spray Mini Game Dialog/dialog_spray_mini_game2.tscn")
var dialog4 = preload("res://Scenes and Scripts/Dialog/Laboratory Dialog/Spray Mini Game Dialog/dialog_spray_mini_game4.tscn")
@onready var gun_in_hand = $GunInHand
@onready var progress_bar = $ProgressBar
var next_scene

func _ready():
	add_child(dialog2.instantiate())
	$CanvasLayer/FadeAnimation.show()
	$CanvasLayer/AnimationPlayer.play("fade_in")
	await get_tree().create_timer(1).timeout
	load("res://Scenes and Scripts/Game/Laboratory/laboratory_3d.tscn")


func _process(delta):
	if mouse_inside and Input.is_action_just_pressed("left_click"):
		$PickUp.play()
		$SpinMinigame.visible = true
	var children = get_children()
	for child in children:
		if child.name == "DialogSprayMiniGame4":
			var babies = child.get_children()
			for baby in babies:
				if baby.name == "DialogBox":
					baby.gun_gets_visible.connect(gun_gets_visible)
					progress_bar.visible = true


func _on_area_2d_mouse_entered():
	if !$SpinMinigame.visible:
		$BottleAndGun/SprayGun.texture = spray_gun_highlight
		$BottleAndGun/Bottle.texture = bottle_highlight
		mouse_inside = true
		$Hover.play()
func _on_area_2d_mouse_exited():
	$BottleAndGun/SprayGun.texture = spray_gun
	$BottleAndGun/Bottle.texture = bottle
	mouse_inside = false









func _on_swipe_area_start_dialog_4():
	add_child(dialog4.instantiate())
	gun_in_hand.visible = false
	

func gun_gets_visible():
	gun_in_hand.visible = true


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "fade_out":
		get_tree().change_scene_to_packed(next_scene)
