extends AnimatedSprite2D

var water_in_1 = false
var water_in_2 = false
var water_in_3 = false
var pulver_in_1 = false
var pulver_in_2 = false
var pulver_in_3 = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_area_entered(area):
	var area_name
	area_name = area.get_name()
	if area_name.contains("WaterCup"):
		if water_in_1 == false && pulver_in_1 == false:
			$".".frame = 1
			water_in_1 = true
		elif water_in_2 == false && pulver_in_1 == true:
			$".".frame = 3
			water_in_2 = true
		elif water_in_3 == false && pulver_in_2 == true:
			$".".frame = 5
			water_in_3 = true
	if area_name.contains("PulverBowl"):
		if water_in_1 == true && pulver_in_1 == false:
			$".".frame = 2
			pulver_in_1 = true
		elif water_in_2 == true && pulver_in_2 == false:
			$".".frame = 4
			pulver_in_2 = true
		elif water_in_3 == true && pulver_in_3 == false:
			$".".frame = 6
			pulver_in_3 = true
