extends CharacterBody2D
var speed = 0
var acceleration = 50
@onready var nav: NavigationAgent2D = $NavigationAgent2D
var object_name 
var scene_name
var area_name
var building
var in_area = false


func _ready():
	$CanvasLayer/FadeAnimation.visible = true
	if Global.character =="Carl":
		$AnimatedSprite2D.play("carl_animation")
	elif Global.character == "Cari":
		$AnimatedSprite2D.play("cari_animation")
	$AnimatedSprite2D.stop()
	$CanvasLayer/AnimationPlayer.play("fade_in")
	Global.moving_allowed = false
	Global.cutscene_playing = true

	if Global.inside_laboratory:
		Global.moving_allowed = true
		Global.cutscene_playing = false
	

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
				speed = 400



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
	
	
	if speed > 0:
		$RunParticles.emitting = true






func _get_clicked_object(objects_name, scenes_name):
	object_name = objects_name
	scene_name = scenes_name
	if area_name != null:
		if in_area && area_name .contains(object_name):
			enter_building_prompt()

func _on_area_2d_area_entered(area):
	in_area = true
	building = area.get_parent()
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
	$CanvasLayer/Label.show()
	$CanvasLayer/YesButton.show()
	$CanvasLayer/NoButton.show()
	$CanvasLayer/Label.text =  str(area_name) + "
	 betreten?"


func _on_yes_button_button_up():
	$CanvasLayer/AnimationPlayer.play("fade_out")


func _on_no_button_button_up():
	$CanvasLayer/EnterPrompt.visible = false
	$CanvasLayer/Label.hide()
	$CanvasLayer/YesButton.hide()
	$CanvasLayer/NoButton.hide()
	Global.moving_allowed = true
	Global.dialog_playing = false


func _on_area_2d_area_exited(area):
	in_area = false


func _on_animation_player_animation_finished(anim_name):
	$CanvasLayer.layer = 1
	if anim_name == "fade_out":
		building.change_scene()
	if anim_name == "fade_in":
		Global.cutscene_playing = false
		Global.moving_allowed = true
