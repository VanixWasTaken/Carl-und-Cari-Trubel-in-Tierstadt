extends Control


@onready var l_bubble_node = preload("res://Scenes and Scripts/Dialog/Ground Structure/speech_bubble_left.tscn")
@onready var r_bubble_node = preload("res://Scenes and Scripts/Dialog/Ground Structure/speech_bubble_right.tscn")

var dialogs = 1
var dialog_side = ["left", "right"]
var finished = false
var same_speaker = false

################################  PUT CHARACTER ICONS HERE  ###############################

var PRESET1 = preload("res://Assets/Art/Characters/Carl/Headshot/icon_carl1.PNG")
var PRESET2 = preload("res://Assets/Art/Characters/Carl/Headshot/icon_carl1.PNG")
var PRESET3 = preload("res://Assets/Art/Characters/Chemical Chameleon/Headshot/chemist_headshot1.png")

##########################################################################################





func _ready():
	Global.moving_allowed = false
	Global.dialog_playing = true
###############################  PUT THE STARTING SIDE HERE  #############################
	add_right_dialog_box()
##########################################################################################







func _process(delta):
################################  PUT DIALOG NUMBER HERE  ################################
	if dialogs == 4:
		Global.dialog_playing = false
		queue_free()
##########################################################################################







func add_left_dialog_box():
	var node = l_bubble_node.instantiate()
	$".".add_child(node)
	dialog_side = "left"
##################################  WRITE DIALOG HERE  ###################################
	
	if dialogs == 3:
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
		short_node_text.text = "D-D-Du musst in jedes Reagenzglas eine bestimmte Menge an Pulver und d-d-destilliertes Wasser vermischen."
		short_node_rect.texture = PRESET3
		short_node_name.text = "Christina"
		dialogs += 1
		same_speaker = true
	
	elif dialogs == 2:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Im linken Glas müssen 0,2 - 0,45 Gramm des blauen P-P-Pulvers gefüllt werden. Das Pulver kannst du mit d-d-der Waage abwiegen."
		short_node_rect.texture = PRESET3
		short_node_name.text = "Christina"
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