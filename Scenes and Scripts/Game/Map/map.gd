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
		$HUD/HelpProfiles.show()



func _on_texture_button_button_up():
	Global.menu_open = false
	if $"HUD/Help Movement".visible == true:
		$"HUD/Help Movement".queue_free()
	if $HUD/HelpProfiles.visible == true:
		$HUD/HelpProfiles.queue_free()

func _paper_hover():
	var stream = AudioStreamRandomizer.new()
	stream.add_stream(0, load("res://Assets/Sound/SFX/UI/Specific/Map/sfx_hub_ui_paper_var1.mp3"))
	stream.add_stream(1, load("res://Assets/Sound/SFX/UI/Specific/Map/sfx_hub_ui_paper_var2.mp3"))
	stream.add_stream(2, load("res://Assets/Sound/SFX/UI/Specific/Map/sfx_hub_ui_paper_var3.mp3"))
	%Hover.stream = stream
	%Hover.play()

func _on_clouds_animation_finished():
	$Clouds.visible = false

func _on_animation_player_animation_finished(anim_name):
	$CloudControl/AnimationPlayer4.play("new_animation")

func _on_animation_player_2_animation_finished(anim_name):
	$CloudControl/AnimationPlayer5.play("new_animation")

func _on_animation_player_3_animation_finished(anim_name):
	$CloudControl/AnimationPlayer6.play("new_animation")
