extends CharacterBody3D
@onready var navigation_agent:= $NavigationAgent3D
var speed = 15
var result

func _ready():
	if Global.character == "Carl":
		$AnimatedSprite3D.play("carl_idle")
	elif Global.character == "Cari" || Global.character == "":
		$AnimatedSprite3D.play("cari_idle")

func _process(delta):
	if Global.dialog_playing:
		$AnimatedSprite3D.pause()
	if navigation_agent.is_navigation_finished():
		return
	move_to_target(delta)


func move_to_target(delta):
	navigation_agent.target_desired_distance = 0.2

	var target_position = navigation_agent.get_next_path_position()
	if result != null:
		if result.collider.is_in_group("Ground"):
			navigation_agent.set_target_position(target_position)
	var direction = global_position.direction_to(target_position)
	var distance_to_target = global_position - target_position
	velocity = direction * speed
	
	if Global.moving_allowed:
		move_and_slide()



	#######################
	#        Walk Animation
	######################
	if Global.character == "Carl":
		if distance_to_target.x > 0 && !Global.dialog_playing:
			$AnimatedSprite3D.play("carl_walk_left")
		if distance_to_target.x < 0 && !Global.dialog_playing:
			$AnimatedSprite3D.play("carl_walk_right")
		if navigation_agent.is_target_reachable() == true:
			if navigation_agent.distance_to_target() <= 0.3:
				speed = 0
				$AnimatedSprite3D.play("carl_idle")
				navigation_agent.target_position = global_position
		elif navigation_agent.is_target_reachable() == false:
			navigation_agent.target_position = navigation_agent.get_final_position()

	elif Global.character == "Cari" || Global.character == "":
		if distance_to_target.x > 0 && !Global.dialog_playing :
			$AnimatedSprite3D.play("cari_walk_left")
		if distance_to_target.x < 0 && !Global.dialog_playing :
			$AnimatedSprite3D.play("cari_walk_right")
		if navigation_agent.is_target_reachable() == true:
			if navigation_agent.distance_to_target() <= 0.3:
				speed = 0
				$AnimatedSprite3D.play("cari_idle")
				navigation_agent.target_position = global_position
		elif navigation_agent.is_target_reachable() == false:
			navigation_agent.target_position = navigation_agent.get_final_position()

func _input(event):
# https://www.youtube.com/watch?v=KT06pv06Q1U Das ganze movement, versteh das alles nicht so 100 aber scheint erstmal zu klappen
	if Input.is_action_just_pressed("left_click") and Global.moving_allowed: # --> mvoing allowed ist dafür da, dass der spieler nicht beim hilfebutton laufen kann
		speed = 15
		var camera = get_tree().get_nodes_in_group("Camera")[0] #Holt die Kamera, da die Raycatsts von diueser aus entstehen die zur bewegung benötigt werden
		var mouse_position = get_viewport().get_mouse_position() #als 2d value
		var ray_length = 100 # Wie lang ist der raycast der geschossen wird?
		var from = camera.project_ray_origin(mouse_position) # position von wo aus der raycast geschossen wird
		var to = from + camera.project_ray_normal(mouse_position) * ray_length # endpunkt des raycatsts
		var space = get_world_3d().direct_space_state # wollen wir in 2d oder 3d sein?
		var ray_query = PhysicsRayQueryParameters3D.new() # beschrebt , was der raycast ist und was der macht
		ray_query.from = from
		ray_query.to = to
		result = space.intersect_ray(ray_query) #schießt den rayab und sag mir womit der intersected
		navigation_agent.target_position = result.position
