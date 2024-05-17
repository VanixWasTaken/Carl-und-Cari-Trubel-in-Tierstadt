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
	if dialogs == 14:
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
		short_node_text.text = "Was genau ist denn eine Titration?"
		short_node_rect.texture = PRESET1
		short_node_name.text = Global.character
		dialogs += 1
	
	elif dialogs == 5:
		Global.mini_help_button_state += 1
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Was ist denn der pH-Wert?"
		short_node_rect.texture = PRESET1
		short_node_name.text = Global.character
		dialogs += 1
	
	elif dialogs == 8:
		Global.mini_help_button_state += 1
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Was bedeutet sauer und basisch?"
		short_node_rect.texture = PRESET1
		short_node_name.text = Global.character
		dialogs += 1

	elif dialogs == 12:
		Global.mini_help_button_state += 1
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Alles klar! Ich füll jetzt erstmal die Reagenzgläser in das große Gefäß."
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
		short_node_text.text = "An dieser Station m-m-machen wir Titration. Dafür müsst ihr zuerst einmal den I-I-Inhalt der Reagenzgläser in das große G-G-Gefäß kippen."
		short_node_rect.texture = PRESET2
		short_node_name.text = "Christina"
		dialogs += 1
	
	elif dialogs == 3:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Mit T-T-Titration bestimmt man normalerweise den p-p-pH-Wert von einer Flüssigkeit."
		short_node_rect.texture = PRESET2
		short_node_name.text = "Christina"
		dialogs += 1
		same_speaker = true
	
	elif dialogs == 4:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Wir müssen allerdings hier dafür s-s-sorgen, dass der p-p-pH-Wert im passenden Bereich liegt, d-d-damit ich mir nicht wehtue."
		short_node_rect.texture = PRESET2
		short_node_name.text = "Christina"
		dialogs += 1
		same_speaker = false
	
	elif dialogs == 6:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Der pH-Wert ist eine Skala von 1 bis 14, die uns sagt, wie sauer oder basisch eine Flüssigkeit ist."
		short_node_rect.texture = PRESET2
		short_node_name.text = "Christina"
		dialogs += 1
		same_speaker = true
	
	elif dialogs == 7:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Sie funktioniert s-s-so ähnlich wie ein T-T-Termometer, dass uns sagt, ob es warm oder k-k-kalt ist."
		short_node_rect.texture = PRESET2
		short_node_name.text = "Christina"
		dialogs += 1
		same_speaker = false

	elif dialogs == 9:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Stoffe mit einem pH-Wert unter 7 sind sauer, während Stoffe mit einem pH-Wert über 7 basisch sind. Wasser hat einen pH-Wert von genau 7, was bedeutet, dass es neutral ist."
		short_node_rect.texture = PRESET2
		short_node_name.text = "Christina"
		dialogs += 1
		same_speaker = true

	elif dialogs == 10:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Eine Zitrone hat einen sehr niedrigen pH-Wert, deswegen schmeckt sie so sauer."
		short_node_rect.texture = PRESET2
		short_node_name.text = "Christina"
		dialogs += 1

	elif dialogs == 11:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Seife ist ein Beispiel für einen basischen Stoff, deswegen fühlt sie sich so rutschig an und schmeckt bitter. Aber bitte probier zuhause nicht Seife zu essen!"
		short_node_rect.texture = PRESET2
		short_node_name.text = "Christina"
		dialogs += 1
		same_speaker = false
	
	
	elif dialogs == 13:
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