extends AnimatedSprite2D

var start_position
var mouse_on = false
var mouse_position
# Called when the node enters the scene tree for the first time.
func _ready():
	start_position = position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if mouse_on:
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			mouse_position = get_global_mouse_position()
			position = mouse_position
			Global.mouse_full = true
		elif Input.is_action_just_released("left_click"):
			position = start_position
			_randomize_sounds("release")
			%PouringWater.stop()


func _on_area_2d_mouse_entered():
	if Global.mouse_full == false:
		mouse_on = true
		

func _on_area_2d_mouse_exited():
	mouse_on = false
	Global.mouse_full = false

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
