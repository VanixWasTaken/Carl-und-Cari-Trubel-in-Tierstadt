extends Control


@onready var l_bubble_node = preload("res://Scenes and Scripts/Dialog/Ground Structure/speech_bubble_left.tscn")
@onready var r_bubble_node = preload("res://Scenes and Scripts/Dialog/Ground Structure/speech_bubble_right.tscn")

var dialogs = 1
var dialog_side = ["left", "right"]
var finished = false
var same_speaker = false

################################  PUT CHARACTER ICONS HERE  ###############################

var PRESET1 
var help_name
var path

##########################################################################################





func _ready():
	Global.pause_opened = true
	Global.moving_allowed = false
	Global.dialog_playing = true
	if Global.character == "Cari":
		PRESET1 = preload("res://Assets/Art/Characters/Carl/Dialog Icon/carl_dialog.png")
		help_name = "Carl"
		##### This is used to make the code for the dialog and voiceline combination easier
		##### This way you only have to only type the name of the line inside the 
		##### load function --> load(path + "linename_01_var2")
		path = "res://Assets/Sound/VO/Garden Center/Carl/NPC/vo_npc_carl_garden_help_"
	elif Global.character == "Carl" or Global.character == "":
		PRESET1 = preload("res://Assets/Art/Characters/Cari/Dialog Icon/cari_dialog.png")
		help_name = "Cari"
		##### Same as in previous comment
		path = "res://Assets/Sound/VO/Garden Center/Cari/NPC/vo_npc_cari_garden_help_"
###############################  PUT THE STARTING SIDE HERE  #############################
	add_left_dialog_box()
##########################################################################################







func _process(delta):
################################  PUT DIALOG NUMBER HERE  ################################
	if dialogs == 3:
		$"../VoiceOver".stop()
		Global.pause_opened = false
		Global.dialog_playing = false
		queue_free()
##########################################################################################







func add_left_dialog_box():
	var node = l_bubble_node.instantiate()
	$".".add_child(node)
	dialog_side = "left"
##################################  WRITE DIALOG HERE  ###################################
	
	if dialogs == 1 and GlobalGarden.garden_help_button_state == 0:
		var short_node = get_child(1)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Rede mit dem Gärtner."
		short_node_rect.texture = PRESET1
		short_node_name.text = help_name
		$"../VoiceOver".stream = load(path + "1.mp3")
		$"../VoiceOver".play()
		dialogs += 1
	
	elif dialogs == 1 and GlobalGarden.garden_help_button_state == 1:
		var short_node = get_child(1)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Begib dich zu den Bäumen. Sie stehen hinten rechts im Raum."
		short_node_rect.texture = PRESET1
		short_node_name.text = help_name
		$"../VoiceOver".stream = load(path + "2.mp3")
		$"../VoiceOver".play()
		dialogs += 1
	
	elif dialogs == 1 and GlobalGarden.garden_help_button_state == 2:
		var short_node = get_child(1)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Unterhalte dich nochmal mit Guido."
		short_node_rect.texture = PRESET1
		short_node_name.text = help_name
		$"../VoiceOver".stream = load(path + "3.mp3")
		$"../VoiceOver".play()
		dialogs += 1
	
	elif dialogs == 1 and GlobalGarden.garden_help_button_state == 3:
		var short_node = get_child(1)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Geh in das Gartenhaus auf der Rückseite des Raums."
		short_node_rect.texture = PRESET1
		short_node_name.text = help_name
		$"../VoiceOver".stream = load(path + "4.mp3")
		$"../VoiceOver".play()
		dialogs += 1
	
	elif dialogs == 1 and GlobalGarden.garden_help_button_state == 4:
		var short_node = get_child(1)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Sprich nochmal mit dem Gorilla."
		short_node_rect.texture = PRESET1
		short_node_name.text = help_name
		$"../VoiceOver".stream = load(path + "5.mp3")
		$"../VoiceOver".play()
		dialogs += 1
	
	elif dialogs == 1 and GlobalGarden.garden_help_button_state == 5:
		var short_node = get_child(1)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Gehe zu den Säcken an der linken Wand."
		short_node_rect.texture = PRESET1
		short_node_name.text = help_name
		$"../VoiceOver".stream = load(path + "6.mp3")
		$"../VoiceOver".play()
		dialogs += 1
	
	elif dialogs == 1 and GlobalGarden.garden_help_button_state == 6:
		var short_node = get_child(1)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Rede noch einmal mit Guido."
		short_node_rect.texture = PRESET1
		short_node_name.text = help_name
		$"../VoiceOver".stream = load(path + "7.mp3")
		$"../VoiceOver".play()
		dialogs += 1
	
	elif dialogs == 1 and GlobalGarden.garden_help_button_state == 7:
		var short_node = get_child(1)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Benutze den Computer in der Mitte des Raums."
		short_node_rect.texture = PRESET1
		short_node_name.text = help_name
		$"../VoiceOver".stream = load(path + "8.mp3")
		$"../VoiceOver".play()
		dialogs += 1
	
	elif dialogs == 1 and GlobalGarden.garden_help_button_state == 8:
		var short_node = get_child(1)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Verabschiede dich von Guido Gänseblümchen."
		short_node_rect.texture = PRESET1
		short_node_name.text = help_name
		$"../VoiceOver".stream = load(path + "9.mp3")
		$"../VoiceOver".play()
		dialogs += 1
	
	elif dialogs == 1 and GlobalGarden.garden_help_button_state == 9:
		var short_node = get_child(1)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Verlasse die Gärtnerei durch die Tür."
		short_node_rect.texture = PRESET1
		short_node_name.text = help_name
		dialogs += 1
##########################################################################################








func add_right_dialog_box():
	var node = r_bubble_node.instantiate()
	$".".add_child(node)
	dialog_side = "right"
##################################  WRITE DIALOG HERE  ###################################
	
	if dialogs == 2:
		dialogs += 1
		Global.moving_allowed = true
		Global.pause_opened = false
	
	
	
	
	
	
	
	
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
