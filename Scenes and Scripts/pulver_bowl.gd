extends AnimatedSprite2D

var start_position
var mouse_on = false
var mouse_position
var weight = 0.0
var red_on = false
var yellow_on = false
var purple_on = false
@export var pulver_color: String
var bowl_full = false
var too_little = false
var enough = false
var too_much = false
var needed_pulver = "Purple"
var area_name
# Called when the node enters the scene tree for the first time.
func _ready():
	start_position = position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	needed_pulver = $"../DrinkHolder".needed_color
	$"../Scale/RichTextLabel".text = str(weight) + " g"
	if mouse_on:
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			mouse_position = get_global_mouse_position()
			position = mouse_position
			Global.mouse_full = true
		elif Input.is_action_just_released("left_click"):
			position = start_position
			$Interact.stream = load("res://Assets/Sound Test/sfx_laboratory_foley_beakersetdown_var.mp3")
			_randomize_sounds("release")
			%PulverPour.stop()



func _on_area_2d_mouse_entered():
	if Global.mouse_full == false:
		mouse_on = true
		Global.mouse_full = true

func _on_area_2d_mouse_exited():
	mouse_on = false
	Global.mouse_full = false


func _on_area_2d_area_entered(area):
	area_name = area.get_name()
	if area_name != "PulverBowl":
		if needed_pulver == area.get_parent().color:
			%PulverPour.play()
			if bowl_full == false || pulver_color == "Red":
				if area.name == "RedPulver":
					area.get_parent().play("new_animation")
					red_on = true
					red_pulver()
					pulver_color = "Red"
			if bowl_full == false || pulver_color == "Yellow":
				if area.name == "YellowPulver":
					area.get_parent().play("new_animation")
					yellow_on = true
					yellow_pulver()
					pulver_color = "Yellow"
			if bowl_full == false || pulver_color == "Purple":
				if area.name == "PurplePulver":
					area.get_parent().play("new_animation")
					purple_on = true
					purple_pulver()
					pulver_color = "Purple"
			bowl_full = true

func red_pulver():
	await get_tree().create_timer(0.2).timeout
	if red_on == true:
		weight += 0.1
		if weight == 0.1:
			$".".frame = 5
		elif weight == 0.4:
			$".".frame = 6
		elif weight == 0.7:
			$".".frame = 7
		elif weight >= 1.0 && weight <= 1.2:
			$".".frame = 8
		elif weight == 1.3:
			$".".frame = 9
		elif weight >= 1.6:
			$".".frame = 10
		red_pulver()

func yellow_pulver():
	await get_tree().create_timer(0.2).timeout
	if yellow_on == true:
		weight += 0.2
		if weight == 0.2:
			$".".frame = 11
		elif weight >= 0.5 && weight <= 0.8:
			$".".frame = 12
		elif weight == 1.2:
				$".".frame = 13
		elif weight >= 1.6 && weight <= 2.0:
			$".".frame = 14
		elif weight >= 2:
			$".".frame = 15
		yellow_pulver()

func purple_pulver():
	await get_tree().create_timer(0.3).timeout
	if purple_on == true:
		weight += 0.05
		if weight == 0.05:
			$".".frame = 1
		elif weight >= 0.15 && weight <= 0.3:
			$".".frame = 2
		elif weight == 0.35:
			$".".frame = 3
		elif weight >= 0.5:
			$".".frame = 4
		purple_pulver()

func _on_area_2d_area_exited(area):
	var area_parent = area.get_parent()
	area_name = area.get_name()
	if area_name != "PulverBowl" && area_name != "WaterCup":
		if weight < area_parent.minimum_weight:
			too_little = true
			enough = false
			$"../Dialoguebox".visible = true
			$"../Dialoguebox/Text".text = "Das ist noch nicht genug. Gib noch ein bisschen mehr von dem Pulver hinzu."
		elif weight >= area_parent.minimum_weight && weight <= area_parent.maximum_weight:
			too_little = false
			enough = true
			$"../Dialoguebox".visible = true
			$"../Dialoguebox/Text".text = "Sehr gut. Jetzt füge das Pulver dem Wasser hinzu."
		elif weight > area_parent.maximum_weight:
			enough = false
			too_much = true
			$"../Dialoguebox".visible = true
			$"../Dialoguebox/Text".text = "Das war jetzt zu viel Pulver. Ich entleere die Schale eben für dich, dann kannst du es nochmal versuchen."
			weight = 0.0
			$".".frame = 0

	red_on = false
	yellow_on = false
	purple_on = false
	if area_name != "PulverBowl":
		area_parent.play("default")
	bowl_full = false
	if too_much:
		await get_tree().create_timer(0.25).timeout
		weight = 0.0
		$".".frame = 0
		too_much = false

func _reset_bowl():
	if enough == true:
		weight = 0.0
		red_on = false
		yellow_on = false
		purple_on = false
		$".".frame = 0
		too_much = false
		bowl_full = false
		pulver_color = "null"

func _randomize_sounds(action: String):
	var path = "res://Assets/Sound Test/sfx_laboratory_foley_beakersetdown_var"
	var random = randi_range(1, 5) % 5
	if action == "release":
		match random:
			0:
				$Interact.stream = load(path + "1.mp3")
			1:
				$Interact.stream = load(path + "2.mp3")
			2:
				$Interact.stream = load(path + "3.mp3")
			3:
				$Interact.stream = load(path + "4.mp3")
			4:
				$Interact.stream = load(path + "5.mp3")
		$Interact.play()
