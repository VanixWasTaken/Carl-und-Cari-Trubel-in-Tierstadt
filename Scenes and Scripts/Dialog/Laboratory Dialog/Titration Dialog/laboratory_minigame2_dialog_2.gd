extends Control


@onready var l_bubble_node = preload("res://Scenes and Scripts/Dialog/Ground Structure/speech_bubble_left.tscn")
@onready var r_bubble_node = preload("res://Scenes and Scripts/Dialog/Ground Structure/speech_bubble_right.tscn")

var dialogs = 1
var dialog_side = ["left", "right"]
var finished = false
var same_speaker = false

################################  PUT CHARACTER ICONS HERE  ###############################

var PRESET1 = preload("res://Assets/Art/Characters/Carl/Dialog Icon/carl_dialog.png")
var PRESET2 = preload("res://Assets/Art/Characters/Chemical Chameleon/Headshot/chemist_headshot1.png")

var vo_pc
##########################################################################################





func _ready():
	if Global.character == "Carl":
		PRESET1 = preload("res://Assets/Art/Characters/Carl/Dialog Icon/carl_dialog.png")
		vo_pc = "carl"
	elif Global.character == "Cari" or Global.character == "":
		PRESET1 = preload("res://Assets/Art/Characters/Cari/Dialog Icon/cari_dialog.png")
		vo_pc = "cari"
	
	Global.moving_allowed = false
	Global.dialog_playing = true
###############################  PUT THE STARTING SIDE HERE  #############################
	add_right_dialog_box()
##########################################################################################







func _process(delta):
################################  PUT DIALOG NUMBER HERE  ################################
	if dialogs == 8:
		Global.moving_allowed = true
		Global.dialog_playing = false
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
		short_node_text.text = "Okay, wie mache ich das?"
		short_node_rect.texture = PRESET1
		short_node_name.text = Global.character
		dialogs += 1
	
	
	elif dialogs == 6:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Okay, dann legen wir mal los!"
		short_node_rect.texture = PRESET1
		short_node_name.text = Global.character
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
		short_node_text.text = "Okay, jetzt w-w-wirds spannend, wir müssen dafür sorgen dass der pH-Wert im Bereich z-z-zwischen 5 bis 7 bleibt."
		short_node_rect.texture = PRESET2
		short_node_name.text = "Christina"
		$"../VoiceOver".stream = load("res://Assets/Sound/VO/Laboratory/Chameleon/vo_npc_chameleon_laboratory_titration_02_01.mp3")
		$"../VoiceOver".play()
		dialogs += 1
	
	elif dialogs == 3:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Hier r-r-rechts ist die Skala des pH-Werts, diese sollte im Bereich zwischen 5 und 7 bleiben."
		short_node_rect.texture = PRESET2
		short_node_name.text = "Christina"
		$"../VoiceOver".stream = load("res://Assets/Sound/VO/Laboratory/Chameleon/vo_npc_chameleon_laboratory_titration_02_03.mp3")
		$"../VoiceOver".play()
		dialogs += 1
		same_speaker = true
	
	elif dialogs == 4:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Über die Leiste in der M-M-Mitte kannst du kontrollieren ob du Flüssigkeit zugibst oder n-n-nicht."
		short_node_rect.texture = PRESET2
		short_node_name.text = "Christina"
		$"../VoiceOver".stream = load("res://Assets/Sound/VO/Laboratory/Chameleon/vo_npc_chameleon_laboratory_titration_02_04.mp3")
		$"../VoiceOver".play()
		dialogs += 1
	
	elif dialogs == 5:
		Global.mini_help_button_state += 1
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "[Drücke Leertaste wenn der Pfeil im grünen Bereich ist, um den pH-Wert zu kontrollieren.]"
		short_node_rect.texture = PRESET2
		short_node_name.text = "Christina"
		###### wird nicht vertont, deswegen erstmal keine voiceline ######
		#$VoiceOver.stream = load("res://Assets/Sound/VO/Laboratory/Chameleon/vo_npc_chameleon_laboratory_titration_02_05.mp3")
		#$VoiceOver.play()
		dialogs += 1
		same_speaker = false
		
	
	elif dialogs == 7:
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
