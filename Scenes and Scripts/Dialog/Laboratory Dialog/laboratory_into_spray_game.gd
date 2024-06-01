extends Control


@onready var l_bubble_node = preload("res://Scenes and Scripts/Dialog/Ground Structure/speech_bubble_left.tscn")
@onready var r_bubble_node = preload("res://Scenes and Scripts/Dialog/Ground Structure/speech_bubble_right.tscn")

var dialogs = 1
var dialog_side = ["left", "right"]
var finished = false
var same_speaker = false

################################  PUT CHARACTER ICONS HERE  ###############################

var PRESET1
var PRESET2 = preload("res://Assets/Art/Characters/Chemical Chameleon/Headshot/chemist_headshot1.png")

var vo_pc

##########################################################################################





func _ready():
	Global.moving_allowed = false
	Global.dialog_playing = true
	if Global.character == "Carl":
		PRESET1 = preload("res://Assets/Art/Characters/Carl/Dialog Icon/carl_dialog.png")
		vo_pc = "carl"
	elif Global.character == "Cari" or Global.character == "":
		PRESET1 = preload("res://Assets/Art/Characters/Cari/Dialog Icon/cari_dialog.png")
		vo_pc = "cari"
###############################  PUT THE STARTING SIDE HERE  #############################
	add_left_dialog_box()
##########################################################################################







func _process(delta):
################################  PUT DIALOG NUMBER HERE  ################################
	if dialogs == 6:
		Global.moving_allowed = true
		Global.dialog_playing = false
		get_tree().change_scene_to_file("res://Scenes and Scripts/Game/Laboratory/Spray Mini Game/spray_mini_game.tscn")
##########################################################################################







func add_left_dialog_box():
	var node = l_bubble_node.instantiate()
	$".".add_child(node)
	dialog_side = "left"
##################################  WRITE DIALOG HERE  ###################################
	
	if dialogs == 1:
		var short_node = get_child(1)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Ist alles klar da drinnen?"
		short_node_rect.texture = PRESET1
		short_node_name.text = Global.character
		dialogs += 1
	
	elif dialogs == 3:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Ja. Total bereit, was ist unsere Aufgabe?"
		short_node_rect.texture = PRESET1
		short_node_name.text = Global.character
		dialogs += 1
	

	elif dialogs == 5:
		dialogs += 1
		Global.moving_allowed = true
##########################################################################################








func add_right_dialog_box():
	var node = r_bubble_node.instantiate()
	$".".add_child(node)
	dialog_side = "right"
##################################  WRITE DIALOG HERE  ###################################


	if dialogs == 2:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "J-J-Ja mir geht es gut. Seid ihr b-b-bereit loszulegen?"
		short_node_rect.texture = PRESET2
		short_node_name.text = "Christina"
		$VoiceOver.stream = load("res://Assets/Sound/VO/Laboratory/Chameleon/vo_npc_chameleon_laboratory_dialog_before_spray_2.mp3")
		$VoiceOver.play()
		dialogs += 1

	elif dialogs == 4:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "D-D-Das erkläre ich dir, wenn d-d-du die Hände in die Handschuhe g-g-gesteckt hast."
		short_node_rect.texture = PRESET2
		short_node_name.text = "Christina"
		$VoiceOver.stream = load("res://Assets/Sound/VO/Laboratory/Chameleon/vo_npc_chameleon_laboratory_dialog_before_spray_4.mp3")
		$VoiceOver.play()
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
