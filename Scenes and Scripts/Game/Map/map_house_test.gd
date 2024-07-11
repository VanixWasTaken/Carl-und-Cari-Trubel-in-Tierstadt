extends Node2D


var mouse_inside = false
@export var scene_name: String
@onready var outline_shader = preload("res://Shader/outline.tres")
@onready var no_shader = preload("res://Shader/no_shader.tres")
var animation_frame = 0
var next_scene 
var can_enter = true
var exit_coordinates
@onready var visited_dialog = preload("res://Scenes and Scripts/Dialog/Map Dialoge/already_visited_job_dialog.tscn")
@export var building_name : String
func _ready():
	MusicController._play_music("adventure", "map", -18)
	await get_tree().create_timer(0.25).timeout
	next_scene = load(scene_name)
	exit_coordinates = $ExitPoint.global_position

func _process(delta):
	animation_frame = $AnimatedSprite2D.frame + 1
	if animation_frame == 3:
		animation_frame = 0
	if mouse_inside and Input.is_action_just_pressed("left_click"):
		if can_enter:
			%Click.play()
			$"../Player"._get_clicked_object(building_name, scene_name)
			Global.pause_opened = false


# handles the input for clicking on the house to enter the level
func _on_area_2d_mouse_entered():
	mouse_inside = true
	%Hover.play()
	_hover()
	$AnimatedSprite2D.play("house_highlight_animation")
	$AnimatedSprite2D.frame = animation_frame 
func _on_area_2d_mouse_exited():
	mouse_inside = false
	$AnimatedSprite2D.play("house_animation")
	$AnimatedSprite2D.frame = animation_frame

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

func change_scene():
	Global.exit_coordinates = exit_coordinates
	Global.inside_laboratory = true
	get_tree().change_scene_to_packed(next_scene)

func _input(event):
	if Input.is_action_just_released("left_click") && mouse_inside:
		get_tree().get_first_node_in_group("Player").nav.target_position = exit_coordinates
