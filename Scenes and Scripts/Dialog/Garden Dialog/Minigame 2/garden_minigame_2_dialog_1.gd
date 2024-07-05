extends Control


@onready var l_bubble_node = preload("res://Scenes and Scripts/Dialog/Ground Structure/speech_bubble_left.tscn")
@onready var r_bubble_node = preload("res://Scenes and Scripts/Dialog/Ground Structure/speech_bubble_right.tscn")

var dialogs = 1
var dialog_side = ["left", "right"]
var finished = false
var same_speaker = false

var carl_path = "res://Assets/Sound/VO/Garden Center/Carl/PC/vo_pc_carl_caring_dialog_"
var cari_path = "res://Assets/Sound/VO/Garden Center/Cari/PC/vo_pc_cari_caring_dialog_"
var guido_path = "res://Assets/Sound/VO/Garden Center/Guido/vo_npc_guido_caring_dialog_"

################################  PUT CHARACTER ICONS HERE  ###############################

var PRESET1 = preload("res://Assets/Art/Characters/Carl/Dialog Icon/carl_dialog.png")
var PRESET2 = preload("res://Assets/Art/Characters/Cari/Dialog Icon/cari_dialog.png")
var PRESET3 = preload("res://Assets/Art/Characters/Guido/Headshot/gardener_headshot.png")


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
	if dialogs == 17:
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
		short_node_text.text = "Da wären wir. Was müssen wir hier machen?"
		short_node_rect.texture = PRESET2
		short_node_name.text = "Cari"
		$"../VoiceOver".stream = load(cari_path + "01.mp3")
		$"../VoiceOver".play()
		dialogs += 1
		same_speaker = true
	
	elif dialogs == 2:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Bitte sag nicht, dass wir alle von den Dingen, die du vorhin aufgelistet hast, jetzt beachten müssen."
		short_node_rect.texture = PRESET1
		short_node_name.text = "Carl"
		$"../VoiceOver".stream = load(carl_path + "02_var1.mp3")
		$"../VoiceOver".play()
		dialogs += 1
		
	
	elif dialogs == 3:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Ich will mich nicht mit irgendwelchen Pflanzendieben anlegen müssen."
		short_node_rect.texture = PRESET1
		short_node_name.text = "Carl"
		$"../VoiceOver".stream = load(carl_path + "02_var2.mp3")
		$"../VoiceOver".play()
		dialogs += 1
		same_speaker = false
		
	elif dialogs == 5:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Carl, das war wieder einer seiner kleinen Witze und du bist schon wieder darauf reingefallen."
		short_node_rect.texture = PRESET2
		short_node_name.text = "Cari"
		$"../VoiceOver".stream = load(cari_path + "04.mp3")
		$"../VoiceOver".play()
		dialogs += 1
		
	elif dialogs == 10:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Und jetzt sollen wir die Einstellungen, die kaputt sind, per Pfote einstellen?"
		short_node_rect.texture = PRESET1
		short_node_name.text = "Carl"
		$"../VoiceOver".stream = load(carl_path + "07.mp3")
		$"../VoiceOver".play()
		dialogs += 1
		
	elif dialogs == 13:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Dann machen wir ja die ganze Arbeit! Was genau macht dein toller Pflanzomat 3000 noch? Ich dachte es würden nur ein paar Systeme nicht funktionieren?!"
		short_node_rect.texture = PRESET2
		short_node_name.text = "Cari"
		#$"../VoiceOver".stream = load(cari_path + "02_var1.mp3")
		#$"../VoiceOver".play()
		dialogs += 1
		
	elif dialogs == 16:
		dialogs += 1
		Global.moving_allowed = true
##########################################################################################








func add_right_dialog_box():
	var node = r_bubble_node.instantiate()
	$".".add_child(node)
	dialog_side = "right"
##################################  WRITE DIALOG HERE  ###################################
	
	if dialogs == 4:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "HOHOH…"
		short_node_rect.texture = PRESET3
		short_node_name.text = "Guido"
		$"../VoiceOver".stream = load(guido_path + "03.mp3")
		$"../VoiceOver".play()
		dialogs += 1
	
	elif dialogs == 6:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Ahem, in der Tat bist du wieder Opfer einer meiner Streiche geworden."
		short_node_rect.texture = PRESET3
		short_node_name.text = "Guido"
		$"../VoiceOver".stream = load(guido_path + "05_var1.mp3")
		$"../VoiceOver".play()
		dialogs += 1
		same_speaker = true
	
	
	elif dialogs == 7:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Aber ich kann deine Sorgen lindern, ihr müsst nur einen kleinen Teil der vorher genannten Aspekte im Auge behalten, der Rest wird automatisch erledigt."
		short_node_rect.texture = PRESET3
		short_node_name.text = "Guido"
		$"../VoiceOver".stream = load(guido_path + "05_var2.mp3")
		$"../VoiceOver".play()
		dialogs += 1
		
	elif dialogs == 8:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Letzte Nacht ereignete sich hier ein Stromausfall. Seitdem funktionieren einige Systeme meines „Pflanzomat 3000s“ nicht mehr richtig."
		short_node_rect.texture = PRESET3
		short_node_name.text = "Guido"
		$"../VoiceOver".stream = load(guido_path + "06_var1.mp3")
		$"../VoiceOver".play()
		dialogs += 1
	
	elif dialogs == 9:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Dieser dient eigentlich dazu, das Wohlbefinden meiner Pflanzen automatisch zu regulieren."
		short_node_rect.texture = PRESET3
		short_node_name.text = "Guido"
		$"../VoiceOver".stream = load(guido_path + "06_var2.mp3")
		$"../VoiceOver".play()
		dialogs += 1
		same_speaker = false

	elif dialogs == 11:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Ganz richtig. Ihr müsst dafür sorgen, dass die Pflanzen keine Schädlinge auf sich tragen..."
		short_node_rect.texture = PRESET3
		short_node_name.text = "Guido"
		$"../VoiceOver".stream = load(guido_path + "08.mp3")
		$"../VoiceOver".play()
		dialogs += 1
		same_speaker = true

	elif dialogs == 12:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "... die Luftfeuchtigkeit stimmt, die Temperatur richtig ist und der Boden feucht genug ist."
		short_node_rect.texture = PRESET3
		short_node_name.text = "Guido"
		$"../VoiceOver".stream = load(guido_path + "09.mp3")
		$"../VoiceOver".play()
		dialogs += 1
		same_speaker = false
	
	elif dialogs == 14:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Nun ja, der Luftdruck und die Lichtmenge werden immer noch komplett automatisch geregelt."
		short_node_rect.texture = PRESET3
		short_node_name.text = "Guido"
		$"../VoiceOver".stream = load(guido_path + "10.mp3")
		$"../VoiceOver".play()
		dialogs += 1
		same_speaker = true
		
	elif dialogs == 15:
		var short_node = get_child(2)
		var short_node_text = short_node.get_child(0)
		var short_node_rect = short_node.get_child(1)
		var short_node_name = short_node.get_child(3).get_child(0)
		short_node_text.text = "Genug rumgealbert. Die Pflanzen behandeln sich nicht von selbst."
		short_node_rect.texture = PRESET3
		short_node_name.text = "Guido"
		$"../VoiceOver".stream = load(guido_path + "11.mp3")
		$"../VoiceOver".play()
		dialogs +=1
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


