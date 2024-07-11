extends Control


@onready var l_bubble_node = preload("res://Scenes and Scripts/Dialog/Ground Structure/speech_bubble_left.tscn")
@onready var r_bubble_node = preload("res://Scenes and Scripts/Dialog/Ground Structure/speech_bubble_right.tscn")

var dialogs = 1
var dialog_side = ["left", "right"]
var finished = false
var same_speaker = false

var carl_path = "res://Assets/Sound/VO/Garden Center/Carl/PC/vo_pc_carl_garden_center_dialog_"
var cari_path = "res://Assets/Sound/VO/Garden Center/Cari/PC/vo_pc_cari_garden_center_dialog_"
var guido_path = "res://Assets/Sound/VO/Garden Center/Guido/vo_npc_guido_garden_center_dialog_"

################################  PUT CHARACTER ICONS HERE  ###############################

var PRESET1 = preload("res://Assets/Art/Characters/Carl/Dialog Icon/carl_dialog.png")
var PRESET2 = preload("res://Assets/Art/Characters/Cari/Dialog Icon/cari_dialog.png")
var PRESET3 = preload("res://Assets/Art/Characters/Carl und Cari/carl_und_cari_dialog_icon.png")
var PRESET4 = preload("res://Assets/Art/Characters/Guido/Headshot/gardener_headshot.png")


##########################################################################################





func _ready():
	Global.moving_allowed = false
	Global.dialog_playing = true
###############################  PUT THE STARTING SIDE HERE  #############################
	add_right_dialog_box()
##########################################################################################







func _process(delta):
################################  PUT DIALOG NUMBER HERE  ################################
	if dialogs == 17:
		$"../VoiceOver".stop()
		Global.dialog_playing = false
		Global.pause_opened = false
		GlobalGarden.should_enter_minigame1 = true
		queue_free()
##########################################################################################







func add_left_dialog_box():
	var node = l_bubble_node.instantiate()
	$".".add_child(node)
	dialog_side = "left"
##################################  WRITE DIALOG HERE  ###################################
	
	if dialogs == 4:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Sie haben die Ehre in der Gegenwart von den Geschwistern Carl und Cari zu stehen. Wir wurden entsandt, um ihnen unter die Arme zu greifen."
		short_node_rect.texture = PRESET2
		short_node_name.text = "Cari"
		$"../VoiceOver".stream = load(cari_path + "2_3.mp3")
		$"../VoiceOver".play()
		dialogs += 1
	
	elif dialogs == 6:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Du wurdest von einer Hexe angegriffen? Wie ist das passiert? Wo ist die Hexe jetzt?"
		short_node_rect.texture = PRESET1
		short_node_name.text = "Carl"
		$"../VoiceOver".stream = load(carl_path + "2_5.mp3")
		$"../VoiceOver".play()
		dialogs += 1
		same_speaker = false
	
	elif dialogs == 10:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Das haben wir schon mitbekommen. Also Fackeln wir nicht lange rum. Was können wir für dich tun?"
		short_node_rect.texture = PRESET2
		short_node_name.text = "Cari"
		$"../VoiceOver".stream = load(cari_path + "2_8.mp3")
		$"../VoiceOver".play()
		dialogs += 1
		same_speaker = false
	
	elif dialogs == 12:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Warte, was? Warum brauchst du Bananen? Ich dachte wir sollen dir helfen das Fest vorzubereiten?"
		short_node_rect.texture = PRESET1
		short_node_name.text = "Carl"
		$"../VoiceOver".stream = load(carl_path + "2_10.mp3")
		$"../VoiceOver".play()
		dialogs += 1
		same_speaker = false
	
	elif dialogs == 14:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "..."
		short_node_rect.texture = PRESET3
		short_node_name.text = "Carl und Cari"
		dialogs += 1
		same_speaker = false
	
	elif dialogs == 16:
		GlobalGarden.garden_help_button_state = 1
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
		short_node_text.text = "Willkommen im Königreich „Floratius“, oder wie die anderen sagen: Die Gärtnerei."
		short_node_rect.texture = PRESET4
		short_node_name.text = "Guido Gänseblümchen"
		$"../VoiceOver".stream = load(guido_path + "2_1_var1.mp3")
		$"../VoiceOver".play()
		dialogs += 1
		same_speaker = true
	
	elif dialogs == 2:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = " Mein Name lautet „Guido Gänseblümchen“ und ich bin hier der Regent."
		short_node_rect.texture = PRESET4
		short_node_name.text = "Guido"
		$"../VoiceOver".stream = load(guido_path + "2_1_var2.mp3")
		$"../VoiceOver".play()
		dialogs += 1
	
	elif dialogs == 3:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Mit wem habe ich die Ehre?"
		short_node_rect.texture = PRESET4
		short_node_name.text = "Guido"
		$"../VoiceOver".stream = load(guido_path + "2_2.mp3")
		$"../VoiceOver".play()
		dialogs += 1
		same_speaker = false
	
	elif dialogs == 5:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "In der Tat habe ich eure Ankunft schon erwartet. Bei den Vorbereitungen für das Stadtfest habe ich mir einen Hexenschuss eingeholt."
		short_node_rect.texture = PRESET4
		short_node_name.text = "Guido"
		$"../VoiceOver".stream = load(guido_path + "2_4.mp3")
		$"../VoiceOver".play()
		dialogs += 1
	
	elif dialogs == 7:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "HOHOHO. Nein mein Junge, ich habe zu schwere Sachen getragen und vergessen aus den Knien zu heben. Eine echte Hexe war nicht involviert."
		short_node_rect.texture = PRESET4
		short_node_name.text = "Guido"
		$"../VoiceOver".stream = load(guido_path + "2_6.mp3")
		$"../VoiceOver".play()
		dialogs += 1
		same_speaker = true
	
	elif dialogs == 8:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Nun aber zurück zum Geschäftlichen. Ich benötige eure Hilfe um meine Vorbereitungen zu beenden."
		short_node_rect.texture = PRESET4
		short_node_name.text = "Guido"
		$"../VoiceOver".stream = load(guido_path + "2_7.mp3")
		$"../VoiceOver".play()
		dialogs += 1
	
	elif dialogs == 9:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Meine Verletzung hindert leider meine Fähigkeiten."
		short_node_rect.texture = PRESET4
		short_node_name.text = "Guido"
		$"../VoiceOver".stream = load(guido_path + "2_8.mp3")
		$"../VoiceOver".play()
		dialogs += 1
		same_speaker = false
	
	elif dialogs == 11:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Als erste Handlung könnt ihr mir erstmal einen Bündel Bananen bringen."
		short_node_rect.texture = PRESET4
		short_node_name.text = "Guido"
		$"../VoiceOver".stream = load(guido_path + "2_9.mp3")
		$"../VoiceOver".play()
		dialogs += 1
		
	elif dialogs == 13:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "HOHOHO. Ich habe mir nur ein kleines Späßchen erlaubt."
		short_node_rect.texture = PRESET4
		short_node_name.text = "Guido"
		$"../VoiceOver".stream = load(guido_path + "2_11.mp3")
		$"../VoiceOver".play()
		dialogs += 1
	
	elif dialogs == 15:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Als erstes müsst ihr ihr euch in die hintere rechte Ecke des Raumes begeben und dort die Pflanzen schneiden."
		short_node_rect.texture = PRESET4
		short_node_name.text = "Guido"
		$"../VoiceOver".stream = load(guido_path + "2_13.mp3")
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


