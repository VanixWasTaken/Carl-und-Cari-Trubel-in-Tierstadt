extends Control


@onready var l_bubble_node = preload("res://Scenes and Scripts/Dialog/Ground Structure/speech_bubble_left.tscn")
@onready var r_bubble_node = preload("res://Scenes and Scripts/Dialog/Ground Structure/speech_bubble_right.tscn")

var dialogs = 1
var dialog_side = ["left", "right"]
var finished = false
var same_speaker = false
var pc
var PRESET1
var PRESET2
var PRESET3
var PRESET4
var mouse_inside_area = false
var player 
################################  PUT CHARACTER ICONS HERE  ###############################

var Carl = preload("res://Assets/Art/Characters/Carl/Dialog Icon/carl_dialog.png")
var Cari = preload("res://Assets/Art/Characters/Cari/Dialog Icon/cari_dialog.png")
var Carl_and_Cari = preload("res://Assets/Art/Characters/Carl und Cari/carl_und_cari_dialog_icon.png")
var Sven = preload("res://Assets/Art/Characters/Band Members/Saxophonist Sven/sven_dialog_icon.png")
##########################################################################################



func _ready():
	player = get_tree().get_first_node_in_group("Player")
	Global.moving_allowed = false
	Global.dialog_playing= true
	pc = Global.character
	PRESET1 = Carl
	PRESET2 = Cari
	PRESET3 = Sven
	PRESET4 = Carl_and_Cari

###############################  PUT THE STARTING SIDE HERE  #############################
	add_right_dialog_box()
##########################################################################################







func _process(delta):
################################  PUT DIALOG NUMBER HERE  ################################
	if dialogs == 8:
		$"../Voice Over".stop()
		Global.dialog_playing= false
		get_tree().get_current_scene().reveal_changes()
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
		short_node_text.text = "*Gulp* J-ja das tun wir."
		short_node_rect.texture = PRESET4
		short_node_name.text = "Carl & Cari"
		$"../Voice Over".stream = load("res://Assets/Sound/VO/Map/Both/vo_pc_carl_and_cari_map_bandmembers_05_02.mp3")
		$"../Voice Over".play()
		dialogs += 1

	elif dialogs == 4:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Was soll das heißen, wer sind sie überhaupt?"
		short_node_rect.texture = PRESET2
		short_node_name.text = "Cari"
		$"../Voice Over".stream = load("res://Assets/Sound/VO/Map/Cari/vo_pc_cari_map_bandmembers_05_04.mp3")
		$"../Voice Over".play()
		dialogs += 1

	elif dialogs == 7:
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
		short_node_text.text = "HEY IHR! Geht ihr nicht für Samuel durch die Stadt?"
		short_node_rect.texture = PRESET3
		short_node_name.text = "???"
		$"../Voice Over".stream = load("res://Assets/Sound/VO/Map/Sven/vo_npc_sven_map_bandmembers_05_1.mp3")
		$"../Voice Over".play()
		dialogs += 1

	elif dialogs == 3:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Dann sagt ihm, dass er seine Entschuldigung dahin schicken soll, wo der Pfeffer wächst!
"
		short_node_rect.texture = PRESET3
		short_node_name.text = "???"
		$"../Voice Over".stream = load("res://Assets/Sound/VO/Map/Sven/vo_npc_sven_map_bandmembers_05_03.mp3")
		$"../Voice Over".play()
		dialogs += 1

	elif dialogs == 5:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Ich bin…, nein. Ich WAR der SCHLAGZEUGER SVEN Schnurrhaar von den METALLIKATZEN!"
		short_node_rect.texture = PRESET3
		short_node_name.text = "Sven Schnurrhaar"
		$"../Voice Over".stream = load("res://Assets/Sound/VO/Map/Sven/vo_npc_sven_map_bandmembers_05_05_var1.mp3")
		$"../Voice Over".play()
		dialogs += 1
		same_speaker = true

	elif dialogs == 6:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Sagt Herrn Samtpfote, dass ich NIE wieder zurückkommen werde!"
		short_node_rect.texture = PRESET3
		short_node_name.text = "Sven Schnurrhaar"
		$"../Voice Over".stream = load("res://Assets/Sound/VO/Map/Sven/vo_npc_sven_map_bandmembers_05_05_var2.mp3")
		$"../Voice Over".play()
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
