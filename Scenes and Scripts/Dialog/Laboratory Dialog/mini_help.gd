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

##########################################################################################






func _ready():
	Global.moving_allowed = false
	Global.dialog_playing = true
###############################  PUT THE STARTING SIDE HERE  #############################
	add_left_dialog_box()
##########################################################################################







func _process(delta):
################################  PUT DIALOG NUMBER HERE  ################################
	if dialogs == 3:
		Global.dialog_playing = false
		queue_free()
##########################################################################################







func add_left_dialog_box():
	var node = l_bubble_node.instantiate()
	$".".add_child(node)
	dialog_side = "left"
##################################  WRITE DIALOG HERE  ###################################
	
	if dialogs == 1 and Global.mini_help_button_state == 0:
		var short_node = get_child(1)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		if Global.character == "Carl":
			short_node_text.text = "Fülle Wasser und dann 0,2 - 0,45 Gramm des blauen Pulvers in das linke Reagenzglas."
			short_node_rect.texture = PRESET2
			short_node_name.text = "Cari"
			dialogs += 1
		elif Global.character == "Cari":
			short_node_text.text = "Fülle Wasser und dann 0,2 - 0,45 Gramm des blauen Pulvers in das linke Reagenzglas."
			short_node_rect.texture = PRESET1
			short_node_name.text = "Carl"
			dialogs += 1
	
	if dialogs == 1 and Global.mini_help_button_state == 1:
		var short_node = get_child(1)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		if Global.character == "Carl":
			short_node_text.text = "Schütte Wasser und 1,3 - 1,5 Gramm des roten Pulvers in das mittlere Reagenzglas."
			short_node_rect.texture = PRESET2
			short_node_name.text = "Cari"
			dialogs += 1
		elif Global.character == "Cari":
			short_node_text.text = "Schütte Wasser und 1,3 - 1,5 Gramm des roten Pulvers in das mittlere Reagenzglas."
			short_node_rect.texture = PRESET1
			short_node_name.text = "Carl"
			dialogs += 1
	
	if dialogs == 1 and Global.mini_help_button_state == 2:
		var short_node = get_child(1)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		if Global.character == "Carl":
			short_node_text.text = "Jetzt noch Wasser und 1,5 - 2,0 Gramm gelbes Pulver in das letzte Glas."
			short_node_rect.texture = PRESET2
			short_node_name.text = "Cari"
			dialogs += 1
		elif Global.character == "Cari":
			short_node_text.text = "Jetzt noch Wasser und 1,5 - 2,0 Gramm gelbes Pulver in das letzte Glas."
			short_node_rect.texture = PRESET1
			short_node_name.text = "Carl"
			dialogs += 1
	
	if dialogs == 1 and Global.mini_help_button_state == 3:
		var short_node = get_child(1)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		if Global.character == "Carl":
			short_node_text.text = "Fülle die Reagenzgläser mit Hilfe der Zange in den Behälter auf der linken Seite."
			short_node_rect.texture = PRESET2
			short_node_name.text = "Cari"
			dialogs += 1
		elif Global.character == "Cari":
			short_node_text.text = "Fülle die Reagenzgläser mit Hilfe der Zange in den Behälter auf der linken Seite."
			short_node_rect.texture = PRESET1
			short_node_name.text = "Carl"
			dialogs += 1
	
	if dialogs == 1 and Global.mini_help_button_state == 4:
		var short_node = get_child(1)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		if Global.character == "Carl":
			short_node_text.text = "Halte den pH-Wert zwischen 5 und 7 auf der Skala rechts oben. (Benutze dafür die Leertaste)"
			short_node_rect.texture = PRESET2
			short_node_name.text = "Cari"
			dialogs += 1
		elif Global.character == "Cari":
			short_node_text.text = "Halte den pH-Wert zwischen 5 und 7 auf der Skala rechts oben. (Benutze dafür die Leertaste)"
			short_node_rect.texture = PRESET1
			short_node_name.text = "Carl"
			dialogs += 1
	
	if dialogs == 1 and Global.mini_help_button_state == 5:
		var short_node = get_child(1)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		if Global.character == "Carl":
			short_node_text.text = "Schraube die Mischung an die Spritzpistole."
			short_node_rect.texture = PRESET2
			short_node_name.text = "Cari"
			dialogs += 1
		elif Global.character == "Cari":
			short_node_text.text = "Schraube die Mischung an die Spritzpistole."
			short_node_rect.texture = PRESET1
			short_node_name.text = "Carl"
			dialogs += 1
	
	if dialogs == 1 and Global.mini_help_button_state == 6:
		var short_node = get_child(1)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		if Global.character == "Carl":
			short_node_text.text = "Sprühe Christina mit der Spritzpistole ab."
			short_node_rect.texture = PRESET2
			short_node_name.text = "Cari"
			dialogs += 1
		elif Global.character == "Cari":
			short_node_text.text = "Sprühe Christina mit der Spritzpistole ab."
			short_node_rect.texture = PRESET1
			short_node_name.text = "Carl"
			dialogs += 1
	
	if dialogs == 1 and Global.mini_help_button_state == 7:
		var short_node = get_child(1)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		if Global.character == "Carl":
			short_node_text.text = "Sprühe Christina mit der Spritzpistole ab. Falls die Spritzpistole verklemmt, schüttel die Maus."
			short_node_rect.texture = PRESET2
			short_node_name.text = "Cari"
			dialogs += 1
		elif Global.character == "Cari":
			short_node_text.text = "Sprühe Christina mit der Spritzpistole ab. Falls die Spritzpistole verklemmt, schüttel die Maus."
			short_node_rect.texture = PRESET1
			short_node_name.text = "Carl"
			dialogs += 1
##########################################################################################








func add_right_dialog_box():
	var node = r_bubble_node.instantiate()
	$".".add_child(node)
	dialog_side = "right"
##################################  WRITE DIALOG HERE  ###################################
	if dialogs == 2:
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
