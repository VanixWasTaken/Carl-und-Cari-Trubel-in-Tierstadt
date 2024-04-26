extends Node3D



func _process(delta):
	if $Player.position.x <= 19.5 and $Player.position.x >= -19.5:
		$Camera3D.position.x = $Player.position.x

