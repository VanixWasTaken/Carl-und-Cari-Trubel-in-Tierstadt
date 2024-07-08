extends TextureRect

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.menu_open = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_texture_button_button_up():
	get_tree().get_current_scene().reveal_changes()
	Global.menu_open = false
	Global.showed_profile_help = true
	queue_free()
