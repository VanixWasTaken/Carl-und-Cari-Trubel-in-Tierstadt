extends Area2D

var inside_goal = false
var selected = false
var spin_round = 0
@onready var swipe_area = $"."
@onready var goal_area_2 = $"../GoalArea2"
@onready var bottle = $"../Bottle"
@onready var screw_sound = $"../Bottle/Screwing"
@onready var spin_minigame = $".."
@onready var mouse_hud_2 = $"../MouseHUD2"
@onready var bottle_and_gun = $"../../BottleAndGun"
@onready var gun_in_hand = $"../../GunInHand"
@onready var shooting_area = $"../../GunInHand/ShootingArea"
@onready var area_2d = $"../../VisibleChameleon/Area2D"
@onready var animation_player = $"../Bottle/AnimationPlayer"


signal should_shoot
signal start_dialog4


func _process(delta):
	if $".".visible == true:
		mouse_hud_2.visible = true
		mouse_hud_2.get_child(0).play("new_animation")
	if selected:
		follow_mouse()
	if !selected and !inside_goal:
		position = Vector2(1506, 510)
	if inside_goal and Input.is_action_just_released("left_click"):
		bottle.play("default")
		screw_sound.play()
		if spin_round == 1:
			animation_player.play("swipe_in1")
			screw_sound.play()
		if spin_round == 2:
			animation_player.play("swipe_in2")
			screw_plus_docking_sound()
		if spin_round == 3:
			animation_player.play("swipe_in3")
			
		
		
	if spin_round >= 3:
		$"../../VisibleChameleon".should_play_dialog3 = true
		gun_in_hand.visible = true
		shooting_area.monitorable = true
		shooting_area.monitoring = true
		area_2d.monitorable = true
		area_2d.monitoring = true
		should_shoot.emit()
		start_dialog4.emit()
		bottle_and_gun.queue_free()
		spin_minigame.visible = false
		self.queue_free()
		spin_round += 1


func follow_mouse():
	position = get_global_mouse_position()

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			selected = true
		else:
			selected = false




func _on_goal_area_2_area_entered(area):
	inside_goal = true
func _on_goal_area_2_area_exited(area):
	inside_goal = false




func _on_bottle_animation_finished():
	spin_round += 1
	position = Vector2(1506, 510)

func screw_plus_docking_sound():
	screw_sound.play()
	await get_tree().create_timer(0.5).timeout
	screw_sound.stream = load("res://Assets/Sound/SFX/Foley/Laboratory/sfx_laboratory_foley_screwingpaint_var4.mp3")
	screw_sound.play()
