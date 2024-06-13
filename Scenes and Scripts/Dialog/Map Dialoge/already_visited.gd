extends Control


@onready var l_bubble_node = preload("res://Scenes and Scripts/Dialog/Ground Structure/speech_bubble_left.tscn")
@onready var r_bubble_node = preload("res://Scenes and Scripts/Dialog/Ground Structure/speech_bubble_right.tscn")

var dialogs = 1
var dialog_side = ["left", "right"]
var finished = false
var same_speaker = false
var speaker
################################  PUT CHARACTER ICONS HERE  ###############################

var PRESET1
var PRESET2 = preload("res://Assets/Art/Characters/Chemical Chameleon/Headshot/chemist_headshot1.png")

var path

##########################################################################################





func _ready():
	Global.moving_allowed = false
	Global.dialog_playing = true
	if Global.character == "Cari":
		PRESET1 = preload("res://Assets/Art/Characters/Carl/Dialog Icon/carl_dialog.png")
		speaker = "Carl"
		##### This is used to make the code for the dialog and voiceline combination easier
		##### This way you only have to only type the name of the line inside the 
		##### load function --> load(path + "linename_01_var2")
		#path = "res://Assets/Sound/VO/Laboratory/Cari/PC/vo_pc_carl_laboratory_"
	elif Global.character == "Carl" or Global.character == "":
		PRESET1 = preload("res://Assets/Art/Characters/Cari/Dialog Icon/cari_dialog.png")
		speaker = "Cari"
		##### Same as in previous comment
		#path = "res://Assets/Sound/VO/Laboratory/Carl/PC/vo_pc_cari_laboratory_"
	
###############################  PUT THE STARTING SIDE HERE  #############################
	add_right_dialog_box()
##########################################################################################







func _process(delta):
################################  PUT DIALOG NUMBER HERE  ################################
	if dialogs == 4:
		Global.moving_allowed = true
		Global.dialog_playing = false
		queue_free()
##########################################################################################







func add_left_dialog_box():
	var node = l_bubble_node.instantiate()
	$".".add_child(node)
	dialog_side = "left"
##################################  WRITE DIALOG HERE  ###################################
	
	if dialogs == 3:
		dialogs += 1
		Global.moving_allowed = true
##########################################################################################








func add_right_dialog_box():
	var node = r_bubble_node.instantiate()
	$".".add_child(node)
	dialog_side = "right"
##################################  WRITE DIALOG HERE  ###################################


	if dialogs == 1:
		var short_node = get_child(1)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Hier haben wir schon alles erledigt."
		short_node_rect.texture = PRESET1
		short_node_name.text = speaker
		#$"../VoiceOver".stream = load(path + "dialog_before_titra_3.mp3")
		#$"../VoiceOver".play()
		dialogs += 1
		same_speaker = true

	elif dialogs == 2:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Wir sollten uns bei einem anderen Beruf umschauen, ob wir da noch helfen können."
		short_node_rect.texture = PRESET1
		short_node_name.text = speaker
		#$"../VoiceOver".stream = load("res://Assets/Sound/VO/Laboratory/Chameleon/vo_npc_chameleon_laboratory_dialog_before_titra_4.mp3")
		#$"../VoiceOver".play()
		dialogs += 1
		same_speaker = false

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
