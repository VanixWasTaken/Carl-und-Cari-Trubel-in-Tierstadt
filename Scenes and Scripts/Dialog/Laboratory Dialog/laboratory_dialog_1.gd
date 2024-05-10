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
var PRESET3 = preload("res://Assets/Art/Characters/Chemical Chameleon/Headshot/Chameleon Headshot.png")

##########################################################################################





func _ready():
	Global.moving_allowed = false
###############################  PUT THE STARTING SIDE HERE  #############################
	add_left_dialog_box()
##########################################################################################







func _process(delta):
################################  PUT DIALOG NUMBER HERE  ################################
	if dialogs == 12:
		Global.moving_allowed = true
		Global.dialogue_playing = false
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
		short_node_text.text = "Hallo? Ist hier irgendjemand? Uns wurde gesagt, dass wir hier aushelfen sollen."
		short_node_rect.texture = PRESET1
		short_node_name.text = "Carl"
		dialogs += 1
		same_speaker = true
	
	elif dialogs == 2:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Vielleicht sollten wir später wiederkommen."
		short_node_rect.texture = PRESET2
		short_node_name.text = "Cari"
		dialogs += 1
		same_speaker = false
	
	elif dialogs == 4:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Wer hat das gesagt? Zeig dich!"
		short_node_rect.texture = PRESET1
		short_node_name.text = "Carl"
		dialogs += 1
	
	elif dialogs == 6:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Wer bist du und warum können wir dich nicht sehen?"
		short_node_rect.texture = PRESET2
		short_node_name.text = "Cari"
		dialogs += 1
	
	elif dialogs == 9:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Natürlich! Was sollen wir tun?"
		short_node_rect.texture = PRESET1
		short_node_name.text = "Carl"
		dialogs += 1
	
	elif dialogs == 11:
		dialogs += 1
		Global.moving_allowed = true
	
	
	
##########################################################################################








func add_right_dialog_box():
	var node = r_bubble_node.instantiate()
	$".".add_child(node)
	dialog_side = "right"
##################################  WRITE DIALOG HERE  ###################################
	
	if dialogs == 3:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "H-H-Hallo, ich b-b-bin hier."
		short_node_rect.texture = PRESET3
		short_node_name.text = "???"
		dialogs += 1
	
	elif dialogs == 5:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Ich stehe d-d-direkt vor dir."
		short_node_rect.texture = PRESET3
		short_node_name.text = "???"
		dialogs += 1
	
	elif dialogs == 7:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Ich b-b-bin Christina das Chemie Chamäleon. I-i-ich habe mich aus Versehen u-u-unsichtbar gemacht und k-k-kann mich nicht zurückverwandeln."
		short_node_rect.texture = PRESET3
		short_node_name.text = "Christina"
		dialogs += 1
		same_speaker = true
	
	elif dialogs == 8:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "K-k-könnt ihr mir helfen meine V-V-Visabel Chemikalie zu mixen? Mit der werde ich wieder sichtbar."
		short_node_rect.texture = PRESET3
		short_node_name.text = "Christina"
		dialogs += 1
		same_speaker = false
	
	elif dialogs == 10:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Ihr m-m-müsst zuerst an d-d-dem Tisch dort drei Chemikalien mixen. Dort erkläre ich den nächsten Schritt."
		short_node_rect.texture = PRESET3
		short_node_name.text = "Christina"
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
