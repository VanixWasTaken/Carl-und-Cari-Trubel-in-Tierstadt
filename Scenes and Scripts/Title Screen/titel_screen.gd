extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Backround.play("default")
	await get_tree().create_timer(0.5).timeout
	$Button.global_position = Vector2.ZERO

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_button_up():
	get_tree().change_scene_to_file("res://Scenes and Scripts/Main Menu/main_menu.tscn")
