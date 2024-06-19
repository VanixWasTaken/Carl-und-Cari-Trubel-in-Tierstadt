extends Control

func _ready():
	if !FileAccess.file_exists("user://savegame.save"):
		SaveSystem.save_game()
	SaveSystem.load_game()

var animation_counter = 0
@onready var next_scene = preload("res://Scenes and Scripts/Menus/Title Screen/title_screen.tscn")

func _on_animation_player_animation_finished(anim_name):
	if animation_counter == 0:
		$Fade/AnimationPlayer.play_backwards("fade_in")
		await get_tree().create_timer(2).timeout
		$DDI.visible = true
		animation_counter = 1
	elif animation_counter == 1:
		$Fade/AnimationPlayer.play("fade_in")
		await get_tree().create_timer(2).timeout
		animation_counter = 2
	elif animation_counter == 2:
		$Fade/AnimationPlayer.play_backwards("fade_in")
		await get_tree().create_timer(2).timeout
		animation_counter = 3
	elif animation_counter == 3:
		get_tree().change_scene_to_packed(next_scene)
