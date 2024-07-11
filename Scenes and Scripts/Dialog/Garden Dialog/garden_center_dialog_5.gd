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
	if dialogs == 10:
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
	
	if dialogs == 2:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Und der wäre? Sollen wir den Pflanzen noch ein Gute-Nacht-Lied singen?"
		short_node_rect.texture = PRESET2
		short_node_name.text = "Cari"
		$"../VoiceOver".stream = load(cari_path + "5_02.mp3")
		$"../VoiceOver".play()
		dialogs += 1
	
	elif dialogs == 5:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Das hört sich wie „Clash of Cats“ an. Mein Lieblingsspiel!"
		short_node_rect.texture = PRESET1
		short_node_name.text = "Carl"
		$"../VoiceOver".stream = load(carl_path + "5_05.mp3")
		$"../VoiceOver".play()
		dialogs += 1
	
	if dialogs == 7:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Hehehehe."
		short_node_rect.texture = PRESET1
		short_node_name.text = "Carl"
		$"../VoiceOver".stream = load(carl_path + "5_07.mp3")
		$"../VoiceOver".play()
		dialogs += 1
		same_speaker = true
	
	elif dialogs == 8:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "..."
		short_node_rect.texture = PRESET2
		short_node_name.text = "Cari"
		dialogs += 1
		same_speaker = false
	
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
		short_node_text.text = "Vorzüglich! Nun fehlt nur noch der letzte Schritt."
		short_node_rect.texture = PRESET4
		short_node_name.text = "Guido"
		$"../VoiceOver".stream = load(guido_path + "5_01.mp3")
		$"../VoiceOver".play()
		dialogs += 1
	
	elif dialogs == 3:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Nein, nein, nein. Darum vermag ich mich selbst zu kümmern, wenn ihr von dannen gezogen seid."
		short_node_rect.texture = PRESET4
		short_node_name.text = "Guido"
		$"../VoiceOver".stream = load(guido_path + "5_03.mp3")
		$"../VoiceOver".play()
		dialogs += 1
		same_speaker = true
	
	elif dialogs == 4:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Eure letzte Aufgabe ist es, zu dem Computer in der Mitte des Raumes zu gehen und die Anordnung der Pflanzen im Garten zu planen."
		short_node_rect.texture = PRESET4
		short_node_name.text = "Guido"
		$"../VoiceOver".stream = load(guido_path + "5_04.mp3")
		$"../VoiceOver".play()
		dialogs += 1
		same_speaker = false
	
	elif dialogs == 6:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Dann wirst du eine pflanztastische Arbeit machen. HOHOHO!"
		short_node_rect.texture = PRESET4
		short_node_name.text = "Guido"
		$"../VoiceOver".stream = load(guido_path + "5_06.mp3")
		$"../VoiceOver".play()
		dialogs += 1
	
	elif dialogs == 9:
		GlobalGarden.garden_help_button_state = 7
		dialogs += 1
		Global.moving_allowed = true
	
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


