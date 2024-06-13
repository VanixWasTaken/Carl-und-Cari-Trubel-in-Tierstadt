extends Control


@onready var l_bubble_node = preload("res://Scenes and Scripts/Dialog/Ground Structure/speech_bubble_left.tscn")
@onready var r_bubble_node = preload("res://Scenes and Scripts/Dialog/Ground Structure/speech_bubble_right.tscn")

var dialogs = 1
var dialog_side = ["left", "right"]
var finished = false
var same_speaker = false

################################  PUT CHARACTER ICONS HERE  ###############################

var PRESET1
var PRESET2 = preload("res://Assets/Art/Characters/Chemical Chameleon/Headshot/chemist_headshot2.png")

var path

##########################################################################################





func _ready():
	Global.moving_allowed = false
	Global.dialog_playing = true
	if Global.character == "Carl":
		PRESET1 = preload("res://Assets/Art/Characters/Carl/Dialog Icon/carl_dialog.png")
		
		##### This is used to make the code for the dialog and voiceline combination easier
		##### This way you only have to only type the name of the line inside the 
		##### load function --> load(path + "linename_01_var2")
		path = "res://Assets/Sound/VO/Laboratory/Carl/PC/vo_pc_carl_laboratory_"
	elif Global.character == "Cari" or Global.character == "":
		PRESET1 = preload("res://Assets/Art/Characters/Cari/Dialog Icon/cari_dialog.png")
		
		##### Same as in previous comment
		path = "res://Assets/Sound/VO/Laboratory/Cari/PC/vo_pc_cari_laboratory_"
	
	if Global.talked_to_chameleon_4 == false:
		Global.laboratory_help_button_state = 8
###############################  PUT THE STARTING SIDE HERE  #############################
	add_right_dialog_box()
##########################################################################################







func _process(delta):
################################  PUT DIALOG NUMBER HERE  ################################
	if dialogs == 11:
		Global.moving_allowed = true
		Global.dialog_playing = false
		Global.talked_to_chameleon_4 = true
		queue_free()
##########################################################################################







func add_left_dialog_box():
	var node = l_bubble_node.instantiate()
	$".".add_child(node)
	dialog_side = "left"
##################################  WRITE DIALOG HERE  ###################################
	
	if dialogs == 2:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Wir haben es geschafft! High-Five."
		short_node_rect.texture = PRESET1
		short_node_name.text = Global.character
		$"../VoiceOver".stream = load(path + "dialog_5_2.mp3")
		$"../VoiceOver".play()
		dialogs += 1
		same_speaker = true

	elif dialogs == 3:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Ich kann kaum glauben, dass wir es geschafft haben. Bevor wir hierhergekommen sind wusste ich fast nichts über Chemie."
		short_node_rect.texture = PRESET1
		short_node_name.text = Global.character
		$"../VoiceOver".stream = load(path + "dialog_5_3.mp3")
		$"../VoiceOver".play()
		dialogs += 1
		same_speaker = false

	elif dialogs == 5:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Woran arbeitest du denn?"
		short_node_rect.texture = PRESET1
		short_node_name.text = Global.character
		$"../VoiceOver".stream = load(path + "dialog_5_5.mp3")
		$"../VoiceOver".play()
		dialogs += 1

	elif dialogs == 7:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Da bin ich jetzt doppelt gespannt!"
		short_node_rect.texture = PRESET1
		short_node_name.text = Global.character
		$"../VoiceOver".stream = load(path + "dialog_5_7.mp3")
		$"../VoiceOver".play()
		dialogs += 1
		same_speaker = true
	
	elif dialogs == 8:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Wir müssen jetzt aber langsam los, es gibt noch andere Leute, die unsere Hilfe brauchen."
		short_node_rect.texture = PRESET1
		short_node_name.text = Global.character
		$"../VoiceOver".stream = load(path + "dialog_5_8.mp3")
		$"../VoiceOver".play()
		dialogs += 1
		same_speaker = false
	
	
	elif dialogs == 10:
		dialogs += 1
	
	
	
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
		short_node_text.text = "Ihr habt es tatsächlich geschafft! Ich bin wieder sichtbar!"
		short_node_rect.texture = PRESET2
		short_node_name.text = "Christina"
		$"../VoiceOver".stream = load("res://Assets/Sound/VO/Laboratory/Chameleon/vo_npc_chameleon_laboratory_dialog_5_1.mp3")
		$"../VoiceOver".play()
		dialogs += 1
	
	elif dialogs == 4:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Noch einmal vielen, vielen Dank. Jetzt kann ich endlich weiter an den Vorbereitungen für das Stadtfest arbeiten."
		short_node_rect.texture = PRESET2
		short_node_name.text = "Christina"
		$"../VoiceOver".stream = load("res://Assets/Sound/VO/Laboratory/Chameleon/vo_npc_chameleon_laboratory_dialog_5_4.mp3")
		$"../VoiceOver".play()
		dialogs += 1


	elif dialogs == 6:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Das ist ein Geheimnis, aber ich verspreche euch, das wird euch aus den Socken hauen."
		short_node_rect.texture = PRESET2
		short_node_name.text = "Christina"
		$"../VoiceOver".stream = load("res://Assets/Sound/VO/Laboratory/Chameleon/vo_npc_chameleon_laboratory_dialog_5_6.mp3")
		$"../VoiceOver".play()
		dialogs += 1

	
	elif dialogs == 9:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Alles klar. Wir sehen uns dann später auf dem Stadtfest!"
		short_node_rect.texture = PRESET2
		short_node_name.text = "Christina"
		$"../VoiceOver".stream = load("res://Assets/Sound/VO/Laboratory/Chameleon/vo_npc_chameleon_laboratory_dialog_5_9.mp3")
		$"../VoiceOver".play()
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
