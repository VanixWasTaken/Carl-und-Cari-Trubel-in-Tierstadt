extends AnimatedSprite2D


var shader_value = material.get_shader_parameter("value")
var speed = 0.003
var hitting_chameleon = false
var shooting = false
var mouse_moving = false
var should_play_dialog = true
var should_play_dialog3 = true
var shooting_time = 0
var dialog1 = preload("res://Scenes and Scripts/Dialog/Laboratory Dialog/Spray Mini Game Dialog/dialog_spray_mini_game1.tscn")
var dialog3 = preload("res://Scenes and Scripts/Dialog/Laboratory Dialog/Spray Mini Game Dialog/dialog_spray_mini_game3.tscn")
@onready var gun_jam_timer = $"../GunJam"
@onready var gun_in_hand = $"../GunInHand"

signal gun_is_jamming

func _input(event):
	if event is InputEventMouseMotion:
		mouse_moving = true
	else:
		mouse_moving = false
	if Input.is_action_just_pressed("left_click"):
		gun_jam_timer.start()

func _process(delta):
	if shooting_time == 2:
		if should_play_dialog3:
			add_child(dialog3.instantiate())
			gun_in_hand.visible = false
		var children = get_children()
		for child in children:
			if child.name == "DialogSprayMiniGame3":
				var babies = child.get_children()
				for baby in babies:
					if baby.name == "DialogBox":
						baby.should_shoot.connect(should_shoot)
		shooting_time = 0
		gun_is_jamming.emit()
		


func _physics_process(delta):
	if hitting_chameleon and shooting and mouse_moving:
		shader_value += speed
		
		
	shader_value = clamp(shader_value, 0.0, 1.0)
	
	material.set_shader_parameter("value", shader_value)
	
	if shader_value == 1 and should_play_dialog:
		
		add_child(dialog1.instantiate())
		should_play_dialog = false
		gun_in_hand.visible = false
		










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
	shooting_time = 0


func _on_gun_jam_timeout():
	if shooting: 
		shooting_time += 1

func should_shoot():
	gun_in_hand.visible = true
	should_play_dialog3 = false


	
	
