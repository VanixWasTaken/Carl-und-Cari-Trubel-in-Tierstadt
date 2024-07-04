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
var PRESET5
var mouse_inside_area = false
var player 
################################  PUT CHARACTER ICONS HERE  ###############################

var Carl = preload("res://Assets/Art/Characters/Carl/Dialog Icon/carl_dialog.png")
var Cari = preload("res://Assets/Art/Characters/Cari/Dialog Icon/cari_dialog.png")
var Phone = preload("res://Assets/Art/Characters/others/phone_headshot.png")
var Bianca = preload("res://Assets/Art/Characters/Mayor Bianca/mayor_headshot.png")
var BiancaCari = preload("res://Assets/Art/Characters/Bainca und Cari/biancacari_headshot.png")
##########################################################################################



func _ready():
	player = get_tree().get_first_node_in_group("Player")
	Global.moving_allowed = false
	Global.dialog_playing= true
	pc = Global.character
	PRESET1 = Carl
	PRESET2 = Cari
	PRESET3 = Phone
	PRESET4 = Bianca
	PRESET5 = BiancaCari

###############################  PUT THE STARTING SIDE HERE  #############################
	add_right_dialog_box()
##########################################################################################







func _process(delta):
################################  PUT DIALOG NUMBER HERE  ################################
	if dialogs == 11:
		Global.dialog_playing= false
		if Global.completed_jobs.size() == 1:
			get_tree().get_current_scene().explain_profiles()
		else: 
			var camera = get_tree().get_first_node_in_group("Camera")
			get_tree().get_first_node_in_group("Player").remove_child(camera)
			get_tree().get_current_scene().add_child(camera)
			camera.global_position = Vector2(1576,1248)
			get_tree().get_first_node_in_group("MarketAnimation").play("cloud_reveal")
			Global.cutscene_playing = true
			
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
		short_node_text.text = "Hallo, Cari am Apparat."
		short_node_rect.texture = PRESET2
		short_node_name.text = "Cari"
		$"../Voice Over".stream = load("res://Assets/Sound/VO/Map/Cari/vo_pc_cari_map_bandmembers_01_02.mp3")
		$"../Voice Over".play()
		dialogs += 1

	elif dialogs == 4:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Das haben wir! Sie ist wieder sichtbar wie eine Leuchtturm Lampe bei Nacht!"
		short_node_rect.texture = PRESET1
		short_node_name.text = "Carl"
		$"../Voice Over".stream = load("res://Assets/Sound/VO/Map/Carl/vo_pc_carl_map_bandmembers_01_04.mp3")
		$"../Voice Over".play()
		dialogs += 1

	elif dialogs == 7:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Erdbeeren?"
		short_node_rect.texture = PRESET1
		short_node_name.text = "Carl"
		$"../Voice Over".stream = load("res://Assets/Sound/VO/Map/Carl/vo_pc_carl_map_bandmembers_01_07.mp3")
		$"../Voice Over".play()
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
		short_node_text.text = "*Ring Ring Ring*"
		short_node_rect.texture = PRESET3
		short_node_name.text = "Telefon"
		#### hier muss ring ring sound rein
		dialogs += 1

	elif dialogs == 3:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Hallöchen, hier ist nochmal Bianca die Bürgermeisterin. Ich habe von Christina gehört, dass ihr sehr gute Arbeit geleistet habt."
		short_node_rect.texture = PRESET4
		short_node_name.text = "Bianca"
		$"../Voice Over".stream = load("res://Assets/Sound/VO/Map/Bianca/vo_npc_bianca_map_bandmembers_01_03.mp3")
		$"../Voice Over".play()
		dialogs += 1

	elif dialogs == 5:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = ". . ."
		short_node_rect.texture = PRESET5
		short_node_name.text = "Bianca & Cari"
		dialogs += 1
		same_speaker = true

	elif dialogs == 6:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Wie dem auch sei, kommt noch einmal zum Marktplatz, dort könnt ihr die Früchte eurer Arbeit ernten."
		short_node_rect.texture = PRESET4
		short_node_name.text = "Bianca"
		$"../Voice Over".stream = load("res://Assets/Sound/VO/Map/Bianca/vo_npc_bianca_map_bandmembers_01_06.mp3")
		$"../Voice Over".play()
		dialogs += 1
		same_speaker = false
	
	elif dialogs == 8:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = ". . ."
		short_node_rect.texture = PRESET5
		short_node_name.text = "Bianca & Cari"
		dialogs += 1
		same_speaker = true

	elif dialogs == 9:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Nicht ganz, aber es wartet auch noch jemand, der euch gerne kennenlernen möchte."
		short_node_rect.texture = PRESET4
		short_node_name.text = "Bianca"
		$"../Voice Over".stream = load("res://Assets/Sound/VO/Map/Bianca/vo_npc_bianca_map_bandmembers_01_09.mp3")
		$"../Voice Over".play()
		dialogs += 1
		same_speaker = false
##########################################################################################



func _input(event):
	if mouse_inside_area == true:
		if Input.is_action_just_pressed("left_click") && dialogs == 4:
			Global.dialog_playing = false
			Global.moving_allowed = true
			dialogs == 5
			player.navigation_agent.target_position = Vector3(-21.27536, 2.513487, -0.298849) 
			$"../Area2D".queue_free()
			queue_free()






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
