extends CharacterBody2D
var speed = 300
var acceleration = 50
@onready var nav: NavigationAgent2D = $NavigationAgent2D
var object_name 
var scene_name

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
	object_name = objects_name
	scene_name = scenes_name

func _on_area_2d_area_entered(area):
	var area_name = area.get_parent().get_name()
	if area_name == object_name:
		get_tree().change_scene_to_file(scene_name)



func _on_footsteps_finished():
	if speed > 0:
		$Footsteps.play()
