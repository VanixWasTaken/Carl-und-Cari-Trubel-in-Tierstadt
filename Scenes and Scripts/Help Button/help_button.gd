extends Control
signal HelpOpened
signal HelpClosed
var helpbuttonopen = false
@onready var outline_shader = preload("res://Shader/outline.tres")
@onready var no_shader = preload("res://Shader/no_shader.tres")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_texture_button_button_up():
	if !helpbuttonopen:
		emit_signal("HelpOpened")
		await get_tree().create_timer(7).timeout
		emit_signal("HelpClosed")
		#helpbuttonopen = true
	#elif helpbuttonopen:
		#emit_signal("HelpClosed")
		#helpbuttonopen = false
	
func _on_texture_button_mouse_entered():
	$TextureButton.material = outline_shader


func _on_texture_button_mouse_exited():
	$TextureButton.material = no_shader


