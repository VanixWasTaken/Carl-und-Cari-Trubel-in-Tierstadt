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
	add_right_dialog_box()
##########################################################################################







func _process(delta):
################################  PUT DIALOG NUMBER HERE  ################################
	if dialogs == 14:
		Global.dialog_playing = false
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
		short_node_text.text = "Dann geben wir jetzt noch einmal so richtig Gras!"
		short_node_rect.texture = PRESET1
		short_node_name.text = "Carl"
		dialogs += 1
	
	elif dialogs == 4:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "..."
		short_node_rect.texture = PRESET2
		short_node_name.text = "Cari"
		dialogs += 1
		same_speaker = true
	
	if dialogs == 5:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Was müssen wir denn als nächstes machen?"
		short_node_rect.texture = PRESET2
		short_node_name.text = "Cari"
		dialogs += 1
		same_speaker = false
	
	elif dialogs == 8:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Den richtigen Boden? Ich Pflanzen wachsen einfach so in der Erde?"
		short_node_rect.texture = PRESET1
		short_node_name.text = "Carl"
		dialogs += 1
	
	elif dialogs == 11:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Als König von Floratum musst du doch eigentlich wissen, welcher Boden der richtige ist, warum sagst du es uns nicht einfach?"
		short_node_rect.texture = PRESET2
		short_node_name.text = "Cari"
		dialogs += 1
		same_speaker = true
	
	
	elif dialogs == 13:
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
		short_node_text.text = "Vorzügliche Arbeit ihr zwei. Unsere Reise durch das Pflanzenwunderland ist fast vorbei."
		short_node_rect.texture = PRESET4
		short_node_name.text = "Guido"
		dialogs += 1
	
	elif dialogs == 3:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "HOHOHO."
		short_node_rect.texture = PRESET4
		short_node_name.text = "Guido"
		dialogs += 1
	
	elif dialogs == 6:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Die Vorbereitung für die Pflanzen ist nun vollzogen, jedoch fehlt noch ein wichtiger Schritt bevor wir den Garten für die Festivitäten planen können."
		short_node_rect.texture = PRESET4
		short_node_name.text = "Guido"
		dialogs += 1
		same_speaker = true
	
	elif dialogs == 7:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Wir müssen den richtigen Boden finden!"
		short_node_rect.texture = PRESET4
		short_node_name.text = "Guido"
		dialogs += 1
		same_speaker = false
	
	elif dialogs == 9:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Das stimmt so nicht ganz. Es gibt zwar Pflanzen, die fast überall wachsen können wie z.B. Löwenzahn, aber viele Pflanzen benötigen einen besonderen Boden um gedeihen zu können."
		short_node_rect.texture = PRESET4
		short_node_name.text = "Guido"
		dialogs += 1
		same_speaker = true
	
	elif dialogs == 10:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Dort drüben findet ihr mehrere Säcke gefüllt mit verschiedenen Bodentypen. Ich erklär euch wofür die genutzt werden und ihr sucht dann den richtigen aus."
		short_node_rect.texture = PRESET4
		short_node_name.text = "Guido"
		dialogs += 1
		same_speaker = false
	
	elif dialogs == 12:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Das könnte ich in der tat tun, aber wo bleibt dann der Spaß? Husch, Husch an die Arbeit mit auch."
		short_node_rect.texture = PRESET4
		short_node_name.text = "Guido"
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


