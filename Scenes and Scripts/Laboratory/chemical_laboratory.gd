extends Node2D

var mouse_on = false
var outline_shader = preload("res://Shader/outline.tres")
var no_shader = preload("res://Shader/no_shader.tres")

func _ready():
	$Dialoguebox/Text.text = "Fülle zunmächst einmal etwas Wasser in das linke Reagenzglas."


func _process(delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) && mouse_on == true:
		$Laborraum.visible = false

func _on_texture_button_button_down():
	$Dialoguebox.visible = false


func _on_labor_area_2d_mouse_entered():
	mouse_on = true


func _on_labor_area_2d_mouse_exited():
	mouse_on = false
