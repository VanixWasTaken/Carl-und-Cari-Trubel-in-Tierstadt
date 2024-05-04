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
################################  PUT CHARACTER ICONS HERE  ###############################

var Carl = preload("res://Assets/Test/carl_dialog.png")
var Cari = preload("res://Assets/Test/cari_dialog.png")

##########################################################################################

func _ready():
	Global.moving_allowed = false
	Global.dialog_playing= true
	pc = Global.character
	if Global.character == "Carl":
		print(Global.character)
		PRESET1 = Carl
		PRESET2 = Cari
	elif Global.character == "Cari":
		print(Global.character)
		PRESET2 = Carl
		PRESET1 = Cari
###############################  PUT THE STARTING SIDE HERE  #############################
	add_left_dialog_box()
##########################################################################################







func _process(delta):
################################  PUT DIALOG NUMBER HERE  ################################
	if dialogs == 4:
		queue_free()
		Global.dialog_playing= false
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
		short_node_text.text = "Ah, hab ih gefunden. Jetzt bin ich bereit zu gehen."
		short_node_rect.texture = PRESET1
		dialogs += 1
		if Global.character == "Carl":
			$"../Voice Over".stream = load("res://Assets/Sound Test/Voice Over/Tutorial/Carl/vo_pc_carl_tutorial02_var1.mp3")
			$"../Voice Over".play()
		elif Global.character == "Cari":
			$"../Voice Over".stream = load("res://Assets/Sound Test/Voice Over/Tutorial/Cari/vo_pc_cari_tutorial02_var1.mp3")
			$"../Voice Over".play()

	elif dialogs == 3:
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
		short_node_text.text = "Perfekt, komm kurz noch zu mir und sprich mit mir."
		short_node_rect.texture = PRESET2
		dialogs += 1
		if Global.character == "Carl":
			$"../Voice Over".stream = load("res://Assets/Sound Test/Voice Over/Tutorial/Cari/vo_npc_cari_tutorial03_var1.mp3")
			$"../Voice Over".play()
		elif Global.character == "Cari":
			$"../Voice Over".stream = load("res://Assets/Sound Test/Voice Over/Tutorial/Carl/vo_npc_carl_tutorial03_var1.mp3")
			$"../Voice Over".play()


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


