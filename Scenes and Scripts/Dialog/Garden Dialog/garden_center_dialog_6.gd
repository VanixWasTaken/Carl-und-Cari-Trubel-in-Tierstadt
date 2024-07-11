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
	Global.pause_opened = true
	Global.moving_allowed = false
	Global.dialog_playing = true
###############################  PUT THE STARTING SIDE HERE  #############################
	add_right_dialog_box()
##########################################################################################







func _process(delta):
################################  PUT DIALOG NUMBER HERE  ################################
	if dialogs == 14:
		$"../VoiceOver".stop()
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
		short_node_text.text = "Das hat wirklich Spaß gemacht, vielleicht kannst du mir mal dieses „Clash of Cats“ zeigen Carl."
		short_node_rect.texture = PRESET2
		short_node_name.text = "Cari"
		$"../VoiceOver".stream = load(cari_path + "6_02.mp3")
		$"../VoiceOver".play()
		dialogs += 1
		same_speaker = true
	
	elif dialogs == 3:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Wirklich? Das mach ich auf jeden Fall, wenn wir zuhause sind!"
		short_node_rect.texture = PRESET1
		short_node_name.text = "Carl"
		$"../VoiceOver".stream = load(carl_path + "6_03.mp3")
		$"../VoiceOver".play()
		dialogs += 1
		same_speaker = false
	
	elif dialogs == 6:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Die sind doch viel zu schwer. Wie sollen wir denn so eine Pflanze..."
		short_node_rect.texture = PRESET1
		short_node_name.text = "Carl"
		$"../VoiceOver".stream = load(carl_path + "6_05.mp3")
		$"../VoiceOver".play()
		dialogs += 1
		same_speaker = true
	
	elif dialogs == 7:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Warte. Ist das wieder einer deiner Witze?"
		short_node_rect.texture = PRESET1
		short_node_name.text = "Carl"
		$"../VoiceOver".stream = load(carl_path + "6_06.mp3")
		$"../VoiceOver".play()
		dialogs += 1
		same_speaker = false
	
	elif dialogs == 9:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Vielen Dank. Wenn wir zuhause sind, werden wir sie sofort einpflanzen."
		short_node_rect.texture = PRESET2
		short_node_name.text = "Cari"
		$"../VoiceOver".stream = load(cari_path + "6_08.mp3")
		$"../VoiceOver".play()
		dialogs += 1
		same_speaker = true
	
	elif dialogs == 10:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Wir müssen jetzt aber auch weiter. Ich bin schon gespannt, wie der Garten in echt aussehen wird. Auf Wiedersehen."
		short_node_rect.texture = PRESET2
		short_node_name.text = "Cari"
		$"../VoiceOver".stream = load(cari_path + "6_09.mp3")
		$"../VoiceOver".play()
		dialogs += 1
	
	elif dialogs == 11:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Tschüssi."
		short_node_rect.texture = PRESET1
		short_node_name.text = "Carl"
		$"../VoiceOver".stream = load(carl_path + "6_10.mp3")
		$"../VoiceOver".play()
		dialogs += 1
		same_speaker = false
	
	elif dialogs == 13:
		GlobalGarden.garden_help_button_state = 9
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
		short_node_text.text = "Das war wie immer eine exzellente Leistung. Der Garten-Show steht nichts mehr im Wege."
		short_node_rect.texture = PRESET4
		short_node_name.text = "Guido"
		$"../VoiceOver".stream = load(guido_path + "6_01.mp3")
		$"../VoiceOver".play()
		dialogs += 1
	
	elif dialogs == 4:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Damit wäre eure Reise durch mein Königreich auch so gut wie beendet."
		short_node_rect.texture = PRESET4
		short_node_name.text = "Guido"
		$"../VoiceOver".stream = load(guido_path + "6_04_var1.mp3")
		$"../VoiceOver".play()
		dialogs += 1
		same_speaker = true
		
	elif dialogs == 5:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Als letzten Schritt müsst ihr lediglich noch eine meiner Pflanzen adoptieren und mit nach Hause nehmen."
		short_node_rect.texture = PRESET4
		short_node_name.text = "Guido"
		$"../VoiceOver".stream = load(guido_path + "6_04_var2.mp3")
		$"../VoiceOver".play()
		dialogs += 1
		same_speaker = false

	elif dialogs == 8:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "HOHOHO. Du hast mich erwischt. Als Belohnung für eure Arbeit schenke ich euch beiden einen Samen meiner schönsten Blume. Passt gut darauf auf."
		short_node_rect.texture = PRESET4
		short_node_name.text = "Guido"
		$"../VoiceOver".stream = load(guido_path + "6_07.mp3")
		$"../VoiceOver".play()
		dialogs += 1
	
	elif dialogs == 12:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Auf Wiedersehen!" ## wenn jasper sauer wird kann er mir das sagen, dann änder ich das wieder
		short_node_rect.texture = PRESET4
		short_node_name.text = "Guido"
		$"../VoiceOver".stream = load(guido_path + "6_11.mp3")
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


