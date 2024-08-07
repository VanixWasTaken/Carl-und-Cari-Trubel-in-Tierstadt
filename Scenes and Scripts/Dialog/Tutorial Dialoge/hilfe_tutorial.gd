extends Control


@onready var l_bubble_node = preload("res://Scenes and Scripts/Dialog/Ground Structure/speech_bubble_left.tscn")
@onready var r_bubble_node = preload("res://Scenes and Scripts/Dialog/Ground Structure/speech_bubble_right.tscn")

var dialogs = 1
var dialog_side = ["left", "right"]
var finished = false
var same_speaker = false

################################  PUT CHARACTER ICONS HERE  ###############################

var PRESET1 = preload("res://Assets/Art/Characters/Carl/Dialog Icon/carl_dialog.png")
var PRESET2 = preload("res://Assets/Art/Characters/Cari/Dialog Icon/cari_dialog.png")

##########################################################################################






func _ready():
	Global.moving_allowed = false
	Global.dialog_playing = true
###############################  PUT THE STARTING SIDE HERE  #############################
	add_left_dialog_box()
##########################################################################################







func _process(delta):
################################  PUT DIALOG NUMBER HERE  ################################
	if dialogs == 3:
		$"../Voice Over".stop()
		Global.dialog_playing = false
		queue_free()
##########################################################################################







func add_left_dialog_box():
	var node = l_bubble_node.instantiate()
	$".".add_child(node)
	dialog_side = "left"
##################################  WRITE DIALOG HERE  ###################################
	
	if dialogs == 1 and Global.tutorial_help_button_state == 0:
		var short_node = get_child(1)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		if Global.character == "Carl":
			short_node_text.text = "Hilf Carl dabei, seine Schlüssel wieder zu finden."
			short_node_rect.texture = PRESET2
			short_node_name.text = "Cari"
			$"../Voice Over".stream = load("res://Assets/Sound/VO/Tutorial/Help/vo_npc_cari_tutorialhelp01_var1.mp3")
			$"../Voice Over".play()
			dialogs += 1
		elif Global.character == "Cari":
			short_node_text.text = "Hilf Cari dabei, ihre Schlüssel wieder zu finden."
			short_node_rect.texture = PRESET1
			short_node_name.text = "Carl"
			$"../Voice Over".stream = load("res://Assets/Sound/VO/Tutorial/Help/vo_npc_carl_tutorialhelp01_var1.mp3")
			$"../Voice Over".play()
			dialogs += 1

	if dialogs == 1 and Global.tutorial_help_button_state == 1:
		var short_node = get_child(1)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		if Global.character == "Carl":
			short_node_text.text = "Verlasse das Haus."
			short_node_rect.texture = PRESET2
			short_node_name.text = "Cari"
			$"../Voice Over".stream = load("res://Assets/Sound/VO/Tutorial/Help/vo_npc_cari_tutorialhelp02_var1.mp3")
			$"../Voice Over".play()
			dialogs += 1
		elif Global.character == "Cari":
			short_node_text.text = "Verlasse das Haus."
			short_node_rect.texture = PRESET1
			short_node_name.text = "Carl"
			$"../Voice Over".stream = load("res://Assets/Sound/VO/Tutorial/Help/vo_npc_carl_tutorialhelp02_var1.mp3")
			$"../Voice Over".play()
			dialogs += 1
##########################################################################################








func add_right_dialog_box():
	var node = r_bubble_node.instantiate()
	$".".add_child(node)
	dialog_side = "right"
##################################  WRITE DIALOG HERE  ###################################
	if dialogs == 2:
		dialogs += 1
##########################################################################################










func _on_skip_button_pressed():
	var short_node = get_child(1)
	$SkipButton.visible = false
	short_node.queue_free()
	if dialog_side == "left" and !finished and same_speaker:
		add_left_dialog_box()
	elif dialog_side == "left" and !finished:
		add_right_dialog_box()
	elif dialog_side == "right" and !finished and same_speaker:
		add_right_dialog_box()
	elif dialog_side == "right" and !finished:
		add_left_dialog_box()
	await get_tree().create_timer(1).timeout
	$SkipButton.visible = true



func _on_skip_button_timer_timeout():
	$SkipButton.visible = true

func _on_skip_button_mouse_entered():
	$"../Hover".play()

func _on_skip_button_button_down():
	$"../Click".play()
