extends Control
signal HelpOpened
signal HelpClosed
var helpbuttonopen = false
var menu_open = false
var mouse_inside = false
@onready var outline_shader = preload("res://Shader/outline.tres")
@onready var no_shader = preload("res://Shader/no_shader.tres")


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.character == "Carl":
		$TextureButton.texture_normal = load("res://Assets/Test/button_help_cari.png")
		$TextureButton.texture_pressed = load("res://Assets/Test/button_help_cari.png")
		$TextureButton.texture_hover = load("res://Assets/Test/button_help_cari.png")
	elif Global.character == "Cari":
		$TextureButton.texture_normal = load("res://Assets/Test/button_help.png.PNG")
		$TextureButton.texture_pressed = load("res://Assets/Test/button_help.png.PNG")
		$TextureButton.texture_hover = load("res://Assets/Test/button_help.png.PNG")
	
func _process(delta):
	if menu_open || mouse_inside:
		Global.moving_allowed = false
	elif !mouse_inside && !menu_open:
		Global.moving_allowed = true
# Called every frame. 'delta' is the elapsed time since the previous frame.


func _on_texture_button_button_up():
	menu_open = true
	if !helpbuttonopen and Global.character == "Cari":
		emit_signal("HelpOpened")
		$TextureButton.texture_normal = load("res://Assets/Test/button_help_gray.png")
		$TextureButton.disabled = true
		await get_tree().create_timer(7).timeout
		emit_signal("HelpClosed")
		menu_open = false
		$TextureButton.disabled = false
		$TextureButton.texture_normal = load("res://Assets/Test/button_help.png.PNG")
	elif !helpbuttonopen and Global.character == "Carl":
		emit_signal("HelpOpened")
		$TextureButton.texture_normal = load("res://Assets/Test/button_help_cari_grey.png")
		$TextureButton.disabled = true
		await get_tree().create_timer(7).timeout
		emit_signal("HelpClosed")
		menu_open = false
		$TextureButton.disabled = false
		$TextureButton.texture_normal = load("res://Assets/Test/button_help_cari.png")


func _on_texture_button_mouse_entered():
	$TextureButton.material = outline_shader
	Global.moving_allowed = false
	mouse_inside = true


func _on_texture_button_mouse_exited():
	$TextureButton.material = no_shader
	mouse_inside = false
