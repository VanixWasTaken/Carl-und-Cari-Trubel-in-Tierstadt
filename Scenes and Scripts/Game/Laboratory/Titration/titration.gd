extends Node2D

signal balancing_game

var first_dialog = preload("res://Scenes and Scripts/Dialog/Laboratory Dialog/Titration Dialog/laboratory_minigame2_dialog_1.tscn")
var second_dialog = preload("res://Scenes and Scripts/Dialog/Laboratory Dialog/Titration Dialog/laboratory_minigame2_dialog_2.tscn")

var ready_to_pour = false

var tube_counter = 0

var finished_pouring = false
var signal_sent = false
# Called when the node enters the scene tree for the first time.
func _ready():
	var dialog_instance = first_dialog.instantiate()
	add_child(dialog_instance)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ready_to_pour and Input.is_action_just_pressed("left_click") and !finished_pouring:
		
		######################## HANDLES THE POURING ANIMATIONS OF THE CLAMP ###########################
		if tube_counter <= 3:
			$PouringClamp/Pouring.play()
			if tube_counter == 1:
				$PouringClamp/PouringClampAnim.play("pouring_green")
			elif tube_counter == 2:
				$PouringClamp/PouringClampAnim.play("pouring_purple")
			elif tube_counter == 3:
				$PouringClamp/PouringClampAnim.play("pouring_orange")
			else:
				$PouringClamp.visible = false
		# Timer duh
		await get_tree().create_timer(3).timeout
		
		# makes invisibile ooooo
		$PouringClamp.visible = false
		
		############################## HANDLES THE JUG AND STAND SPRITES ################################
		match tube_counter:
			1:
				$Jug/Jug.texture = load("res://Assets/Art/Environment/Rooms/Laboratory/Minigames/Titration/Jug/minigame2_glass_stage2.png")
				$Stand/StandArea/Glasses.texture = load("res://Assets/Art/Environment/Rooms/Laboratory/Minigames/Titration/Tubes/minigame2_testtubes_stage3.PNG")
			2:
				$Jug/Jug.texture = load("res://Assets/Art/Environment/Rooms/Laboratory/Minigames/Titration/Jug/minigame2_glass_stage3.png")
				$Stand/StandArea/Glasses.texture = load("res://Assets/Art/Environment/Rooms/Laboratory/Minigames/Titration/Tubes/minigame2_testtubes_stage5.PNG")
			3:
				$Jug/Jug.texture = load("res://Assets/Art/Environment/Rooms/Laboratory/Minigames/Titration/Jug/minigame2_glass_stage4.png")
				$Stand/StandArea/Glasses.texture = load("res://Assets/Art/Environment/Rooms/Laboratory/Minigames/Titration/Tubes/minigame2_testtubes_stage8.PNG")
				finished_pouring = true
		
		
		$Clamp.visible = true
		ready_to_pour = false
	
	if finished_pouring:
		if !signal_sent:
			var dialog_instance = second_dialog.instantiate()
			add_child(dialog_instance)
			$Clamp.disable_clamp()
			$Skillcheck/Bar.visible = true
			$Skillcheck/Arrow.visible = true
			$"Skillcheck/PH-Scale".visible = true
			emit_signal("balancing_game")
			signal_sent = true
	


# handles the colors and general visibility, whenever the clamp is dragged onto the stand, caps at tube_counter = 4 --> no overloading variable
func _on_clamp_pouring_time():
	
	
	if !finished_pouring:
		
		
		
		tube_counter += 1
		$Clamp.visible = false
		
		if tube_counter == 1:
			$PouringClamp.visible = true
			$PouringClamp/PouringClampAnim.play("idle_green")
			$Stand/StandArea/Glasses.texture = load("res://Assets/Art/Environment/Rooms/Laboratory/Minigames/Titration/Tubes/minigame2_testtubes_stage2.PNG")
			ready_to_pour = true
		elif tube_counter == 2:
			$PouringClamp.visible = true
			$PouringClamp/PouringClampAnim.play("idle_purple")
			$Stand/StandArea/Glasses.texture = load("res://Assets/Art/Environment/Rooms/Laboratory/Minigames/Titration/Tubes/minigame2_testtubes_stage4.PNG")
			ready_to_pour = true
		elif tube_counter == 3:
			$PouringClamp.visible = true
			$PouringClamp/PouringClampAnim.play("idle_orange")
			$Stand/StandArea/Glasses.texture = load("res://Assets/Art/Environment/Rooms/Laboratory/Minigames/Titration/Tubes/minigame2_testtubes_stage7.PNG")
			ready_to_pour = true
		else:
			$Clamp.visible = true
	else:
		$Clamp.visible = true


func _on_button_button_down():
	Global.lab_cutscene_played = true
	Global.return_laboratory_1 = true
	Global.return_laboratory_2 = true
	get_tree().change_scene_to_file("res://Scenes and Scripts/Game/Laboratory/laboratory_3d.tscn")
