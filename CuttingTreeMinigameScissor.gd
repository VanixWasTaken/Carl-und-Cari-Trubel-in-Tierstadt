extends Sprite2D

@onready var scissor = preload("res://Assets/Art/Environment/Rooms/Garden Center/CuttingTreeMinigame/scissors1.png")
@onready var scissor_cut = preload("res://Assets/Art/Environment/Rooms/Garden Center/CuttingTreeMinigame/scissors2.png")


func _input(event):
	if event.is_action_pressed("left_click"):
		scissor_cut
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#position = get_global_mouse_position()
