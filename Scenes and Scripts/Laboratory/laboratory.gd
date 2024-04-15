extends Node2D
var mouse_on = false
var name_text
var text_text
var chameleon_talking = true
var dialogue_position = 0
var outline_shader = preload("res://Shader/outline.tres")
var no_shader = preload("res://Shader/no_shader.tres")
# Called when the node enters the scene tree for the first time.
func _ready():
	MusicController._play_music("mayhem", "laboratory", -35)
	await get_tree().create_timer(0.1).timeout
	text_text = $Dialoguebox/Text
	name_text = $Dialoguebox/Name

	name_text.text = "Carl"
	text_text.text = "Hallo? Ist irgendjemand? Uns wurde gesagt, dass wir hier aushelfen sollen."


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if mouse_on and Input.is_action_just_pressed("left_click"):
		$Sprite2D/Click.play()
		get_tree().change_scene_to_file("res://Scenes and Scripts/Laboratory/chemical_laboratory.tscn")


func _on_labor_area_2d_mouse_entered():
	mouse_on = true
	$Sprite2D.material = outline_shader
	_randomize_sounds("click")


func _on_labor_area_2d_mouse_exited():
	mouse_on = false
	$Sprite2D.material = no_shader
	
func move_textbox(dialogue_position):
	if dialogue_position == 2 || dialogue_position == 4 || dialogue_position == 6|| dialogue_position == 7 || dialogue_position == 9:
		if dialogue_position != 7:
			$Dialoguebox.position.x -= 868
			$Dialoguebox/FaceSprite.frame = 2
			$Dialoguebox.frame = 1
			$Dialoguebox/TextureButton.position.x = 350
			name_text.text = "Chemie Chamäleon"
		if dialogue_position == 2:
			text_text.text = "H-H-Hallo, ich b-b-bin hier."
		elif dialogue_position == 4:
			text_text.text = "Ich stehe d-d-direkt vor dir."
		elif dialogue_position == 6:
			text_text.text = "Ich b-b-bin Christina das Chemie Chamäleon. I-i-ich habe mich ausversehen u-u-unsichtbar gemacht und k-k-kann mich nicht zurückverwandeln."
		elif dialogue_position == 7:
			text_text.text = "K-k-könnt ihr mir helfen meine V-V-Visabel Chemikalie zu mixen?"
		elif dialogue_position == 9:
			text_text.text = "Ihr m-m-müsst zuerst an d-d-dem Tisch dort drei Chemikalien mixen."
	else:
		if dialogue_position != 1:
			$Dialoguebox.position.x += 868
			$Dialoguebox.frame = 0
			$Dialoguebox/TextureButton.position.x = -470
		if dialogue_position == 1:
			$Dialoguebox/FaceSprite.frame = 0
			name_text.text = "Cari"
			text_text.text = "Vielleicht sollten wir später wiederkommen."
		elif dialogue_position == 3:
			$Dialoguebox/FaceSprite.frame = 1
			name_text.text = "Carl"
			text_text.text = "Wer hat das gesagt? Zeig dich!"
		elif dialogue_position == 5:
			$Dialoguebox/FaceSprite.frame = 0
			name_text.text = "Cari"
			text_text.text = "Wer bist du und warum können wir dich nicht sehen?"
		elif dialogue_position == 8:
			$Dialoguebox/FaceSprite.frame = 1
			name_text.text = "Carl"
			text_text.text = "Natürlich! Was sollen wir tun?"



func _on_texture_button_button_down():
	dialogue_position += 1
	if dialogue_position == 10:
		$Dialoguebox.visible = false
		await get_tree().create_timer(0.1).timeout
		$Sprite2D.visible = true
	move_textbox(dialogue_position)

func _randomize_sounds(action: String):
	var random = randi_range(1, 3) % 3
	if action == "click":
		match random:
			0:
				$Sprite2D/Click.stream = load("res://Assets/Sound Test/sfx_hub_ui_click_var1.mp3")
			1:
				$Sprite2D/Click.stream = load("res://Assets/Sound Test/sfx_hub_ui_click_var2.mp3")
			2:
				$Sprite2D/Click.stream = load("res://Assets/Sound Test/sfx_hub_ui_click_var3.mp3")
		$Sprite2D/Click.play()
