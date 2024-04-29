extends Control


@onready var l_bubble_node = preload("res://Scenes and Scripts/Dialog/speech_bubble_left.tscn")
@onready var r_bubble_node = preload("res://Scenes and Scripts/Dialog/speech_bubble_right.tscn")

var dialogs = 1
var dialog_side = ["left", "right"]
var finished = false

################################  PUT CHARACTER ICONS HERE  ###############################

var PRESET1 = preload("res://Assets/Test/UI/character_profile.png")
var PRESET2 = preload("res://Assets/Test/93eeyq563wo11.png")

##########################################################################################

func _ready():
	add_left_dialog_box()
	

func _process(delta):
################################  PUT DIALOG NUMBER HERE  ################################
	if dialogs == 6:
		queue_free()
##########################################################################################


func add_left_dialog_box():
	var node = l_bubble_node.instantiate()
	$".".add_child(node)
	dialog_side = "left"
##################################  WRITE DIALOG HERE  ###################################
	
	if dialogs == 1:
		$SpeechBubbleLeft/RichTextLabel.text = "Kennst du Kasper Freh?"
		$SpeechBubbleLeft/TextureRect.texture = PRESET1
		dialogs += 1
		
	if dialogs == 3:
		$SpeechBubbleLeft/RichTextLabel.text = "Wohl eher ... SmallSchlongJohnsen"
		$SpeechBubbleLeft/TextureRect.texture = PRESET1
		dialogs += 1
	
	if dialogs == 5:
		dialogs += 1
	
	
	
	
	
	
	
	
	
	
	
	
	
	
##########################################################################################
	

func add_right_dialog_box():
	var node = r_bubble_node.instantiate()
	$".".add_child(node)
	dialog_side = "right"
##################################  WRITE DIALOG HERE  ###################################
	
	if dialogs == 2:
		$SpeechBubbleRight/RichTextLabel.text = "meinst du LongSchlongJohnsen?"
		$SpeechBubbleRight/TextureRect.texture = PRESET2
		dialogs += 1
	
	if dialogs == 4:
		$SpeechBubbleRight/RichTextLabel.text = "HAHAHAHAHA LOL WAR DAS WITZIG"
		$SpeechBubbleRight/TextureRect.texture = PRESET2
		dialogs += 1
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
##########################################################################################
	









func _on_skip_button_pressed():
	$SkipButton.visible = false
	if $"."/SpeechBubbleLeft != null:
			$"."/SpeechBubbleLeft.queue_free()
	if $"."/SpeechBubbleRight != null:
			$"."/SpeechBubbleRight.queue_free()
	if dialog_side == "left" and !finished:
		add_right_dialog_box()
	elif dialog_side == "right" and !finished:
		add_left_dialog_box()
	await get_tree().create_timer(1).timeout
	$SkipButton.visible = true



func _on_skip_button_timer_timeout():
	$SkipButton.visible = true
