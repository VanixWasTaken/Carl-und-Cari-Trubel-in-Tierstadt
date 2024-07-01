extends Node2D

var mouse_on = false
var follow_mouse = false
var mouse_position
var start_position
var should_spray = true
# Called when the node enters the scene tree for the first time.
func _ready():
	start_position = global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("left_click") && mouse_on:
		follow_mouse = true
	if follow_mouse:
		mouse_position = get_global_mouse_position()
		global_position = mouse_position
		Global.mouse_full = true
	if Input.is_action_just_released("left_click"):
		follow_mouse = false
		global_position = start_position
	if Global.dialog_playing:
		follow_mouse = false
		mouse_on = false
	if Input.is_action_just_pressed("right_click") && follow_mouse && should_spray:
		$AnimatedSprite2D.play("spraying")
		should_spray = false


func _on_mouse_area_mouse_entered():
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
