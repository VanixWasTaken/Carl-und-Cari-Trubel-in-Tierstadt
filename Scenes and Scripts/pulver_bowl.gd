extends AnimatedSprite2D

var start_position
var mouse_on = false
var mouse_position
var weight = 0.0
var red_on = false
var yellow_on = false
var purple_on = false
# Called when the node enters the scene tree for the first time.
func _ready():
	start_position = position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$"../Scale/RichTextLabel".text = str(weight) + " g"
	if mouse_on:
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			mouse_position = get_global_mouse_position()
			position = mouse_position
			Global.mouse_full = true
		else:
			position = start_position



func _on_area_2d_mouse_entered():
	if Global.mouse_full == false:
		mouse_on = true

func _on_area_2d_mouse_exited():
	mouse_on = false
	Global.mouse_full = false


func _on_area_2d_area_entered(area):
	area.name = area.get_name()
	if area.name == "RedPulver":
		red_on = true
		red_pulver()
	if area.name == "YellowPulver":
		yellow_on = true
		yellow_pulver()
	if area.name == "PurplePulver":
		purple_on = true
		purple_pulver()

func red_pulver():
	if red_on == true:
		await get_tree().create_timer(0.2).timeout
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
	pass

func purple_pulver():
	if purple_on == true:
		await get_tree().create_timer(0.3).timeout
		weight += 0.05
		if weight == 0.05:
			$".".frame = 1
			print("A")
		elif weight >= 0.15 && weight <= 0.3:
			$".".frame = 2
			print("B")
		elif weight == 0.35:
			$".".frame = 3
			print("C")
		elif weight >= 0.5:
			$".".frame = 4
			print("D")
		purple_pulver()

func _on_area_2d_area_exited(area):
	red_on = false
	yellow_on = false
	purple_on = false
