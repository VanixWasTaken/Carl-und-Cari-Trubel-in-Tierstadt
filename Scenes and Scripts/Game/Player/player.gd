extends CharacterBody2D
var speed = 300
var acceleration = 50
@onready var nav: NavigationAgent2D = $NavigationAgent2D
var object_name 
var scene_name
var area_name
var in_area = false

func _ready():
	if Global.character =="Carl":
		$AnimatedSprite2D.play("carl_animation")
	elif Global.character == "Cari":
		$AnimatedSprite2D.play("cari_animation")
	$AnimatedSprite2D.stop()

func _physics_process(delta):
	var direction = Vector2()
	if Input.is_action_just_pressed("left_click"):
		if Global.moving_allowed == true:
			nav.target_position = get_global_mouse_position()
			if Global.character =="Carl":
				$AnimatedSprite2D.play("carl_animation")
			elif Global.character == "Cari":
					$AnimatedSprite2D.play("cari_animation")
			$Footsteps.play()
			if position.distance_to(nav.target_position) > 10:
				speed = 300

	direction = nav.get_next_path_position() - global_position
	direction = direction.normalized()
	velocity = velocity.lerp(direction * speed, acceleration * delta)
	move_and_slide()
	if nav.is_target_reachable() == false:
		if nav.is_navigation_finished():
			speed = 0
			$AnimatedSprite2D.stop()
			$Footsteps.stop()

	elif nav.is_target_reachable() == true:
		if position.distance_to(nav.target_position) <= 10:
			speed = 0
			$AnimatedSprite2D.stop()
			$Footsteps.stop()

func _get_clicked_object(objects_name, scenes_name):
	print(objects_name)
	object_name = objects_name
	scene_name = scenes_name
	if in_area && area_name == object_name:
		enter_building_prompt()

func _on_area_2d_area_entered(area):
	
	in_area = true
	area_name = area.get_name()
	if area_name == object_name:
		enter_building_prompt()



func _on_footsteps_finished():
	if speed > 0:
		$Footsteps.play()


func enter_building_prompt():
	Global.dialog_playing = true
	Global.moving_allowed = false
	$CanvasLayer/EnterPrompt.visible = true
	$CanvasLayer/EnterPrompt/Label.text = "Willst du das 
	" + str(area_name) + "
	 betreten?"


func _on_yes_button_button_up():
	get_tree().change_scene_to_file(scene_name)


func _on_no_button_button_up():
	$CanvasLayer/EnterPrompt.visible = false
	Global.moving_allowed = true
	Global.dialog_playing = false


func _on_area_2d_area_exited(area):
	in_area = false
