extends Node2D

var start_skillcheck = false
var arrow_in_bar = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if start_skillcheck == true:
		$Arrow/AnimationPlayer.play("movement")
		
		if Input.is_action_just_pressed("space") and arrow_in_bar:
			print("penis")




func _on_titration_balancing_game():
	start_skillcheck = true


func _on_bar_area_entered(area):
	if area.get_name() == "Arrow":
		arrow_in_bar = true
		print(arrow_in_bar)


func _on_bar_area_exited(area):
	if area.get_name() == "Arrow":
		arrow_in_bar = false
		print(arrow_in_bar)
