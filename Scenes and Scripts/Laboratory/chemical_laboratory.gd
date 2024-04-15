extends Node2D

var mouse_on = false
var outline_shader = preload("res://Shader/outline.tres")
var no_shader = preload("res://Shader/no_shader.tres")

func _ready():
	$TextureRect/DialogeText.text == "Ich brauche deine Hilfe! Ich kann michr nicht mehr sichtbar machen. Du musst mir meine Visabel-Mischung machen. Fülle zuerst Wasser in das erste Ragenzglas. "


func _process(delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) && mouse_on == true:
		$Laborraum.visible = false

func _on_texture_button_button_down():
	$TextureRect.visible = false


func _on_labor_area_2d_mouse_entered():
	mouse_on = true


func _on_labor_area_2d_mouse_exited():
	mouse_on = false
