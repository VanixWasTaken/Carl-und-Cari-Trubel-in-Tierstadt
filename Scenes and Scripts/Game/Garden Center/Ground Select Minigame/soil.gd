extends AnimatedSprite2D

var mouse_on = false
@export var correct_soil : bool
var finish_dialog = preload("res://Scenes and Scripts/Dialog/Garden Dialog/Minigame 3_1/garden_minigame_3_1_dialog_2.tscn")
var wrong_dialog = preload("res://Scenes and Scripts/Dialog/Garden Dialog/Minigame 3_1/garden_minigame_3_1_dialog_3.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("left_click") && mouse_on:
		if correct_soil:
			var next_dialog = finish_dialog.instantiate()
			get_tree().get_current_scene().add_child(next_dialog)
			GlobalGarden.finished_minigame_3_1 = true
			mouse_on = false
		elif !correct_soil:
			var next_dialog = wrong_dialog.instantiate()
			get_tree().get_current_scene().add_child(next_dialog)
			mouse_on = false
			frame = 0


func _on_area_2d_mouse_entered():
	frame = 1
	mouse_on = true
	$InformationLabel.show()


func _on_area_2d_mouse_exited():
	frame = 0
	mouse_on = false
	$InformationLabel.hide()
