extends Node2D

var mouse_on = false
var outline_shader = preload("res://Shader/outline.tres")
var no_shader = preload("res://Shader/no_shader.tres")
@onready var next_scene = preload("res://Scenes and Scripts/Game/Laboratory/laboratory_3d.tscn")
@onready var first_dialog = preload("res://Scenes and Scripts/Dialog/Laboratory Dialog/Powder Dialog/powder_dialog_1.tscn")


func _ready():
	var playback: AudioStreamPlaybackPolyphonic
	$Ambience.play()
	playback = $Ambience.get_stream_playback()
	playback.play_stream(load("res://Assets/Sound/SFX/Ambience/Laboratory/sfx_laboratory_ambience_faucet_var1.mp3"))
	playback.play_stream(load("res://Assets/Sound/SFX/Ambience/Laboratory/sfx_laboratory_ambience_ventilation_var1.mp3"), 0, -12)
	$CanvasLayer/FadeAnimation.show()
	$CanvasLayer/AnimationPlayer.play("fade_in")

func _process(delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) && mouse_on == true:
		$Laborraum.visible = false

func _on_labor_area_2d_mouse_entered():
	mouse_on = true


func _on_labor_area_2d_mouse_exited():
	mouse_on = false


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "fade_out":
		get_tree().change_scene_to_packed(next_scene)
	elif anim_name == "fade_in":
		print("QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ")
		var dialog = first_dialog.instantiate()
		get_tree().get_current_scene().add_child(dialog)
