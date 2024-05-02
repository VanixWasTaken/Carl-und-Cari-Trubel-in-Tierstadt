extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.character == "Carl":
		$AnimatedSprite3D.play("Cari")
	elif Global.character == "Cari":
		$AnimatedSprite3D.play("Carl")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_body_entered(body):
	if body.get_name() == "Player":
		if get_tree().get_first_node_in_group("Root").got_key:
			
