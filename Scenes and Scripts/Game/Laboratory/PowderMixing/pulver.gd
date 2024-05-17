extends Area2D

var start_position
var mouse_on = false
var mouse_position
var follow_mouse = false
var powder_drag
@export var color: String
@export var minimum_weight: float
@export var maximum_weight: float
# Called when the node enters the scene tree for the first time.
func _ready():
	powder_drag = $"../Dragging"
	start_position = global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("left_click") && mouse_on:
		follow_mouse = true
		dragging()
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
		mouse_on = true


func _on_mouse_exited():
	mouse_on = false
	Global.mouse_full = false

func dragging():
	while follow_mouse == true:
		if powder_drag != null:
			powder_drag.play()
			
			await get_tree().create_timer(randf_range(0.5, 1.5)).timeout
