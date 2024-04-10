extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$TextureRect/DialogeText.text == "Ich brauche deine Hilfe! Ich kann michr nicht mehr sichtbar machen. Du musst mir meine Visabel-Mischung machen. Fülle zuerst Wasser in das erste Ragenzglas. "


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_texture_button_button_down():
	$TextureRect.visible = false
