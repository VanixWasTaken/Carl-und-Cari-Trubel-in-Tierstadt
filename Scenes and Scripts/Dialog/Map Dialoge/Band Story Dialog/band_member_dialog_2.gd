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
################################  PUT CHARACTER ICONS HERE  ###############################

var Carl = preload("res://Assets/Art/Characters/Carl/Dialog Icon/carl_dialog.png")
var Cari = preload("res://Assets/Art/Characters/Cari/Dialog Icon/cari_dialog.png")
var Barbara = preload("res://Assets/Art/Characters/Band Members/Bassist Barbara/barbara_dialog_icon.png")
##########################################################################################



func _ready():
	player = get_tree().get_first_node_in_group("Player")
	Global.moving_allowed = false
	Global.dialog_playing= true
	pc = Global.character
	PRESET1 = Carl
	PRESET2 = Cari
	PRESET3 = Barbara

###############################  PUT THE STARTING SIDE HERE  #############################
	add_left_dialog_box()
##########################################################################################







func _process(delta):
################################  PUT DIALOG NUMBER HERE  ################################
	if dialogs == 14:
		#if Global.completed_jobs[0] == "Laboratory Building":
			#GlobalBand.needed_animation = "BarbaraMarket1"
		get_tree().get_first_node_in_group("AnimationPlayer").play(GlobalBand.needed_animation)
		get_tree().get_first_node_in_group("BarbaraSprite").play("barbara_walking")
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
		short_node_text.text = "Hey, bist du nicht ein Mitglied von Metallikatzen?"
		short_node_rect.texture = PRESET1
		short_node_name.text = "Carl"
		dialogs += 1

	elif dialogs == 3:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Willst du wirklich wegen eines kleinen Streits die Band aufgeben? Was ist mit uns Fans?"
		short_node_rect.texture = PRESET2
		short_node_name.text = "Cari"
		dialogs += 1


	elif dialogs == 5:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Samuel will sich entschuldigen, deswegen hat er uns geschickt!"
		short_node_rect.texture = PRESET1
		short_node_name.text = "Carl"
		dialogs += 1

	elif dialogs == 7:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Wir sagen die Wahrheit. Es tut ihm aufrichtig Leid."
		short_node_rect.texture = PRESET1
		short_node_name.text = "Carl"
		dialogs += 1

	elif dialogs == 10:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Warte, bevor du gehst. Können wir noch ein Autogramm haben?"
		short_node_rect.texture = PRESET2
		short_node_name.text = "Cari"
		dialogs += 1

	elif dialogs == 12:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Vielen Dank, ich hoffen ihr könnt euch versöhnen."
		short_node_rect.texture = PRESET2
		short_node_name.text = "Cari"
		dialogs += 1

	


	
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
		short_node_text.text = "Ich war mal die Bassistin. Aber wir haben uns zerstritten. Das wars wohl mit der Band."
		short_node_rect.texture = PRESET3
		short_node_name.text = "Barbara die Bengalkatze"
		dialogs += 1

	elif dialogs == 4:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Ich glaube nicht, dass wir und jemals wieder versöhnen können."
		short_node_rect.texture = PRESET3
		short_node_name.text = "Barbara"
		dialogs += 1

	elif dialogs == 6:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Sicher, dass ihr euch das nicht eingebildet habt? Das passt gar nicht zu ihm."
		short_node_rect.texture = PRESET3
		short_node_name.text = "Barbara"
		dialogs += 1

	elif dialogs == 8:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Hört sich so an, als ob er es wirklich Ernst meinen würde. Ich werde mir mal anhören, was er zu sagen hat."
		short_node_rect.texture = PRESET3
		short_node_name.text = "Barbara"
		dialogs += 1
		same_speaker = true

	elif dialogs == 9:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Aber ich kann nicht verspechen, das alles wieder gut wird."
		short_node_rect.texture = PRESET3
		short_node_name.text = "Barbara"
		dialogs += 1
		same_speaker = false

	elif dialogs == 11:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Ok, aber wenn ihr lügt will ich die wieder haben."
		short_node_rect.texture = PRESET3
		short_node_name.text = "Barbara"
		dialogs += 1

	elif dialogs == 13:
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
