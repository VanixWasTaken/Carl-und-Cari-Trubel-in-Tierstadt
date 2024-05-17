extends Node2D

signal pouring_time

@onready var outline_shader = preload("res://Shader/outline.tres")
@onready var no_shader = preload("res://Shader/no_shader.tres")

var holding = false
var mouse_inside = false
var in_stand = false
var tube_counter = 0
var interactible = true

# Called when the node enters the scene tree for the first time.
func _ready():
	interactible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !Global.dialog_playing:
		
		if mouse_inside and Input.is_action_pressed("left_click"):
			
			$ClampArea/Clamp.material = no_shader
			
			var new_position = get_global_mouse_position()
			global_position = new_position
		
		elif Input.is_action_just_released("left_click"):
			
			if mouse_inside and !in_stand:
				$SetDown.play()
			
			if in_stand:
				$PickUp.play()
				tube_counter += 1
				emit_signal("pouring_time")
				in_stand = false
			
			global_position = Vector2(938, 965)
	
	if tube_counter >> 3:
		visible = true




func _on_clamp_area_mouse_entered():
	if interactible:
		$"../Hover".play()
		mouse_inside = true
		$ClampArea/Clamp.material = outline_shader


func _on_clamp_area_mouse_exited():
	if interactible:
		mouse_inside = false
		$ClampArea/Clamp.material = no_shader


func _on_clamp_area_area_entered(area):
	if area.get_name() == "StandArea" and interactible:
		$"../Hover".play()
		var children = area.get_children()
		for child in children:
			if child.name == "Stand" || child.name == "Glasses":
				child.material = outline_shader
		in_stand = true


func _on_clamp_area_area_exited(area):
	if area.get_name() == "StandArea" and interactible:
		var children = area.get_children()
		for child in children:
			if child.name == "Stand" || child.name == "Glasses":
				child.material = no_shader
		in_stand = false

func disable_clamp():
	interactible = false

