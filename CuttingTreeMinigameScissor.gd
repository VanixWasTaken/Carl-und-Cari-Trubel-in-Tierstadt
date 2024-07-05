extends Sprite2D

@onready var scissor_uncut = preload("res://Assets/Art/Environment/Rooms/Garden Center/Minigames/CuttingTreeMinigame/scissors1.png")
@onready var scissor_cut = preload("res://Assets/Art/Environment/Rooms/Garden Center/Minigames/CuttingTreeMinigame/scissors2.png")

@onready var scissor_spr = $"."



func _input(event):
	if !Global.dialog_playing && !Global.cutscene_playing:
		if event.is_action_pressed("left_click"):
			scissor_spr.texture = scissor_cut

		if event.is_action_released("left_click"):
			scissor_spr.texture = scissor_uncut
			$ScissorOpen.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = get_global_mouse_position()
	if Global.dialog_playing:
		self.hide()
	else:
		self.show()

