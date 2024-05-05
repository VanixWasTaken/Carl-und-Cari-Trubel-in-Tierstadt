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


