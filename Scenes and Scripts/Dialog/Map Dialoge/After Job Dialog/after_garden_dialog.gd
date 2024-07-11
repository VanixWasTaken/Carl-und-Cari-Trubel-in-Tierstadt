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
var map_story
##########################################################################################



func _ready():
	player = get_tree().get_first_node_in_group("Player")
	Global.moving_allowed = false
	Global.dialog_playing= true
	pc = Global.character
	PRESET1 = Carl
	PRESET2 = Cari

###############################  PUT THE STARTING SIDE HERE  #############################
	add_left_dialog_box()
##########################################################################################







func _process(delta):
################################  PUT DIALOG NUMBER HERE  ################################
	if dialogs == 9:
		$"../Voice Over".stop()
		var completed_jobs_size = str(Global.completed_jobs.size())
		map_story = Global.story_dialog_tracker[completed_jobs_size] 
		var story_dialog = load(map_story)
		var dialog_instance = story_dialog.instantiate()
		get_tree().get_current_scene().add_child(dialog_instance)
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
		short_node_text.text = "Ich hätte nie gedacht, dass Pflanzen uns so ähnlich sein können."
		short_node_rect.texture = PRESET2
		short_node_name.text = "Cari"
		$"../Voice Over".stream = load("res://Assets/Sound/VO/Map/Cari/vo_pc_cari_after_garden_map_01.mp3")
		$"../Voice Over".play()
		dialogs += 1
		same_speaker = true

	elif dialogs == 2:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Ich auch nicht!"
		short_node_rect.texture = PRESET1
		short_node_name.text = "Carl"
		$"../Voice Over".stream = load("res://Assets/Sound/VO/Map/Carl/vo_pc_carl_after_garden_map_02.mp3")
		$"../Voice Over".play()
		dialogs += 1

	elif dialogs == 3:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Ich fand es cool, wie sehr Guido sich für seine Pflanzen eingesetzt hat. Fast als wären es seine eigenen Kinder."
		short_node_rect.texture = PRESET1
		short_node_name.text = "Carl"
		$"../Voice Over".stream = load("res://Assets/Sound/VO/Map/Carl/vo_pc_carl_after_garden_map_03.mp3")
		$"../Voice Over".play()
		dialogs += 1

	elif dialogs == 4:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Ja, seine Hingabe war inspirierend. Aber seine Witze hätte er auch lassen können."
		short_node_rect.texture = PRESET2
		short_node_name.text = "Cari"
		$"../Voice Over".stream = load("res://Assets/Sound/VO/Map/Cari/vo_pc_cari_after_garden_map_04.mp3")
		$"../Voice Over".play()
		dialogs += 1

	elif dialogs == 5:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Ich fand sie eigentlich ganz lustig."
		short_node_rect.texture = PRESET1
		short_node_name.text = "Carl"
		$"../Voice Over".stream = load("res://Assets/Sound/VO/Map/Carl/vo_pc_carl_after_garden_map_05.mp3")
		$"../Voice Over".play()
		dialogs += 1

	elif dialogs == 6:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Ich kann es kaum erwarten nach Hause zu kommen und die Samen einzupflanzen."
		short_node_rect.texture = PRESET1
		short_node_name.text = "Carl"
		$"../Voice Over".stream = load("res://Assets/Sound/VO/Map/Carl/vo_pc_carl_after_garden_map_06.mp3")
		$"../Voice Over".play()
		dialogs += 1

	elif dialogs == 7:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Ich auch nicht, also komm. Lass uns möglichst schnell die anderen Jobs erledigen."
		short_node_rect.texture = PRESET2
		short_node_name.text = "Cari"
		$"../Voice Over".stream = load("res://Assets/Sound/VO/Map/Cari/vo_pc_cari_after_garden_map_07.mp3")
		$"../Voice Over".play()
		dialogs += 1
		same_speaker = false



	
##########################################################################################








func add_right_dialog_box():
	var node = r_bubble_node.instantiate()
	$".".add_child(node)
	dialog_side = "right"
##################################  WRITE DIALOG HERE  ###################################

	if dialogs == 8:
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
