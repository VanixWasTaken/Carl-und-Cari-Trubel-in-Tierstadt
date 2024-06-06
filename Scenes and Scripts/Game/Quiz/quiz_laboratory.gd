extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_weiter_button_button_down():
	$"Frage 2".visible=true
	$"Frage 1".visible=false
#funktioniert noch nicht
