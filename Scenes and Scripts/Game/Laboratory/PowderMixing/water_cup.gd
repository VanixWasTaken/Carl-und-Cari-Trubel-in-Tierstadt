extends Area2D

var start_position
var mouse_on = false
var mouse_position
var follow_mouse = false
var got_position = false
var water_sprite
var water_slosh


# Called when the node enters the scene tree for the first time.
func _ready():
	start_position = position
	water_sprite = $WaterCup
	water_slosh = $WaterCup/Sloshing
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("left_click") && mouse_on:
		follow_mouse = true
	if follow_mouse:
		mouse_position = get_global_mouse_position()
		global_position = mouse_position
		Global.mouse_full = true
	if Input.is_action_just_released("left_click"):
		if follow_mouse:
			follow_mouse = false
			global_position = start_position
			water_sprite.get_children()[0].play()
			%PouringWater.stop()

func _on_mouse_entered():
	if Global.mouse_full == false:
		$"../Hover".play()
		mouse_on = true


func _on_mouse_exited():
	mouse_on = false
	Global.mouse_full = false


func _input(event):
	if event is InputEventMouseMotion:
		var velocity = event.get_velocity()
		if velocity > Vector2(100, 100) and !water_slosh.playing and follow_mouse:
			water_slosh.play()
