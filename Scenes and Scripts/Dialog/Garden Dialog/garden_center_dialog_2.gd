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
var PRESET3 = preload("res://Assets/Art/Characters/Carl und Cari/carl_und_cari_dialog_icon.png")
var PRESET4 = preload("res://Assets/Art/Characters/Guido/Headshot/gardener_headshot.png")


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
	if dialogs == 15:
		Global.dialog_playing = false
		queue_free()
##########################################################################################







func add_left_dialog_box():
	var node = l_bubble_node.instantiate()
	$".".add_child(node)
	dialog_side = "left"
##################################  WRITE DIALOG HERE  ###################################
	
	if dialogs == 3:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Sie haben die Ehre in der Gegenwart von den Geschwistern Carl und Cari zu stehen. Wir wurden entsandt, um ihnen unter die Arme zu greifen."
		short_node_rect.texture = PRESET2
		short_node_name.text = "Cari"
		dialogs += 1
	
	elif dialogs == 5:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Du wurdest von einer Hexe angegriffen? Wie ist das passiert? Wo ist die Hexe jetzt?"
		short_node_rect.texture = PRESET1
		short_node_name.text = "Carl"
		dialogs += 1
		same_speaker = false
	
	elif dialogs == 8:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Das haben wir schon mitbekommen. Also Fackeln wir nicht lange rum. Was können wir für ihre dich tun?"
		short_node_rect.texture = PRESET2
		short_node_name.text = "Cari"
		dialogs += 1
		same_speaker = false
	
	elif dialogs == 10:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Warte, was? Warum brauchst du Bananen? Ich dachte wir sollen dir helfen das Fest vorzubereiten?"
		short_node_rect.texture = PRESET1
		short_node_name.text = "Carl"
		dialogs += 1
		same_speaker = false
	
	elif dialogs == 12:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "..."
		short_node_rect.texture = PRESET3
		short_node_name.text = "Carl und Cari"
		dialogs += 1
		same_speaker = false
	
	elif dialogs == 14:
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
		short_node_text.text = "Willkommen im Königreich „Floratius“, oder wie die anderen sagen: Die Gärtnerei. Mein Name lautet „Guido Gänseblümchen“ und ich bin hier der Regent."
		short_node_rect.texture = PRESET4
		short_node_name.text = "Guido Gänseblümchen"
		dialogs += 1
		same_speaker = true
	
	elif dialogs == 2:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Mit wem habe ich die Ehre?"
		short_node_rect.texture = PRESET4
		short_node_name.text = "Guido"
		dialogs += 1
		same_speaker = false
	
	elif dialogs == 4:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "In der Tat habe ich eure Ankunft schon erwartet. Bei den Vorbereitungen für das Stadtfest habe ich mir einen Hexenschuss eingeholt."
		short_node_rect.texture = PRESET4
		short_node_name.text = "Guido"
		dialogs += 1
	
	elif dialogs == 6:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "HOHOHO. Nein mein Junge, ich habe zu schwere Sachen getragen und vergessen aus den Knien zu heben. Eine echte Hexe war nicht involviert."
		short_node_rect.texture = PRESET4
		short_node_name.text = "Guido"
		dialogs += 1
		same_speaker = true
	
	elif dialogs == 7:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Nun aber zurück zum Geschäftlichen. Ich benötige eure Hilfe um meine Vorbereitungen zu beenden. Meine Verletzung hindert leider meine Fähigkeiten."
		short_node_rect.texture = PRESET4
		short_node_name.text = "Guido"
		dialogs += 1
		same_speaker = false
	
	elif dialogs == 9:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Als erste Handlung könnt ihr mir erstmal einen Bündel Bananen bringen."
		short_node_rect.texture = PRESET4
		short_node_name.text = "Guido"
		dialogs += 1
		same_speaker = false
		
	elif dialogs == 11:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "HOHOHO. Ich habe mir nur ein kleines Späßchen erlaubt."
		short_node_rect.texture = PRESET4
		short_node_name.text = "Guido"
		dialogs += 1
		same_speaker = false
	
	elif dialogs == 13:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Als erstes müsst ihr ihr euch in die hintere rechte Ecke des Raumes begeben und dort die Pflanzen schneiden."
		short_node_rect.texture = PRESET4
		short_node_name.text = "Guido"
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


