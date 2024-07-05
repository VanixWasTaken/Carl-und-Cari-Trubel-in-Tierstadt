extends Node2D

var mouse_on = false
var follow_mouse = false
var mouse_position
var start_position
var should_spray = true
var already_picked_up_once = false
var explanation_dialog = preload("res://Scenes and Scripts/Dialog/Garden Dialog/Minigame 2/garden_minigame_2_spray_explanation.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	start_position = global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("left_click") && mouse_on && get_tree().get_current_scene().hands_full == false:
		if !already_picked_up_once:
			var new_dialog = explanation_dialog.instantiate()
			get_tree().get_current_scene().add_child(new_dialog)
			already_picked_up_once = true
		elif already_picked_up_once:
			follow_mouse = true
	if follow_mouse:
		get_tree().get_current_scene().hands_full = true
		mouse_position = get_global_mouse_position()
		global_position = mouse_position
		Global.mouse_full = true
		z_index = 99
	if Input.is_action_just_released("left_click"):
		get_tree().get_current_scene().hands_full = false
		follow_mouse = false
		z_index = 0
		global_position = start_position
	if Global.dialog_playing:
		follow_mouse = false
		mouse_on = false
	if Input.is_action_just_pressed("right_click") && follow_mouse && should_spray:
		$Spraying.play()
		$AnimatedSprite2D.play("spraying")
		should_spray = false


func _on_mouse_area_mouse_entered():
	if get_tree().get_current_scene().hands_full == false:
		mouse_on = true
		$AnimatedSprite2D.frame = 1


func _on_mouse_area_mouse_exited():
	mouse_on = false
	$AnimatedSprite2D.frame = 0


func _on_water_area_area_entered(area):
	var area_name = area.get_name()


func _on_water_area_area_exited(area):
	var area_name = area.get_name()
	if area_name == "WateringArea":
		$AnimatedSprite2D.play("standing")
		$AnimatedSprite2D.frame = 0
		$AnimatedSprite2D.stop()


func _on_animated_sprite_2d_animation_finished():
	$AnimatedSprite2D.play("standing")
	$AnimatedSprite2D.stop()
	should_spray = true
