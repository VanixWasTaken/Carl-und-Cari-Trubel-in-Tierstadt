extends Node3D

var player

func _ready():
	Global.last_scene = "GardenCenter"
	player = get_tree().get_first_node_in_group("Player")
	if GlobalGarden.cutscene_played == false:
		$CutsceneAnimation.play("camera_pan")
		Global.cutscene_playing = true
	

func _process(_delta):
	if !Global.cutscene_playing:
		if $Player.position.x <= 19.5 and $Player.position.x >= -19.5:
			$Camera3D.position.x = $Player.position.x



func _on_cutscene_animation_animation_finished(camera_pan):
	Global.cutscene_playing = false
	$CutsceneAnimation/MouseBlock.queue_free()
