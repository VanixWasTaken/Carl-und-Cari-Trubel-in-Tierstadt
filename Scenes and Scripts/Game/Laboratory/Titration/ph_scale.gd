extends Node2D

signal stop_game

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Arrow.position.y >= 83 and $Arrow.position.y <= 183:
		$WinCondition.start()
	else:
		$WinCondition.stop()




func _on_win_condition_timeout():
	emit_signal("stop_game")
	print("game won wahoo yagoobie")
