extends Node2D
var mouse_on = false

# Called when the node enters the scene tree for the first time.
func _ready():
	MusicController._play_music("mayhem", "laboratory", -30)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if mouse_on and Input.is_action_just_pressed("left_click"):
		get_tree().change_scene_to_file("res://Scenes and Scripts/Laboratory/chemical_laboratory.tscn")


func _on_labor_area_2d_mouse_entered():
	mouse_on = true


func _on_labor_area_2d_mouse_exited():
	mouse_on = false
