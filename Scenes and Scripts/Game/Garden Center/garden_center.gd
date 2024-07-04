extends Node3D

var player

func _ready():
	MusicController._play_music("peace_and_tranquility", "garden_center", -15)
	Global.last_scene = "GardenCenter"
	player = get_tree().get_first_node_in_group("Player")
	if GlobalGarden.cutscene_played == false:
		$CutsceneAnimation.play("camera_pan")
		Global.cutscene_playing = true
	if GlobalGarden.finished_minigame_3_2:
		$Player.position = Vector3(16.85, 0.85, 0.65)
	

func _process(_delta):
	if !Global.cutscene_playing:
		if $Player.position.x <= 19.5 and $Player.position.x >= -19.5:
			$Camera3D.position.x = $Player.position.x



func _on_cutscene_animation_animation_finished(camera_pan):
	Global.cutscene_playing = false
	$CutsceneAnimation/MouseBlock.queue_free()
