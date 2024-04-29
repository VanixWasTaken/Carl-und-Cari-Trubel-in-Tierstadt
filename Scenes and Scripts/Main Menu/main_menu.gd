extends Node2D

@onready var sound = $UI

# Called when the node enters the scene tree for the first time.
func _ready():
	$Backround.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Input for usability
func _on_start_button_up():
	get_tree().change_scene_to_file("res://Scenes and Scripts/Character Choice/character_choice.tscn")

func _on_options_button_up():
	$OptionsMenu.visible = true

func _on_credits_button_up():
	$CreditsMenu.visible = true

func _on_quit_button_up():
	get_tree().quit()

# Handles the Hover sounds
func _on_button_hovered():
	$Hover.play()

# Handles the Click sounds
func _on_button_click():
	$Click.play()
