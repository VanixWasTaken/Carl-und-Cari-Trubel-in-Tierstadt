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
	#Global.pause_opened = true
	Global.moving_allowed = false
	Global.dialog_playing = true
###############################  PUT THE STARTING SIDE HERE  #############################
	add_left_dialog_box()
##########################################################################################







func _process(delta):
################################  PUT DIALOG NUMBER HERE  ################################
	if dialogs == 16:
		$"../VoiceOver".stop()
		Global.dialog_playing = false
		Global.pause_opened = false
		queue_free()
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
		short_node_text.text = "So, das wars. Die Pflanzen sehen wieder Tip-Top aus."
		short_node_rect.texture = PRESET1
		short_node_name.text = "Carl"
		$"../VoiceOver".stream = load(carl_path + "3_01.mp3")
		$"../VoiceOver".play()
		dialogs += 1
	
	elif dialogs == 4:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Durch was wird denn Pflanzenwachstum noch eingeschränkt?"
		short_node_rect.texture = PRESET2
		short_node_name.text = "Cari"
		$"../VoiceOver".stream = load(cari_path + "3_03.mp3")
		$"../VoiceOver".play()
		dialogs += 1
	
	elif dialogs == 6:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = " Eine Müri-was-e?"
		short_node_rect.texture = PRESET1
		short_node_name.text = "Carl"
		$"../VoiceOver".stream = load(carl_path + "3_05.mp3")
		$"../VoiceOver".play()
		dialogs += 1
	
	elif dialogs == 8:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Aha… Und die wären?"
		short_node_rect.texture = PRESET2
		short_node_name.text = "Cari"
		$"../VoiceOver".stream = load(cari_path + "3_07.mp3")
		$"../VoiceOver".play()
		dialogs += 1
	
	elif dialogs == 10:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Wow, das sind ja ne Menge an Sachen, die man beachten muss. Aber es ist wohl ähnlich wie bei uns Tieren."
		short_node_rect.texture = PRESET1
		short_node_name.text = "Carl"
		$"../VoiceOver".stream = load(carl_path + "3_09.mp3")
		$"../VoiceOver".play()
		dialogs += 1
		same_speaker = true
	
	elif dialogs == 11:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Genau Carl. Als Füchse sind wir zwar sehr anpassungsfähig, fühlen uns aber eigentlich in Wäldern und Graslandschaften am wohlsten."
		short_node_rect.texture = PRESET2
		short_node_name.text = "Cari"
		$"../VoiceOver".stream = load(cari_path + "3_10_var1.mp3")
		$"../VoiceOver".play()
		dialogs += 1
	
	elif dialogs == 12:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Guido hingegen fühlt sich in tropischen Regenwäldern am wohlsten."
		short_node_rect.texture = PRESET2
		short_node_name.text = "Cari"
		$"../VoiceOver".stream = load(cari_path + "3_10_var2.mp3")
		$"../VoiceOver".play()
		dialogs += 1
		same_speaker = false
	
	elif dialogs == 15:
		GlobalGarden.garden_help_button_state = 3
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
		short_node_text.text = "Das war tadellose Arbeit. Meine floralen Freunde sind wieder in einem erstklassigen Zustand."
		short_node_rect.texture = PRESET4
		short_node_name.text = "Guido"
		$"../VoiceOver".stream = load(guido_path + "3_02_var1.mp3")
		$"../VoiceOver".play()
		dialogs += 1
		same_speaker = true

	elif dialogs == 3:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Jedoch sind Zweige, die wild wachsen keineswegs die einzigen Beeinträchtigungen die Pflanzen in ihrem Leben überwinden müssen."
		short_node_rect.texture = PRESET4
		short_node_name.text = "Guido"
		$"../VoiceOver".stream = load(guido_path + "3_02_var2.mp3")
		$"../VoiceOver".play()
		dialogs += 1
		same_speaker = false

	elif dialogs == 5:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Da gibt es eine Myriade an Gründen."
		short_node_rect.texture = PRESET4
		short_node_name.text = "Guido"
		$"../VoiceOver".stream = load(guido_path + "3_04.mp3")
		$"../VoiceOver".play()
		dialogs += 1
	
	elif dialogs == 7:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "HOHO. Bitte entschuldigt meine Ausdrucksweise. Myriade bedeutet „Vielzahl“."
		short_node_rect.texture = PRESET4
		short_node_name.text = "Guido"
		$"../VoiceOver".stream = load(guido_path + "3_06.mp3")
		$"../VoiceOver".play()
		dialogs += 1
	
	elif dialogs == 9:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Temperatur, Luftfeuchtigkeit, Lichtintensität, Pflanzendiebe, Bodenfeuchtigkeit, Insekten, Luftdruck, um ein paar Beispiele zu geben."
		short_node_rect.texture = PRESET4
		short_node_name.text = "Guido"
		$"../VoiceOver".stream = load(guido_path + "3_08.mp3")
		$"../VoiceOver".play()
		dialogs += 1
	
	elif dialogs == 13:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Du liegst genau richtig, junge Dame. Aber kommen wir nun zu eurer nächsten Aufgabe."
		short_node_rect.texture = PRESET4
		short_node_name.text = "Guido"
		$"../VoiceOver".stream = load(guido_path + "3_11_var1.mp3")
		$"../VoiceOver".play()
		dialogs += 1
		same_speaker = true
	
	elif dialogs == 14:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Bitte begebt euch in das Gewächshaus an der hinteren Wand des Raums."
		short_node_rect.texture = PRESET4
		short_node_name.text = "Guido"
		$"../VoiceOver".stream = load(guido_path + "3_11_var2.mp3")
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


