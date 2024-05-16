extends Control
signal HelpOpened
signal HelpClosed
var helpbuttonopen = false
var menu_open = false
var mouse_inside = false
@onready var outline_shader = preload("res://Shader/outline.tres")
@onready var no_shader = preload("res://Shader/no_shader.tres")
var tutorial_help = preload("res://Scenes and Scripts/Dialog/Tutorial Dialoge/hilfe_tutorial.tscn")
var laboratory_help = preload("res://Scenes and Scripts/Dialog/Laboratory Dialog/help_laboratory.tscn")
var mixing_help = preload("res://Scenes and Scripts/Game/Laboratory/PowderMixing/mini1_help.tscn")
var help
# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.character == "Carl":
		$TextureButton.texture_normal = load("res://Assets/Art/UI/Buttons/button_help_cari.png")
		$TextureButton.texture_pressed = load("res://Assets/Art/UI/Buttons/button_help_cari.png")
		$TextureButton.texture_hover = load("res://Assets/Art/UI/Buttons/button_help_cari.png")
	elif Global.character == "Cari":
		$TextureButton.texture_normal = load("res://Assets/Art/UI/Buttons/button_help.png.PNG")
		$TextureButton.texture_pressed = load("res://Assets/Art/UI/Buttons/button_help.png.PNG")
		$TextureButton.texture_hover = load("res://Assets/Art/UI/Buttons/button_help.png.PNG")
func _process(delta):
	if menu_open || mouse_inside || Global.dialog_playing || Global.cutscene_playing:
		Global.moving_allowed = false
	elif !mouse_inside && !Global.dialog_playing && !Global.cutscene_playing:
		Global.moving_allowed = true
# Called every frame. 'delta' is the elapsed time since the previous frame.


func _on_texture_button_button_up():
	
	menu_open = true
	if get_tree().get_current_scene().get_name() == "Main":
		var instance = tutorial_help.instantiate()
		add_child(instance)
		help = tutorial_help
	elif get_tree().get_current_scene().get_name() == "Laboratory" :
		var instance = laboratory_help.instantiate()
		add_child(instance)
		help = laboratory_help
	elif get_tree().get_current_scene().get_name() == "ChemicalLaboratory" :
		var instance = mixing_help.instantiate()
		add_child(instance)
		help = mixing_help
	if !helpbuttonopen and Global.character == "Cari":
		emit_signal("HelpOpened")
		$TextureButton.texture_normal = load("res://Assets/Art/UI/Buttons/button_help_gray.png")
		$TextureButton.disabled = true
		if get_tree().get_current_scene().get_name() == "Map":
			await get_tree().create_timer(0.1).timeout
			menu_open = false
			await get_tree().create_timer(7).timeout
			emit_signal("HelpClosed")
			$TextureButton.disabled = false
			$TextureButton.texture_normal = load("res://Assets/Art/UI/Buttons/button_help.png.PNG")
		else: 
			await get_tree().create_timer(0.1).timeout
			emit_signal("HelpClosed")
			menu_open = false
			$TextureButton.disabled = false
			$TextureButton.texture_normal = load("res://Assets/Art/UI/Buttons/button_help.png.PNG")
	
	
	
	elif !helpbuttonopen and Global.character == "Carl":
		emit_signal("HelpOpened")
		$TextureButton.texture_normal = load("res://Assets/Art/UI/Buttons/button_help_cari_grey.png")
		$TextureButton.disabled = true
		if get_tree().get_current_scene().get_name() == "Map":
			await get_tree().create_timer(0.1).timeout
			menu_open = false
			await get_tree().create_timer(7).timeout
			emit_signal("HelpClosed")
			$TextureButton.disabled = false
			$TextureButton.texture_normal = load("res://Assets/Art/UI/Buttons/button_help_cari.png")
		else:
			await get_tree().create_timer(0.1).timeout
			emit_signal("HelpClosed")
			menu_open = false
			$TextureButton.disabled = false
			$TextureButton.texture_normal = load("res://Assets/Art/UI/Buttons/button_help_cari.png")


func _on_texture_button_mouse_entered():
	if $TextureButton.disabled == false:
		$TextureButton.material = outline_shader
	
	Global.moving_allowed = false
	mouse_inside = true


func _on_texture_button_mouse_exited():
	$TextureButton.material = no_shader
	mouse_inside = false
