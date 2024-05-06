extends Node2D

var dialog = preload("res://Scenes and Scripts/Dialog/Intro Cutscene Dialog/intro_cutscene_dialog.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_animated_sprite_2d_animation_finished():
	$AnimatedSprite2D.queue_free()
	var dialog_instance = dialog.instantiate()
	add_child(dialog_instance)


func _on_animation_player_animation_finished(anim_name):
	$TextureRect.queue_free()
	$AnimatedSprite2D.play("default")
