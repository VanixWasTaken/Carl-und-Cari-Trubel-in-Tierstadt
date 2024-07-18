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
var mouse_inside_area = false
var player 
################################  PUT CHARACTER ICONS HERE  ###############################

var Carl = preload("res://Assets/Art/Characters/Carl/Dialog Icon/carl_dialog.png")
var Cari = preload("res://Assets/Art/Characters/Cari/Dialog Icon/cari_dialog.png")

##########################################################################################



func _ready():
	player = get_tree().get_first_node_in_group("Player")
	Global.moving_allowed = false
	Global.dialog_playing= true
	pc = Global.character
	if Global.character == "Carl":
		PRESET1 = Carl
		PRESET2 = Cari
	elif Global.character == "Cari" or Global.character == "":
		PRESET2 = Carl
		PRESET1 = Cari
###############################  PUT THE STARTING SIDE HERE  #############################
	add_right_dialog_box()
##########################################################################################







func _process(delta):
################################  PUT DIALOG NUMBER HERE  ################################
	if dialogs == 5:
		$"../Voice Over".stop()
		Global.dialog_playing = false
		Global.pause_opened = false
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
		short_node_text.text = "Ist ja gut, ich bin ja gleich so weit, hast du meinen Schlüssel irgendwo gesehen?"
		short_node_rect.texture = PRESET1
		dialogs += 1
		if Global.character == "Carl":
			short_node_name.text = "Carl"
			$"../Voice Over".stream = load("res://Assets/Sound/VO/Tutorial/Dialogue/Carl/PC/vo_pc_carl_tutorial01_var1.mp3")
			$"../Voice Over".play()
		elif Global.character == "Cari" or Global.character == "":
			short_node_name.text = "Cari"
			$"../Voice Over".stream = load("res://Assets/Sound/VO/Tutorial/Dialogue/Cari/PC/vo_pc_cari_tutorial01_var1.mp3")
			$"../Voice Over".play()
	
	elif dialogs == 4:
		Global.tutorial_help_button_state = 0
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
		short_node_text.text = "Komm schon " + str(pc) + ", es ist Zeit aufzubrechen!"
		short_node_rect.texture = PRESET2
		short_node_rect.flip_h = true
		dialogs += 1
		if Global.character == "Carl":
			short_node_name.text = "Cari"
			$"../Voice Over".stream = load("res://Assets/Sound/VO/Tutorial/Dialogue/Cari/NPC/vo_npc_cari_tutorial01_var1.mp3")
			$"../Voice Over".play()
		elif Global.character == "Cari" or Global.character == "":
			short_node_name.text = "Carl"
			$"../Voice Over".stream = load("res://Assets/Sound/VO/Tutorial/Dialogue/Carl/NPC/vo_npc_carl_tutorial01_var1.mp3")
			$"../Voice Over".play()

	elif dialogs == 3:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Vielleicht liegt er ja dort drüben. [Bewege die Maus auf den roten Kreis und Drücke die linke Maustaste, um dich dorthin zu bewegen]."
		short_node_rect.texture = PRESET2
		short_node_rect.flip_h = true
		dialogs += 1
		if Global.character == "Carl":
			short_node_name.text = "Cari"
			$"../Voice Over".stream = load("res://Assets/Sound/VO/Tutorial/Dialogue/Cari/NPC/vo_npc_cari_tutorial02_var1.mp3")
			$"../Voice Over".play()
		elif Global.character == "Cari" or Global.character == "":
			short_node_name.text = "Carl"
			$"../Voice Over".stream = load("res://Assets/Sound/VO/Tutorial/Dialogue/Carl/NPC/vo_npc_carl_tutorial02_var1.mp3")
			$"../Voice Over".play()



##########################################################################################



func _input(event):
	if Input.is_action_pressed("Tastatur2"):
		_on_skip_button_pressed()
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


func _on_area_2d_mouse_entered():
	print("SCHNIEBEL")
	mouse_inside_area = true


func _on_area_2d_mouse_exited():
	print("SCHNABEBBEL")
	mouse_inside_area = false
