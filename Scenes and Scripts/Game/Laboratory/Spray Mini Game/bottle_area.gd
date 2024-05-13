extends Area2D

var selected = false
var inside_goal = false
@onready var animation_player = $"../Bottle/AnimationPlayer"
@onready var arrow = $"../Arrow"
@onready var mouse_hud = $"../MouseHUD"
@onready var goal_area = $"../GoalArea"



func _process(delta):
	if selected:
		follow_mouse()
	if !selected and !inside_goal:
		position = Vector2(1014, 804)
	if inside_goal and Input.is_action_just_released("left_click"):
		animation_player.play("new_animation")
		mouse_hud.queue_free()
		await get_tree().create_timer(2).timeout
		arrow.visible = true
		arrow.play("default")
		goal_area.queue_free()
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
