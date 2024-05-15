extends Area2D

var inside_goal = false
var selected = false
var should_play_anim = true
@onready var animation_player = $"../Bottle/AnimationPlayer"
@onready var arrow = $"../Arrow"
@onready var mouse_hud = $"../MouseHUD"
@onready var goal_area = $"../GoalArea"
@onready var swipe_area = $"../SwipeArea"
@onready var goal_area_2 = $"../GoalArea2"



func _process(delta):
	if selected:
		follow_mouse()
	if !selected and !inside_goal:
		position = Vector2(1014, 804)
	if inside_goal and Input.is_action_just_released("left_click"):
		if should_play_anim:
			print("testestets")
			animation_player.play("new_animation")
			should_play_anim = false
		mouse_hud.visible = false
		await get_tree().create_timer(2).timeout
		arrow.visible = true
		arrow.play("default")
		goal_area.queue_free()
		
		swipe_area.visible = true
		swipe_area.monitorable = true
		swipe_area.monitoring = true
		goal_area_2.visible = true
		goal_area_2.monitorable = true
		goal_area_2.monitoring = true
		
		$".".queue_free()


func follow_mouse():
	position = get_global_mouse_position()



func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			selected = true
		else:
			selected = false





func _on_goal_area_area_entered(area):
	inside_goal = true
func _on_goal_area_area_exited(area):
	inside_goal = false
