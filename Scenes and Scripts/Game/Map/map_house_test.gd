extends Node2D


var mouse_inside = false
var my_name = "null"
@export var scene_name: String
@onready var outline_shader = preload("res://Shader/outline.tres")
@onready var no_shader = preload("res://Shader/no_shader.tres")

func _ready():
	my_name = get_name()
	MusicController._play_music("adventure", "map", -20)

func _process(delta):
	if mouse_inside:
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	if mouse_inside and Input.is_action_just_pressed("left_click"):
		%Click.play()
		$"../Player"._get_clicked_object(my_name, scene_name)

# handles the input for clicking on the house to enter the level
func _on_area_2d_mouse_entered():
	mouse_inside = true
	%Hover.play()
	_hover()
func _on_area_2d_mouse_exited():
	mouse_inside = false

# deactivates the functionality of the house, by making the area2d invisible
func _on_job_notes_deactivate_house():
	$Area2D.visible = false

func _on_job_notes_reactivate_house():
	$Area2D.visible = true

func _hover():
	var stream = AudioStreamRandomizer.new()
	stream.add_stream(0, load("res://Assets/Sound/SFX/UI/Hover/sfx_hub_ui_hover_var1.mp3"))
	stream.add_stream(1, load("res://Assets/Sound/SFX/UI/Hover/sfx_hub_ui_hover_var3.mp3"))
	%Hover.stream = stream
	%Hover.play()

#help button function
func _on_control_help_opened():
	$AnimatedSprite2D.material = outline_shader

func _on_control_help_closed():
	$AnimatedSprite2D.material = no_shader
