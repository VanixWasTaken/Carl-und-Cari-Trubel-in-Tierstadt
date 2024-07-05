extends Node2D

signal deadge

var in_danger = false
@export var sprite_num : int
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.frame = sprite_num


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
