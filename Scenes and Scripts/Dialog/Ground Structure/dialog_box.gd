extends Control


@onready var l_bubble_node = preload("res://Scenes and Scripts/Dialog/Ground Structure/speech_bubble_left.tscn")
@onready var r_bubble_node = preload("res://Scenes and Scripts/Dialog/Ground Structure/speech_bubble_right.tscn")

var dialogs = 1
var dialog_side = ["left", "right"]
var finished = false
var same_speaker = false

################################  PUT CHARACTER ICONS HERE  ###############################

var PRESET1 = preload("res://Assets/Test/Player/icon_carl1.PNG")
var PRESET2 = preload("res://Assets/Characters/Chemie Chamäleon/Chameleon Headshot.png")

##########################################################################################






func _ready():
	Global.moving_allowed = false
###############################  PUT THE STARTING SIDE HERE  #############################
	add_left_dialog_box()
##########################################################################################







func _process(delta):
################################  PUT DIALOG NUMBER HERE  ################################
	if dialogs == 8:
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
		short_node_text.text = "Kennst du Kasper Freh?"
		short_node_rect.texture = PRESET1
		dialogs += 1
	#
	#elif dialogs == 3:
		#var short_node = get_child(2)
		#var short_node_text = short_node.get_child(0)
		#var short_node_rect = short_node.get_child(1)
		#short_node_text.text = "Wohl eher ... SmallSchlongJohnsen"
		#short_node_rect.texture = PRESET1
		#dialogs += 1
	#
	#elif dialogs == 6:
		#var short_node = get_child(2)
		#var short_node_text = short_node.get_child(0)
		#var short_node_rect = short_node.get_child(1)
		#short_node_text.text = "ja genau der."
		#short_node_rect.texture = PRESET1
		#dialogs += 1
	#
	#
	#
	#
	
	
	
	
	
##########################################################################################








func add_right_dialog_box():
	var node = r_bubble_node.instantiate()
	$".".add_child(node)
	dialog_side = "right"
##################################  WRITE DIALOG HERE  ###################################
	
	#if dialogs == 2:
		#var short_node = get_child(2)
		#var short_node_text = short_node.get_child(0)
		#var short_node_rect = short_node.get_child(1)
		#short_node_text.text = "meinst du LongSchlongJohnsen?"
		#short_node_rect.texture = PRESET2
		#dialogs += 1
	#
	#elif dialogs == 4:
		#var short_node = get_child(2)
		#var short_node_text = short_node.get_child(0)
		#var short_node_rect = short_node.get_child(1)
		#short_node_text.text = "HAHAHAHAHA LOL WAR DAS WITZIG"
		#short_node_rect.texture = PRESET2
		#dialogs += 1
		#same_speaker = true
	#
	#elif dialogs == 5:
		#var short_node = get_child(2)
		#var short_node_text = short_node.get_child(0)
		#var short_node_rect = short_node.get_child(1)
		#short_node_text.text = "oh man ich kann nicht mehr"
		#short_node_rect.texture = PRESET2
		#dialogs += 1
		#same_speaker = false
	#
	#elif dialogs == 7:
		#dialogs += 1
		#Global.moving_allowed = true
	#
	#
	#
	#
	
	
	
	
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


