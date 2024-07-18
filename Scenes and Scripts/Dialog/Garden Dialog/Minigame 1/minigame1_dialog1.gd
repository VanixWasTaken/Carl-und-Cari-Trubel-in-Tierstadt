extends Control


@onready var l_bubble_node = preload("res://Scenes and Scripts/Dialog/Ground Structure/speech_bubble_left.tscn")
@onready var r_bubble_node = preload("res://Scenes and Scripts/Dialog/Ground Structure/speech_bubble_right.tscn")

var dialogs = 1
var dialog_side = ["left", "right"]
var finished = false
var same_speaker = false

var carl_path = "res://Assets/Sound/VO/Garden Center/Carl/PC/vo_pc_carl_snipping_dialog_"
var cari_path = "res://Assets/Sound/VO/Garden Center/Cari/PC/vo_pc_cari_snipping_dialog_"
var guido_path = "res://Assets/Sound/VO/Garden Center/Guido/vo_npc_guido_snipping_dialog_"

################################  PUT CHARACTER ICONS HERE  ###############################

var PRESET1 = preload("res://Assets/Art/Characters/Carl/Dialog Icon/carl_dialog.png")
var PRESET2 = preload("res://Assets/Art/Characters/Cari/Dialog Icon/cari_dialog.png")
##### add icon for environment here once finished
var PRESET3 = preload("res://Assets/Art/Environment/Map/Clouds/cloud_poof1.png")
var PRESET4 = preload("res://Assets/Art/Characters/Guido/Headshot/gardener_headshot.png")


##########################################################################################

func _input(event):
	if Input.is_action_pressed("Tastatur2"):
		_on_skip_button_pressed()



func _ready():
	Global.pause_opened = true
	Global.moving_allowed = false
	Global.dialog_playing = true
###############################  PUT THE STARTING SIDE HERE  #############################
	add_left_dialog_box()
##########################################################################################







func _process(delta):
################################  PUT DIALOG NUMBER HERE  ################################
	if dialogs == 16:
		$"../VoiceOver".stop()
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
		short_node_text.text = "Also, hier sind wir, was ist unsere Aufgabe?"
		short_node_rect.texture = PRESET1
		short_node_name.text = "Carl"
		$"../VoiceOver".stream = load(carl_path + "01.mp3")
		$"../VoiceOver".play()
		dialogs += 1
		
	if dialogs == 3:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Ja stimmt, die sehen echt hässlich aus. Sowas kann man nicht auf dem Stadtfest ausstellen."
		short_node_rect.texture = PRESET2
		short_node_name.text = "Cari"
		$"../VoiceOver".stream = load(cari_path + "03.mp3")
		$"../VoiceOver".play()
		dialogs += 1
		
	if dialogs == 6:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Und... die wären?"
		short_node_rect.texture = PRESET1
		short_node_name.text = "Carl"
		$"../VoiceOver".stream = load(carl_path + "05.mp3")
		$"../VoiceOver".play()
		dialogs += 1
	
	if dialogs == 10:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Aha! Also ist es wie zum Friseur zu gehen."
		short_node_rect.texture = PRESET1
		short_node_name.text = "Carl"
		$"../VoiceOver".stream = load(carl_path + "08.mp3")
		$"../VoiceOver".play()
		dialogs += 1
	
	if dialogs == 12:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Jetzt wo wir den theoretischen Teil können, können wir ja auch mit der praktischen Arbeit anfangen. Was genau müssen wir jetzt machen?"
		short_node_rect.texture = PRESET2
		short_node_name.text = "Cari"
		$"../VoiceOver".stream = load(cari_path + "10.mp3")
		$"../VoiceOver".play()
		dialogs += 1
		
		
	elif dialogs == 15:
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
		short_node_text.text = "Die Bäume vor euch haben Äste, die getrimmt werden müssen."
		short_node_rect.texture = PRESET4
		short_node_name.text = "Guido"
		dialogs += 1
		$"../VoiceOver".stream = load(guido_path + "02.mp3")
		$"../VoiceOver".play()
		same_speaker = false
	
	elif dialogs == 4:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Das ist einer der Gründe, weshalb wir die Pflanzen schneiden müssen." 
		short_node_rect.texture = PRESET4
		short_node_name.text = "Guido"
		$"../VoiceOver".stream = load(guido_path + "04_var1.mp3")
		$"../VoiceOver".play()
		dialogs += 1
		same_speaker = true
	
	elif dialogs == 5:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Jedoch gibt es noch eine beachtliche Menge an anderen Gründen, um zu so einer Maßnahme zu greifen." 
		short_node_rect.texture = PRESET4
		short_node_name.text = "Guido"
		$"../VoiceOver".stream = load(guido_path + "04_var2.mp3")
		$"../VoiceOver".play()
		dialogs += 1
		same_speaker = false
	
	elif dialogs == 7:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Zum einen regt es das Wachstum der Pflanze an, sodass sie nächsten Sommer noch größer wird."
		short_node_rect.texture = PRESET4
		short_node_name.text = "Guido"
		$"../VoiceOver".stream = load(guido_path + "06.mp3")
		$"../VoiceOver".play()
		dialogs += 1
		same_speaker = true
	
	elif dialogs == 8:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Ein anderer Vorteil ist, dass wir der Pflanze helfen gesund zu bleiben."
		short_node_rect.texture = PRESET4
		short_node_name.text = "Guido"
		$"../VoiceOver".stream = load(guido_path + "07_var1.mp3")
		$"../VoiceOver".play()
		dialogs += 1
		same_speaker = true
	
	elif dialogs == 9:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Durch das Schneiden können wir kranke Äste entfernen und verhindern, dass sich Krankheiten überhaupt bilden."
		short_node_rect.texture = PRESET4
		short_node_name.text = "Guido"
		$"../VoiceOver".stream = load(guido_path + "07_var2.mp3")
		$"../VoiceOver".play()
		dialogs += 1
		same_speaker = false
	
	
	elif dialogs == 11:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Ja so ungefähr. Es ist so, als ob dein Friseur und dein Arzt dieselbe Person wären."
		short_node_rect.texture = PRESET4
		short_node_name.text = "Guido"
		$"../VoiceOver".stream = load(guido_path + "09.mp3")
		$"../VoiceOver".play()
		dialogs += 1
		same_speaker = false
	
	elif dialogs == 13:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Ah genau, manchmal verlier ich mich, wenn ich über meine pflanzlichen Kollegen rede."
		short_node_rect.texture = PRESET4
		short_node_name.text = "Guido"
		$"../VoiceOver".stream = load(guido_path + "11_var1.mp3")
		$"../VoiceOver".play()
		dialogs += 1
		same_speaker = true
	
	elif dialogs == 14:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Eure Aufgabe ist es, die Äste und Büschel von der Pflanze abzutrennen, die kränklich oder unpassend aussehen."
		short_node_rect.texture = PRESET4
		short_node_name.text = "Guido"
		$"../VoiceOver".stream = load(guido_path + "11_var2.mp3")
		$"../VoiceOver".play()
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


