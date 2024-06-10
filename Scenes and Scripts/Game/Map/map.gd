extends Node2D


@onready var laboratory_quiz = preload("res://Scenes and Scripts/Game/Quiz/Laboratory Quiz/quiz_laboratory.tscn")



# Called when the node enters the scene tree for the first time.
func _ready():
	Global.menu_open = true
	if Global.inside_laboratory == true:
		$"HUD/Help Movement".hide()
		$Player.position = Vector2(319, 313)
		add_child(laboratory_quiz.instantiate())
		Global.moving_allowed = false
		Global.inside_laboratory = false


func _input(event):
	if event.is_action_pressed("right_click"):
		Global.inside_laboratory = true

func _on_texture_button_button_up():
	Global.menu_open = false
	$"HUD/Help Movement".queue_free()

func _paper_hover():
	var stream = AudioStreamRandomizer.new()
	stream.add_stream(0, load("res://Assets/Sound/SFX/UI/Specific/Map/sfx_hub_ui_paper_var1.mp3"))
	stream.add_stream(1, load("res://Assets/Sound/SFX/UI/Specific/Map/sfx_hub_ui_paper_var2.mp3"))
	stream.add_stream(2, load("res://Assets/Sound/SFX/UI/Specific/Map/sfx_hub_ui_paper_var3.mp3"))
	%Hover.stream = stream
	%Hover.play()
