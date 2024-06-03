extends Area2D

var start_position
var mouse_on = false
var mouse_position
var follow_mouse = false
var powder_drag
var glass_position
@export var color: String
@export var minimum_weight: float
@export var maximum_weight: float
# Called when the node enters the scene tree for the first time.
func _ready():
	powder_drag = $"../Dragging"
	start_position = global_position
	glass_position = get_children()[1].position


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
		if follow_mouse:
			$Interact.play()
	if Global.dialog_playing:
		follow_mouse = false
		mouse_on = false


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
		if velocity > Vector2(100, 100) and !powder_drag.playing and follow_mouse:
			powder_drag.play()
		elif velocity < Vector2(-100, -100) and !powder_drag.playing and follow_mouse:
			powder_drag.play()
