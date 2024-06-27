extends Node3D

var cutscene = true

func _ready():
	if Global.garden_cutscene_played == false:
		cutscene = true
		$CameraPan.play("camera_pan")
	

func _process(_delta):
	if !cutscene:
		if $Player.position.x <= 19.5 and $Player.position.x >= -19.5:
			$Camera3D.position.x = $Player.position.x



func _on_cutscene_animation_animation_finished(camera_pan):
	cutscene = false
	Global.garden_cutscene_played = true
	$CutsceneAnimation/MouseBlock.queue_free()
