extends Control


@onready var l_bubble_node = preload("res://Scenes and Scripts/Dialog/Ground Structure/speech_bubble_left.tscn")
@onready var r_bubble_node = preload("res://Scenes and Scripts/Dialog/Ground Structure/speech_bubble_right.tscn")

var dialogs = 1
var dialog_side = ["left", "right"]
var finished = false
var same_speaker = false

var guido_path = "res://Assets/Sound/VO/Garden Center/Guido/vo_npc_guido_garden_groundtype_dialog_"

################################  PUT CHARACTER ICONS HERE  ###############################

var PRESET1 = preload("res://Assets/Art/Characters/Carl/Dialog Icon/carl_dialog.png")
var PRESET2 = preload("res://Assets/Art/Characters/Cari/Dialog Icon/cari_dialog.png")
var PRESET3 = preload("res://Assets/Art/Characters/Guido/Headshot/gardener_headshot.png")

##########################################################################################





func _ready():
	Global.pause_opened = true
	Global.moving_allowed = false
	Global.dialog_playing = true
###############################  PUT THE STARTING SIDE HERE  #############################
	add_right_dialog_box()
##########################################################################################







func _process(delta):
################################  PUT DIALOG NUMBER HERE  ################################
	if dialogs == 11:
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
		short_node_text.text = "Alles klar und wir müssen einfach nur den richtigen Boden zuweisen?"
		short_node_rect.texture = PRESET1
		short_node_name.text = "Carl"
		$"../VoiceOver".stream = load("res://Assets/Sound/VO/Garden Center/Carl/PC/vo_pc_carl_garden_groundtype_dialog_02.mp3")
		$"../VoiceOver".play()
		dialogs += 1
	
	elif dialogs == 10:
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
		short_node_text.text = "Sodele, da wären wir. Auf der linken Seite seht ihr, was wir für Pflanzen haben und auf der rechten die verschiedenen Bodentypen."
		short_node_rect.texture = PRESET3
		short_node_name.text = "Guido"
		$"../VoiceOver".stream = load(guido_path + "01.mp3")
		$"../VoiceOver".play()
		dialogs += 1
	
	elif dialogs == 3:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Ganz genau! Die Pflanzen sind sich alle ähnlich und benötigen alle denselben Bodentypen. "
		short_node_rect.texture = PRESET3
		short_node_name.text = "Guido"
		$"../VoiceOver".stream = load(guido_path + "03.mp3")
		$"../VoiceOver".play()
		dialogs += 1
		same_speaker = true

	elif dialogs == 4:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Die Bodentypen lassen sich in vier Kategorien einteilen. Sandboden, Schluffboden, Tonboden und Lehmboden."
		short_node_rect.texture = PRESET3
		short_node_name.text = "Guido"
		$"../VoiceOver".stream = load(guido_path + "04_var1.mp3")
		$"../VoiceOver".play()
		dialogs += 1

	elif dialogs == 5:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Jeder kommt mit eigenen Vor- und Nachteilen."
		short_node_rect.texture = PRESET3
		short_node_name.text = "Guido"
		$"../VoiceOver".stream = load(guido_path + "04_var2.mp3")
		$"../VoiceOver".play()
		dialogs += 1

	elif dialogs == 6:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Wie ich schon bei dem Pflanzomat 3000 gesagt habe, fühlen sich unterschiedliche Pflanzen in unterschiedlichen Klimas wohl."
		short_node_rect.texture = PRESET3
		short_node_name.text = "Guido"
		$"../VoiceOver".stream = load(guido_path + "05_var1.mp3")
		$"../VoiceOver".play()
		dialogs += 1

	elif dialogs == 7:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Dasselbe gilt auch für den Boden in dem sie wachsen."
		short_node_rect.texture = PRESET3
		short_node_name.text = "Guido"
		$"../VoiceOver".stream = load(guido_path + "05_var2.mp3")
		$"../VoiceOver".play()
		dialogs += 1

	elif dialogs == 8:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Bewegt einfach die Maus über die Bodentypen und Pflanzen für mehr Informationen."
		short_node_rect.texture = PRESET3
		short_node_name.text = "Guido"
		$"../VoiceOver".stream = load(guido_path + "06_var1.mp3")
		$"../VoiceOver".play()
		dialogs += 1
		

	elif dialogs == 9:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Wenn ihr denkt, dass ihr den richtigen Bodentypen habt, klickt diesen einfach an."
		short_node_rect.texture = PRESET3
		short_node_name.text = "Guido"
		$"../VoiceOver".stream = load(guido_path + "06_var2.mp3")
		$"../VoiceOver".play()
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


