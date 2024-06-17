extends Control

@onready var main_menu = preload("res://Scenes and Scripts/Menus/Main Menu/main_menu.tscn")

func _ready():
	$Options.visible = false

########### Hovers ###############
func _button_hovered():
	$Hover.play()



########### Button Functionality ###############
func _on_settings_button_up():
	$Options.visible = true

func _on_quit_button_up():
	get_tree().change_scene_to_packed(main_menu)

func _on_continue_button_up():
	self.queue_free()




###### Hovers of the Settings Menu (handled weirdly idk) ##########
func _on_options_hover():
	$Hover.play()
func _on_options_click():
	$Click.play()
	$Options.visible = false
