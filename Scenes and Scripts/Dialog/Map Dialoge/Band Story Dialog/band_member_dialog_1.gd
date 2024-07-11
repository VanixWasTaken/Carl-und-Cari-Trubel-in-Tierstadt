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
var mouse_inside_area = false
var player 
var next_job
var audio_job

var path_carl
var path_cari
var path_sam

################################  PUT CHARACTER ICONS HERE  ###############################

var Carl = preload("res://Assets/Art/Characters/Carl/Dialog Icon/carl_dialog.png")
var Cari = preload("res://Assets/Art/Characters/Cari/Dialog Icon/cari_dialog.png")
var Samuel = preload("res://Assets/Art/Characters/Band Members/Singer Samuel/samuel_dialog_icon.png")
##########################################################################################



func _ready():
	player = get_tree().get_first_node_in_group("Player")
	Global.moving_allowed = false
	Global.dialog_playing= true
	pc = Global.character
	PRESET1 = Carl
	PRESET2 = Cari
	PRESET3 = Samuel
	if Global.completed_jobs. size() != 0:
		if Global.completed_jobs[0] == "Laboratory Building":
			next_job = "der Gärtnerei"
			audio_job = "garden"
		else:
			next_job = "dem Chemielabor"
			audio_job = "laboratory"
###############################  PUT THE STARTING SIDE HERE  #############################
	add_left_dialog_box()
##########################################################################################







func _process(delta):
################################  PUT DIALOG NUMBER HERE  ################################
	if dialogs == 15:
		$"../Voice Over".stop()
		Global.dialog_playing= false
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
		short_node_text.text = "Bist du derjenige, der unsere Hilfe braucht?"
		short_node_rect.texture = PRESET1
		$"../Voice Over".stream = load("res://Assets/Sound/VO/Map/Carl/vo_pc_carl_map_bandmembers_02_01.mp3")
		$"../Voice Over".play()
		dialogs += 1
		short_node_name.text = "Carl"

	elif dialogs == 3:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "WOW! Du bist der echte Samuel Samtpfote? Ich freue mich schon die ganze Woche auf euer Konzert heute Abend!"
		short_node_rect.texture = PRESET2
		$"../Voice Over".stream = load("res://Assets/Sound/VO/Map/Cari/vo_pc_cari_map_bandmembers_02_03.mp3")
		$"../Voice Over".play()
		dialogs += 1
		short_node_name.text = "Cari"


	elif dialogs == 5:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Warum?"
		short_node_rect.texture = PRESET1
		$"../Voice Over".stream = load("res://Assets/Sound/VO/Map/Carl/vo_pc_carl_map_bandmembers_02_05.mp3")
		$"../Voice Over".play()
		dialogs += 1
		short_node_name.text = "Carl"

	elif dialogs == 7:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Die Bürgermeisterin hat uns extra geschickt, um dir zu helfen. Also, wenn wir die Bandmitglieder finden, kann das Konzert stattfinden?"
		short_node_rect.texture = PRESET2
		$"../Voice Over".stream = load("res://Assets/Sound/VO/Map/Cari/vo_pc_cari_map_bandmembers_02_07.mp3")
		$"../Voice Over".play()
		dialogs += 1
		short_node_name.text = "Cari"

	elif dialogs == 9:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Wie können wir da Nein sagen? Hast du einen Tipp wo wir sie finden können?"
		short_node_rect.texture = PRESET1
		$"../Voice Over".stream = load("res://Assets/Sound/VO/Map/Carl/vo_pc_carl_map_bandmembers_02_09.mp3")
		$"../Voice Over".play()
		dialogs += 1
		short_node_name.text = "Carl"

	elif dialogs == 11:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Da müssen wir eh als nächstes hin!"
		short_node_rect.texture = PRESET1
		$"../Voice Over".stream = load("res://Assets/Sound/VO/Map/Carl/vo_pc_carl_map_bandmembers_02_11.mp3")
		$"../Voice Over".play()
		dialogs += 1
		short_node_name.text = "Carl"
		same_speaker = true

	elif dialogs == 12:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Bevor wir irgendetwas überstürzen. Was bekommen wir für die Hilfe?"
		short_node_rect.texture = PRESET2
		$"../Voice Over".stream = load("res://Assets/Sound/VO/Map/Cari/vo_pc_cari_map_bandmembers_02_12.mp3")
		$"../Voice Over".play()
		dialogs += 1
		short_node_name.text = "Cari"
		same_speaker = false
	
	elif dialogs == 14:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "EINVERSTANDEN!"
		short_node_rect.texture = PRESET2
		$"../Voice Over".stream = load("res://Assets/Sound/VO/Map/Both/vo_pc_carl_and_cari_map_bandmembers_02_14.mp3")
		$"../Voice Over".play()
		dialogs += 1
		short_node_name.text = "Carl & Cari"
	


	
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
		short_node_text.text = "Ja genau, der bin ich. Ich bin Samuel, der Sänger der Metallikatzen. Meine Band und ich haben uns gestern gestritten und nun kann ich sie nicht finden."
		short_node_rect.texture = PRESET3
		short_node_name.text = "Samuel Samtpfote"
		$"../Voice Over".stream = load("res://Assets/Sound/VO/Map/Samuel/vo_npc_samuel_map_bandmembers_02_02.mp3")
		$"../Voice Over".play()
		dialogs += 1

	elif dialogs == 4:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Ihr seid wohl Fans. Ja, das bin ich. Freut mich dich kennenzulernen, aber ich fürchte, das Konzert fällt leider aus."
		short_node_rect.texture = PRESET3
		short_node_name.text = "Samuel Samtpfote"
		$"../Voice Over".stream = load("res://Assets/Sound/VO/Map/Samuel/vo_npc_samuel_map_bandmembers_02_04.mp3")
		$"../Voice Over".play()
		dialogs += 1

	elif dialogs == 6:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Leider haben ich und meine Band uns gestern zerstritten und ich kann sie nicht finden."
		short_node_rect.texture = PRESET3
		short_node_name.text = "Samuel Samtpfote"
		$"../Voice Over".stream = load("res://Assets/Sound/VO/Map/Samuel/vo_npc_samuel_map_bandmembers_02_06.mp3")
		$"../Voice Over".play()
		dialogs += 1

	elif dialogs == 8:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Ganz genau. Bitte findet die anderen und entschuldigt euch bei ihnen für mich."
		short_node_rect.texture = PRESET3
		short_node_name.text = "Samuel Samtpfote"
		$"../Voice Over".stream = load("res://Assets/Sound/VO/Map/Samuel/vo_npc_samuel_map_bandmembers_02_08.mp3")
		$"../Voice Over".play()
		dialogs += 1

	elif dialogs == 10:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Ich habe gehört, dass meine Gitarristin zuletzt in der Nähe von " + next_job + " gesehen wurde."
		short_node_rect.texture = PRESET3
		short_node_name.text = "Samuel Samtpfote"
		$"../Voice Over".stream = load("res://Assets/Sound/VO/Map/Samuel/vo_npc_samuel_map_bandmembers_02_10_" + audio_job + ".mp3")
		$"../Voice Over".play()
		dialogs += 1

	elif dialogs == 13:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Hmmm… Ihr dürft während des Konzerts mit auf die Bühne kommen, wie hört sich das an?"
		short_node_rect.texture = PRESET3
		short_node_name.text = "Samuel Samtpfote"
		$"../Voice Over".stream = load("res://Assets/Sound/VO/Map/Samuel/vo_npc_samuel_map_bandmembers_02_13.mp3")
		$"../Voice Over".play()
		dialogs += 1

	elif dialogs == 14:
		dialogs += 1
		Global.moving_allowed = true
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
