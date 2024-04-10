extends CharacterBody2D
var speed = 600
var acceleration = 50
@onready var nav: NavigationAgent2D = $NavigationAgent2D

func _physics_process(delta):
	var direction = Vector2()
	if Input.is_action_just_pressed("left_click"):
		if Global.moving_allowed == true:
			nav.target_position = get_global_mouse_position()
			$AnimatedSprite2D.play("default")
			if position.distance_to(nav.target_position) > 10:
				speed = 600

	direction = nav.get_next_path_position() - global_position
	direction = direction.normalized()
	velocity = velocity.lerp(direction * speed, acceleration * delta)
	move_and_slide()
	if nav.is_target_reachable() == false:
		if nav.is_navigation_finished():
			speed = 0
			$AnimatedSprite2D.stop()

	elif nav.is_target_reachable() == true:
		if position.distance_to(nav.target_position) <= 10:
			speed = 0
			$AnimatedSprite2D.stop()

