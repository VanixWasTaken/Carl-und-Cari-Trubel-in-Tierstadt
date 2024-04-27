extends CharacterBody3D
@onready var navigation_agent:= $NavigationAgent3D
var speed = 15

func _process(delta):
	if(navigation_agent.is_navigation_finished()):
		return
	move_to_target(delta)

func move_to_target(delta):
	var target_position = navigation_agent.get_next_path_position()
	var direction = global_position.direction_to(target_position)
	
	velocity = direction * speed
	move_and_slide()



	#######################
	#        Walk Animation
	########################
	
	#if direction.x < 0:
		#$AnimatedSprite3D.play("walk_left")
	#if direction.x > 0:
		#$AnimatedSprite3D.play("walk_right")
	#if direction.x == 0:
		#$AnimatedSprite3D.play("idle")

func _input(event):
# https://www.youtube.com/watch?v=KT06pv06Q1U Das ganze movement, versteh das alles nicht so 100 aber scheint erstmal zu klappen
	if Input.is_action_just_pressed("left_click"):
		var camera = get_tree().get_nodes_in_group("Camera")[0] #Holt die Kamera, da die Raycatsts von diueser aus entstehen die zur bewegung benötigt werden
		var mouse_position = get_viewport().get_mouse_position() #als 2d value
		var ray_length = 100 # Wie lang ist der raycast der geschossen wird?
		var from = camera.project_ray_origin(mouse_position) # position von wo aus der raycast geschossen wird
		var to = from + camera.project_ray_normal(mouse_position) * ray_length # endpunkt des raycatsts
		var space = get_world_3d().direct_space_state # wollen wir in 2d oder 3d sein?
		var ray_query = PhysicsRayQueryParameters3D.new() # beschrebt , was der raycast ist und was der macht
		ray_query.from = from
		ray_query.to = to
		var result = space.intersect_ray(ray_query) #schießt den rayab und sag mir womit der intersected
		print(result)
		navigation_agent.target_position = result.position

