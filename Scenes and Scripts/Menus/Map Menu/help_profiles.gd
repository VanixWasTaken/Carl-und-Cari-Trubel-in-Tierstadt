extends TextureRect


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.menu_open = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_texture_button_button_up():
	Global.menu_open = false
	$".".queue_free()
