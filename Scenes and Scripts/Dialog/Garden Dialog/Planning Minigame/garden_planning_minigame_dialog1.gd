extends Control


@onready var l_bubble_node = preload("res://Scenes and Scripts/Dialog/Ground Structure/speech_bubble_left.tscn")
@onready var r_bubble_node = preload("res://Scenes and Scripts/Dialog/Ground Structure/speech_bubble_right.tscn")

var dialogs = 1
var dialog_side = ["left", "right"]
var finished = false
var same_speaker = false

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
	add_left_dialog_box()
##########################################################################################







func _process(delta):
################################  PUT DIALOG NUMBER HERE  ################################
	if dialogs == 8:
		Global.dialog_playing = false
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
		short_node_text.text = "Also, was müssen wir tun? Biber-Barbaren ausbilden? Einen Zitteraal-Zauberer-Turm bauen oder …?"
		short_node_rect.texture = PRESET1
		short_node_name.text = "Carl"
		dialogs += 1
		same_speaker = false
		
	if dialogs == 3:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Also sollen wir hier nur das Layout für den Garten planen? Was passiert, wenn wir die Aufgaben nicht erfüllen?"
		short_node_rect.texture = PRESET2
		short_node_name.text = "Cari"
		dialogs += 1
		same_speaker = false
	
	if dialogs == 6:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Dann wollen wir mal unser Bestes geben, dass wir uns einen Garten ausdenken, den man so schnell nicht vergessen wird."
		short_node_rect.texture = PRESET1
		short_node_name.text = "Carl"
		dialogs += 1
		same_speaker = true
	
	elif dialogs == 7:
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
		short_node_text.text = "Nicht so schnell mein Junge. Eure Aufgabe ist es einfach nur die Pflanzen einzupflanzen und dabei die Angaben auf dem Zettel zu erfüllen."
		short_node_rect.texture = PRESET4
		short_node_name.text = "Guido"
		dialogs += 1
		same_speaker = false
	
	elif dialogs == 4:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Ganz recht, ich rufe dann meine Cousins Ginston und Gaston, die dann den Garten errichten werden."
		short_node_rect.texture = PRESET4
		short_node_name.text = "Guido"
		dialogs += 1
		same_speaker = true
	
	elif dialogs == 5:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Solltet ihr scheitern die Anforderungen zu erfüllen, gibt es dieser Jahr keine Gartenaustellung"
		short_node_rect.texture = PRESET4
		short_node_name.text = "Guido"
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


