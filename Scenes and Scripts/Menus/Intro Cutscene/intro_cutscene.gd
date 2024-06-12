extends Node2D

var next_scene = preload("res://Scenes and Scripts/Menus/Character Selection/character_selection.tscn")

var button_pressed = 0

var narrator_count = 0


func _ready():
	MusicController._play_music("adventure", "map", -20)
	narrator_delay()


func _on_animated_sprite_2d_animation_finished():
	$AnimatedSprite2D.queue_free()
	$VoiceOver.stream = load("res://Assets/Sound/VO/Intro/vo_npc_mayor_intro_help_01.mp3")
	$VoiceOver.play()
	$Dialog1.show()
	$Dialog1/AnimationPlayer.play("new_animation")




func _on_animation_player_animation_finished(anim_name):
	$TextureRect.queue_free()
	$AnimatedSprite2D.play("default")


func _on_weiter_button_pressed():
	button_pressed += 1
	if button_pressed == 1:
		$WeiterButton.hide()
		$Dialog1.hide()
		$Dialog2.show()
		$VoiceOver.stream = load("res://Assets/Sound/VO/Intro/vo_npc_both_intro_help_02.mp3")
		$VoiceOver.play()
		$Dialog2/AnimationPlayer.play("new_animation")
		$WeiterButton.position = Vector2(110, 703)
	if button_pressed == 2:
		get_tree().change_scene_to_packed(next_scene)


func _on_animation_player_dialog1_animation_finished(anim_name):
	await get_tree().create_timer(1).timeout
	$WeiterButton.show()


func _on_animation_player_dialog2_animation_finished(anim_name):
	await get_tree().create_timer(1).timeout
	$WeiterButton.show()




func _on_clouds_animation_finished():
	$Clouds.hide()


func _on_narrator_finished():
	$TelephoneRing.play()

func narrator_delay():
	if narrator_count == 0:
		await get_tree().create_timer(1).timeout
		$Narrator.play()
		narrator_count += 1


func _on_animated_sprite_2d_frame_changed():
	if $AnimatedSprite2D.frame == 1:
		$NailingPoster.play()
	elif $AnimatedSprite2D.frame == 5:
		$TelephoneGrab.play()


func _on_telephone_grab_finished():
	await get_tree().create_timer(0.9).timeout
	$TelephonePickUp.play()


func _on_weiter_button_mouse_entered():
	$Hover.play()


func _on_weiter_button_button_down():
	$Click.play()
