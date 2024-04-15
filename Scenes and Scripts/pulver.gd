extends AnimatedSprite2D

var start_position
var mouse_on = false
var mouse_position
@export var color: String
@export var minimum_weight: float
@export var maximum_weight: float
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


func _on_area_2d_mouse_entered():
	if Global.mouse_full == false:
		mouse_on = true

func _on_area_2d_mouse_exited():
	mouse_on = false
	Global.mouse_full = false

func _randomize_sounds(action: String):
	var random = randi_range(1, 2) % 2
	if action == "release":
		match random:
			0:
				$Interact.stream = load("res://Assets/Sound Test/sfx_laboratory_foley_beakersetdown_var1.mp3")
			1:
				$Interact.stream = load("res://Assets/Sound Test/sfx_laboratory_foley_beakersetdown_var2.mp3")
		$Interact.play()
