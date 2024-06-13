extends Node2D

var start_skillcheck = false
var start_game = false
var arrow_in_bar = false
var pressed_already = false
var countdown = 0
var needed_time = 13
var current_time = 0.0
var win_dialog = preload("res://Scenes and Scripts/Dialog/Laboratory Dialog/Titration Dialog/laboratory_minigame2_dialog_win.tscn")
var lose_dialog = preload("res://Scenes and Scripts/Dialog/Laboratory Dialog/Titration Dialog/laboratory_minigame2_dialog_lose.tscn")
var try_again_dialog

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tre


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	if Global.dialog_playing == false and start_skillcheck == true:
		if countdown == 0:
			play_countdown()
		
		
	
	if start_game == true and Global.dialog_playing == false:
		
		$Arrow/AnimationPlayer.play("movement")
		
		if Input.is_action_just_pressed("space") and arrow_in_bar and !pressed_already:
			$Burette/Drip.play()
			$Burette/Success.play()
			$"PH-Scale/Arrow".position.y -= 90
			$"../AnimatedSprite2D".visible = true
			$"../AnimatedSprite2D".play()
			if $"PH-Scale/Arrow".position.y > 326: #Niedrigster Wert / Unterster Strich
				$"PH-Scale/Arrow".position.y = 326
			pressed_already = true
			var rng_cam = rng.randi_range(1, 2)
			if rng_cam == 1:
				$Camera2D/AnimationPlayer.play("zoom1_animation") 
			if rng_cam == 2:
				$Camera2D/AnimationPlayer.play("zoom2_animation") 

		
		elif Input.is_action_just_pressed("space") and !arrow_in_bar and !pressed_already:
			$Burette/Failure.play()
			pressed_already = true
		else:
			if $"PH-Scale/Arrow".position.y <= 320:
				$"PH-Scale/Arrow".position.y += 90 * delta
			
			if $"PH-Scale/Arrow".position.y < -263: #Oberster Strich
				$"PH-Scale/Arrow".position.y = -263

		if $"PH-Scale/Arrow".position.y >= 0 and $"PH-Scale/Arrow".position.y <= 151: #Gewinn Werte
			current_time += delta


func _on_bar_area_entered(area):
	if area.get_name() == "Arrow":
		pressed_already = false
		arrow_in_bar = true


func _on_bar_area_exited(area):
	if area.get_name() == "Arrow":
		arrow_in_bar = false
		pressed_already = false


func _on_titration_balancing_game():
	start_skillcheck = true

func play_countdown():
	countdown = 1
	$TextureRect.visible = true
	$"321".play()
	$TextureRect/Numbers.texture = load("res://Assets/Art/Environment/Rooms/Laboratory/Minigames/Titration/Skillcheck/lab_minigame2_numbers_3.png")
	await get_tree().create_timer(1).timeout
	$"321".play()
	$TextureRect/Numbers.texture = load("res://Assets/Art/Environment/Rooms/Laboratory/Minigames/Titration/Skillcheck/lab_minigame2_numbers_2.png")
	await get_tree().create_timer(1).timeout
	$"321".play()
	$TextureRect/Numbers.texture = load("res://Assets/Art/Environment/Rooms/Laboratory/Minigames/Titration/Skillcheck/lab_minigame2_numbers_1.png")
	await get_tree().create_timer(1).timeout
	$Meins.play()
	$TextureRect.visible = false
	start_game = true
	$Bubbling.play()
	$MiniGameTime.start()
	MusicController._play_music("dropletdance", "laboratory", -12, 0)


func _on_mini_game_time_timeout():
	start_game = false
	$Arrow/AnimationPlayer.stop()
	$Bubbling.stop()
	if current_time >= needed_time || $"PH-Scale/Arrow".position.y >= 30 and $"PH-Scale/Arrow".position.y <= 121: #Gewinn Werte
		var dialog_instance = win_dialog.instantiate()
		add_child(dialog_instance)
	else:
		var dialog_instance = lose_dialog.instantiate()
		add_child(dialog_instance)
		reset_entire_minigame()

func reset_entire_minigame():
	$"PH-Scale/Arrow".position.y = 31 #Start Position, sollte so ungefähr bei genau der Mitte sein
	start_skillcheck = true
	arrow_in_bar = false
	pressed_already = false
	countdown = 0


func _on_animated_sprite_2d_animation_finished():
	$"../AnimatedSprite2D".visible = false
