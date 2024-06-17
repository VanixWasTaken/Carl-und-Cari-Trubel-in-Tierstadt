extends TextureRect

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.menu_open = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_texture_button_button_up():
	Global.menu_open = false
	var camera = get_tree().get_first_node_in_group("Camera")
	get_tree().get_first_node_in_group("Player").remove_child(camera)
	get_tree().get_current_scene().add_child(camera)
	camera.global_position = Vector2(1576,1248)
	get_tree().get_first_node_in_group("MarketAnimation").play("cloud_reveal")
	Global.cutscene_playing = true
	queue_free()
