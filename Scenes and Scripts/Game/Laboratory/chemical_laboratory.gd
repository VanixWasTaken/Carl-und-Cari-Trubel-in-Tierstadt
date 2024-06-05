extends Node2D

var mouse_on = false
var outline_shader = preload("res://Shader/outline.tres")
var no_shader = preload("res://Shader/no_shader.tres")
var next_scene
func _ready():
	var playback: AudioStreamPlaybackPolyphonic
	$Ambience.play()
	playback = $Ambience.get_stream_playback()
	playback.play_stream(load("res://Assets/Sound/SFX/Ambience/Laboratory/sfx_laboratory_ambience_faucet_var1.mp3"))
	playback.play_stream(load("res://Assets/Sound/SFX/Ambience/Laboratory/sfx_laboratory_ambience_ventilation_var1.mp3"), 0, -12)
	$CanvasLayer/FadeAnimation.show()
	$CanvasLayer/AnimationPlayer.play("fade_in")
	await get_tree().create_timer(1).timeout
	next_scene = load("res://Scenes and Scripts/Game/Laboratory/laboratory_3d.tscn")
	
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
