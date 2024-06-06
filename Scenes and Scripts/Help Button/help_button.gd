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
var mini_help = preload("res://Scenes and Scripts/Dialog/Laboratory Dialog/mini_help.tscn")
var help
# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.character == "Carl":
		$TextureButton.texture_normal = load("res://Assets/Art/UI/Buttons/HelpButton/button_help_cari.png")
		$TextureButton.texture_pressed = load("res://Assets/Art/UI/Buttons/HelpButton/button_help_cari_click.png")
		$TextureButton.texture_hover = load("res://Assets/Art/UI/Buttons/HelpButton/button_help_cari_hover_outline.png")
	elif Global.character == "Cari":
		$TextureButton.texture_normal = load("res://Assets/Art/UI/Buttons/HelpButton/button_help_carl.png")
		$TextureButton.texture_pressed = load("res://Assets/Art/UI/Buttons/HelpButton/button_help_carl_click.png")
		$TextureButton.texture_hover = load("res://Assets/Art/UI/Buttons/HelpButton/button_help_carl_hover_outline.png")
func _process(delta):
	if Global.mouse_in_button || Global.menu_open || menu_open || mouse_inside || Global.dialog_playing || Global.cutscene_playing:
		Global.moving_allowed = false
	elif !mouse_inside && !Global.dialog_playing && !Global.cutscene_playing && !Global.mouse_in_button && !Global.menu_open:
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
		var instance = mini_help.instantiate()
		add_child(instance)
		help = mini_help
	elif get_tree().get_current_scene().get_name() == "Titration" :
		var instance = mini_help.instantiate()
		add_child(instance)
		help = mini_help
	elif get_tree().get_current_scene().get_name() == "SprayMiniGame" :
		var instance = mini_help.instantiate()
		add_child(instance)
		help = mini_help
	if !helpbuttonopen and Global.character == "Cari":
		emit_signal("HelpOpened")
		$TextureButton.texture_normal = load("res://Assets/Art/UI/Buttons/HelpButton/button_help_carl_click.png")
		$TextureButton.disabled = true
		if get_tree().get_current_scene().get_name() == "Map":
			$TextureButton.texture_normal = load("res://Assets/Art/UI/Buttons/HelpButton/button_help_carl.png")
			await get_tree().create_timer(0.1).timeout
			menu_open = false
			await get_tree().create_timer(7).timeout
			emit_signal("HelpClosed")
			$TextureButton.disabled = false
			$TextureButton.texture_normal = load("res://Assets/Art/UI/Buttons/HelpButton/button_help_carl.png")
		else: 
			$TextureButton.texture_normal = load("res://Assets/Art/UI/Buttons/HelpButton/button_help_carl.png")
			await get_tree().create_timer(0.1).timeout
			emit_signal("HelpClosed")
			menu_open = false
			$TextureButton.disabled = false
			$TextureButton.texture_normal = load("res://Assets/Art/UI/Buttons/HelpButton/button_help_carl.png")
	
	
	
	elif !helpbuttonopen and Global.character == "Carl":
		emit_signal("HelpOpened")
		$TextureButton.texture_normal = load("res://Assets/Art/UI/Buttons/button_help_cari_grey.png")
		$TextureButton.disabled = true
		if get_tree().get_current_scene().get_name() == "Map":
			$TextureButton.texture_normal = load("res://Assets/Art/UI/Buttons/HelpButton/button_help_cari_click.png")
			await get_tree().create_timer(0.1).timeout
			menu_open = false
			await get_tree().create_timer(7).timeout
			emit_signal("HelpClosed")
			$TextureButton.disabled = false
			$TextureButton.texture_normal = load("res://Assets/Art/UI/Buttons/HelpButton/button_help_cari_click.png")
		else:
			$TextureButton.texture_normal = load("res://Assets/Art/UI/Buttons/HelpButton/button_help_cari_click.png")
			await get_tree().create_timer(0.1).timeout
			emit_signal("HelpClosed")
			menu_open = false
			$TextureButton.disabled = false
			$TextureButton.texture_normal = load("res://Assets/Art/UI/Buttons/HelpButton/button_help_cari.png")


func _on_texture_button_mouse_entered():
	Global.moving_allowed = false
	mouse_inside = true


func _on_texture_button_mouse_exited():
	mouse_inside = false
	Global.moving_allowed = true
