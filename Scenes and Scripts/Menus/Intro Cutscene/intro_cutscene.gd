extends Node2D

var character_selection = preload("res://Scenes and Scripts/Menus/Character Selection/character_selection.tscn")

var button_pressed = 0



func _on_animated_sprite_2d_animation_finished():
	$AnimatedSprite2D.queue_free()
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
		$Dialog2/AnimationPlayer.play("new_animation")
		$WeiterButton.position = Vector2(110, 703)
	if button_pressed == 2:
		get_tree().change_scene_to_file("res://Scenes and Scripts/Menus/Character Selection/character_selection.tscn")


func _on_animation_player_dialog1_animation_finished(anim_name):
	await get_tree().create_timer(1).timeout
	$WeiterButton.show()


func _on_animation_player_dialog2_animation_finished(anim_name):
	await get_tree().create_timer(1).timeout
	$WeiterButton.show()


