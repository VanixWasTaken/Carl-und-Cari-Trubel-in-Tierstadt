extends CharacterBody3D

# How fast the player moves in meters per second.
@export var speed = 14
# The downward acceleration when in the air, in meters per second squared.
@export var fall_acceleration = 75

var target_velocity = Vector3.ZERO


func _physics_process(delta):
	# We create a local variable to store the input direction.
	var direction = Vector3.ZERO

	# We check for each move input and update the direction accordingly.
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.z += 1
	if Input.is_action_pressed("ui_up"):
		direction.z -= 1
		
		
	if direction != Vector3.ZERO:
		direction = direction.normalized()


	# Ground Velocity
	target_velocity.x = direction.x * speed
	target_velocity.z = direction.z * speed

	# Vertical Velocity
	if not is_on_floor(): # If in the air, fall towards the floor. Literally gravity
		target_velocity.y = target_velocity.y - (fall_acceleration * delta)

	# Moving the Character
	velocity = target_velocity
	move_and_slide()



	#######################
	#        Walk Animation
	########################
	
	#if $".".global_position.x == 0:
		#$AnimatedSprite3D.play("idle")
	if direction.x < 0:
		$AnimatedSprite3D.play("walk_left")
	if direction.x > 0:
		$AnimatedSprite3D.play("walk_right")
	if direction.x == 0:
		$AnimatedSprite3D.play("idle")

