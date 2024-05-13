extends Node2D

var start_balancing
var titration_finished = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$Knob.rotation_degrees = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if start_balancing:
		$"../PH-Scale/Arrow".position.y += randomize_degrees()
		
		if $Knob.rotation_degrees > 0:
			$Knob.rotation_degrees -= randf_range(1, 5)
		elif $Knob.rotation_degrees <= 0:
			$Knob.rotation_degrees = 0
		
		if Input.is_action_pressed("space"):
			$Knob.rotation_degrees += 10
		
		
		if $"../PH-Scale/Arrow".position.y >= -110 and $"../PH-Scale/Arrow".position.y <= 340:
			$"../PH-Scale/Arrow".position.y -= $Knob.rotation_degrees / 100
			if $"../PH-Scale/Arrow".position.y <= -110:
				$"../PH-Scale/Arrow".position.y = -110
			elif $"../PH-Scale/Arrow".position.y >= 340:
				$"../PH-Scale/Arrow".position.y = 340



func _on_titration_balancing_game():
	start_balancing = true

func randomize_degrees() -> float:
	return randf_range(1, 5)
