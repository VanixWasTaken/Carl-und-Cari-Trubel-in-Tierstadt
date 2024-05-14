extends AnimatedSprite2D


var shader_value = material.get_shader_parameter("value")
var speed = 0.001
var hitting_chameleon = false
var shooting = false
var mouse_moving = false

func _input(event):
	if event is InputEventMouseMotion:
		mouse_moving = true
	else:
		mouse_moving = false


func _physics_process(delta):
	if hitting_chameleon and shooting and mouse_moving:
		shader_value += speed
	
	shader_value = clamp(shader_value, 0.0, 1.0)
	
	material.set_shader_parameter("value", shader_value)
	
	if shader_value == 1:
		### NUR ÜBERGANGSWEISE SZENENWECHSEL, hier muss später noch dialog rein
		get_tree().change_scene_to_file("res://Scenes and Scripts/Game/Laboratory/laboratory_3d.tscn")









func _on_area_2d_area_entered(area):
	if area.get_name() == "ShootingArea":
		hitting_chameleon = true
func _on_area_2d_area_exited(area):
	if area.get_name() == "ShootingArea":
		hitting_chameleon = false


func _on_gun_in_hand_is_shooting():
	shooting = true
func _on_gun_in_hand_isnt_shooting():
	shooting = false
