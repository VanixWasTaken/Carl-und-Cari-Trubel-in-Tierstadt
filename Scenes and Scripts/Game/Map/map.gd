extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.menu_open = true



func _on_texture_button_button_up():
	Global.menu_open = false
	$"HUD/Help Movement".queue_free()


func _on_area_2d_2_area_entered(area):
	_paper_hover()
	Global.moving_allowed = false
	Global.mouse_in_button = true


func _on_area_2d_2_area_exited(area):
	Global.moving_allowed = true
	Global.mouse_in_button = false

func _paper_hover():
	var stream = AudioStreamRandomizer.new()
	stream.add_stream(0, load("res://Assets/Sound/SFX/UI/Specific/Map/sfx_hub_ui_paper_var1.mp3"))
	stream.add_stream(1, load("res://Assets/Sound/SFX/UI/Specific/Map/sfx_hub_ui_paper_var2.mp3"))
	stream.add_stream(2, load("res://Assets/Sound/SFX/UI/Specific/Map/sfx_hub_ui_paper_var3.mp3"))
	%Hover.stream = stream
	%Hover.play()
