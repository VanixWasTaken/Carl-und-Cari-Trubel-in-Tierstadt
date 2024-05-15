extends Node2D

var start_skillcheck = false
var start_game = false
var arrow_in_bar = false
var pressed_already = false
var countdown = 0

var win_dialog = preload("res://Scenes and Scripts/Dialog/Laboratory Dialog/Titration Dialog/laboratory_minigame2_dialog_win.tscn")
var lose_dialog = preload("res://Scenes and Scripts/Dialog/Laboratory Dialog/Titration Dialog/laboratory_minigame2_dialog_lose.tscn")
var try_again_dialog


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	print(delta)
	
	if Global.dialog_playing == false and start_skillcheck == true:
		if countdown == 0:
			play_countdown()
		
		
	
	if start_game == true and Global.dialog_playing == false:
		
		$Arrow/AnimationPlayer.play("movement")
		
		if Input.is_action_just_pressed("space") and arrow_in_bar and !pressed_already:
			$"PH-Scale/Arrow".position.y -= 50
			if $"PH-Scale/Arrow".position.y > 340:
				$"PH-Scale/Arrow".position.y = 340
			pressed_already = true
		else:
			
			$"PH-Scale/Arrow".position.y += 40 * delta
			
			if $"PH-Scale/Arrow".position.y < -80:
				$"PH-Scale/Arrow".position.y = -80


func _on_bar_area_entered(area):
	if area.get_name() == "Arrow":
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
	$TextureRect/Numbers.texture = load("res://Assets/Art/Environment/Rooms/Laboratory/Minigames/Titration/Skillcheck/minigame2_skillcheck_countdown_three.png")
	await get_tree().create_timer(1).timeout
	$TextureRect/Numbers.texture = load("res://Assets/Art/Environment/Rooms/Laboratory/Minigames/Titration/Skillcheck/minigame2_skillcheck_countdown_two.png")
	await get_tree().create_timer(1).timeout
	$TextureRect/Numbers.texture = load("res://Assets/Art/Environment/Rooms/Laboratory/Minigames/Titration/Skillcheck/minigame2_skillcheck_countdown_one.png")
	await get_tree().create_timer(1).timeout
	$TextureRect/Numbers.texture = load("res://Assets/Art/Environment/Rooms/Laboratory/Minigames/Titration/Skillcheck/minigame2_skillcheck_countdown_go.png")
	await get_tree().create_timer(1).timeout
	$TextureRect.visible = false
	start_game = true
	$MiniGameTime.start()


func _on_mini_game_time_timeout():
	start_game = false
	$Arrow/AnimationPlayer.stop()
	if $"PH-Scale/Arrow".position.y >= 83 and $"PH-Scale/Arrow".position.y <= 183:
		var dialog_instance = win_dialog.instantiate()
		add_child(dialog_instance)
	else:
		var dialog_instance = lose_dialog.instantiate()
		add_child(dialog_instance)
		reset_entire_minigame()

func reset_entire_minigame():
	$"PH-Scale/Arrow".position.y = -80
	start_skillcheck = true
	arrow_in_bar = false
	pressed_already = false
	countdown = 0
