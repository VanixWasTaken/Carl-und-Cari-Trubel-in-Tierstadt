extends Control

@onready var main_menu = preload("res://Scenes and Scripts/Menus/Main Menu/main_menu.tscn")

func _ready():
	$Options.visible = false
	Global.moving_allowed = false

func _input(event):
	if event.is_action_pressed("escape"):
		if get_tree().get_current_scene().name == "Map":
			self.visible = false
		else:
			Global.pause_opened = false
			self.queue_free()

#region ########### Sound for Local Buttons ###############
func _button_hovered():
	$Hover.play()

func _button_clicked():
	$Click.play()
#endregion

#region ############## Button Functionality ###############
func _on_settings_button_up():
	$Options.visible = true

func _on_quit_button_up():
	Global.pause_opened = false
	Global.moving_allowed = true
	get_tree().change_scene_to_packed(main_menu)

func _on_continue_button_up():
	Global.pause_opened = false
	Global.moving_allowed = true
	if get_tree().get_current_scene().name == "Map":
		self.visible = false
	else:
		self.queue_free()
#endregion

#region ###### Hovers of the Settings Menu (handled weirdly idk) ##########
func _on_options_hover():
	$Hover.play()
func _on_options_click():
	$Click.play()
	$Options.visible = false
#endregion
