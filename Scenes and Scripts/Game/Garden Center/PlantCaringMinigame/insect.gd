extends Node2D

signal deadge

var in_danger = false
@export var sprite_num : int
# Called when the node enters the scene tree for the first time.
func _ready():
	match sprite_num:
		0:
			$AnimatedSprite2D.play("insect_1")
			$AnimationPlayer.play("moving_" + str(randi_range(1, 4)))
		1:
			$AnimatedSprite2D.play("insect_2")
			$AnimationPlayer.play("moving_" + str(randi_range(1, 4)))
		2:
			$AnimatedSprite2D.play("insect_3")
			$AnimationPlayer.play("moving_" + str(randi_range(1, 4)))
		3:
			$AnimatedSprite2D.play("insect_4")
			$AnimationPlayer.play("moving_" + str(randi_range(1, 4)))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("right_click") && in_danger:
		emit_signal("deadge")
		get_tree().get_current_scene().current_alive_insects -= 1
		queue_free()




func _on_hit_box_area_entered(area):
	if area.get_name() == "SprayArea":
		in_danger = true


func _on_hit_box_area_exited(area):
	if area.get_name() == "SprayArea":
		in_danger = false
