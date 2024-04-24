extends Node2D

@onready var sound = $UI

# Called when the node enters the scene tree for the first time.
func _ready():
	$Backround.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_button_up():
	get_tree().change_scene_to_file("res://Scenes and Scripts/Character Choice/character_choice.tscn")


func _on_options_button_up():
	$OptionsMenu.visible = true


func _on_credits_button_up():
	$CreditsMenu.visible = true


func _on_quit_button_up():
	get_tree().quit()


# Hovers
func _on_start_mouse_entered():
	_play_ui_sound("hover")
func _on_options_mouse_entered():
	_play_ui_sound("hover")
func _on_credits_mouse_entered():
	_play_ui_sound("hover")
func _on_quit_mouse_entered():
	_play_ui_sound("hover")

# Clicks
func _on_start_button_down():
	_play_ui_sound("click")
func _on_options_button_down():
	_play_ui_sound("click")
func _on_credits_button_down():
	_play_ui_sound("click")
func _on_quit_button_down():
	_play_ui_sound("click")


# used to randomize UI sounds, based off the action thats fed into the function
func _play_ui_sound(action: String):
	var random = randi() % 3
	
	if action == "hover":
		match random:
			0:
				sound.stream = load("res://Assets/Sound Test/sfx_hub_ui_hover_var1.mp3")
			1:
				sound.stream = load("res://Assets/Sound Test/sfx_hub_ui_hover_var2.mp3")
			2:
				sound.stream = load("res://Assets/Sound Test/sfx_hub_ui_hover_var3.mp3")
	elif action == "click":
		match random:
			0:
				sound.stream = load("res://Assets/Sound Test/sfx_hub_ui_click_var1.mp3")
			1:
				sound.stream = load("res://Assets/Sound Test/sfx_hub_ui_click_var2.mp3")
			2:
				sound.stream = load("res://Assets/Sound Test/sfx_hub_ui_click_var3.mp3")
	
	sound.play()
