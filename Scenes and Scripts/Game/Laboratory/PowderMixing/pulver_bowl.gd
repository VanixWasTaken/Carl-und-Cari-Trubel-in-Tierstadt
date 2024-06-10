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
var area_node
var right_powder = false
var powder_on = false
var powder_sprite
var got_place = false
var follow_mouse
var powder_drag
var glass_position
var too_much_dialog = preload("res://Scenes and Scripts/Dialog/Laboratory Dialog/Powder Dialog/powder_dialog_too_much.tscn")
var enough_dialog = preload("res://Scenes and Scripts/Dialog/Laboratory Dialog/Powder Dialog/powder_dialog_enough.tscn")
var wrong_pulver_dialog = preload("res://Scenes and Scripts/Dialog/Laboratory Dialog/Powder Dialog/powder_dialog_wrong_pulver.tscn")
var finished_bowl = false
var too_little_dialog = preload("res://Scenes and Scripts/Dialog/Laboratory Dialog/Powder Dialog/powder_dialog_too_little.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	powder_drag = $PulverBowl/Dragging
	start_position = position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	needed_pulver = $"../DrinkHolder".needed_color
	$"../Scale/RichTextLabel".text = str(weight) + " g"
	if Input.is_action_just_pressed("left_click") && mouse_on && !finished_bowl && !Global.dialog_playing:
		follow_mouse = true
	if follow_mouse:
		mouse_position = get_global_mouse_position()
		global_position = mouse_position
		Global.mouse_full = true
	if Input.is_action_just_released("left_click"):
		if follow_mouse:
			follow_mouse = false
			global_position = start_position
			$Interact.play()
			%PulverPour.stop()
	if powder_on:
		powder_place()
func powder_place():
	if !got_place:
		got_place = true
		area_node.remove_child(powder_sprite)
		get_tree().get_current_scene().add_child(powder_sprite)
		powder_sprite.global_position = $"../Marker2D".global_position


func _on_area_2d_mouse_entered():
	if Global.mouse_full == false:
		$"../Hover".play()
		mouse_on = true
		Global.mouse_full = true

func _on_area_2d_mouse_exited():
	mouse_on = false
	Global.mouse_full = false


func _on_area_2d_area_entered(area):
	area_name = area.get_name()
	if area_name != "PulverBowl":
		if needed_pulver ==  area.color:
			area_node = area
			right_powder = true
			%PulverPour.play()
			powder_sprite = area.get_children()[1]
			powder_on = true
			if bowl_full == false || pulver_color == "Red":
				if area.name == "RedPulver":
					powder_sprite.play("new_animation")
					red_on = true
					red_pulver()
					pulver_color = "Red"
			if bowl_full == false || pulver_color == "Yellow":
				if area.name == "YellowPulver":
					powder_sprite.play("new_animation")
					yellow_on = true
					yellow_pulver()
					pulver_color = "Yellow"
			if bowl_full == false || pulver_color == "Purple":
				if area.name == "PurplePulver":
					powder_sprite.play("new_animation")
					purple_on = true
					purple_pulver()
					pulver_color = "Purple"
			bowl_full = true
		elif needed_pulver != area.color:
			right_powder = false

func red_pulver():
	if $"../DrinkHolder".powder_just_in == true:
		$"../DrinkHolder".powder_just_in = false
		if !$"../DrinkHolder".new_water:
			$"../DrinkHolder".water_in_current = false
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
	if $"../DrinkHolder".powder_just_in == true:
		$"../DrinkHolder".powder_just_in = false
		if !$"../DrinkHolder".new_water:
			$"../DrinkHolder".water_in_current = false
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
	if $"../DrinkHolder".powder_just_in == true:
		$"../DrinkHolder".powder_just_in = false
		if !$"../DrinkHolder".new_water:
			$"../DrinkHolder".water_in_current = false
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
	var dialog_instance
	area_name = area.get_name()
	if area_name != "PulverBowl" && area_name != "WaterCup":
		if right_powder:
			if weight < area_node.minimum_weight:
				too_little = true
				enough = false
				dialog_instance = too_little_dialog.instantiate()
				get_tree().get_current_scene().add_child(dialog_instance)
			elif weight >= area_node.minimum_weight && weight <= area_node.maximum_weight:
				too_little = false
				enough = true
				dialog_instance = enough_dialog.instantiate()
				get_tree().get_current_scene().add_child(dialog_instance)
			elif weight > area_node.maximum_weight:
				enough = false
				too_much = true
				dialog_instance = too_much_dialog.instantiate()
				get_tree().get_current_scene().add_child(dialog_instance)
				weight = 0.0
				$".".frame = 0
		elif !right_powder:
			dialog_instance = wrong_pulver_dialog.instantiate()
			get_tree().get_current_scene().add_child(dialog_instance)
	powder_on = false

	red_on = false
	yellow_on = false
	purple_on = false
	if area_name != "PulverBowl":
		if powder_sprite != null:
			powder_sprite.play("default")
			get_tree().get_current_scene().remove_child(powder_sprite)
			area.add_child(powder_sprite)
			powder_sprite.position = area.glass_position
			got_place = false
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
		global_position = start_position


func _input(event):
	if event is InputEventMouseMotion:
		var velocity = event.get_velocity()
		if velocity > Vector2(100, 100) and !powder_drag.playing and follow_mouse:
			powder_drag.play()
