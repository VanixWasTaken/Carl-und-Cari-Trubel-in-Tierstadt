extends TextureRect

signal move_camera


var inside_trim1 = false
var trim1_should_fall = false
@onready var trim_1 = $Trims/Trim1
var inside_trim2 = false
var trim2_should_fall = false
@onready var trim_2 = $Trims/Trim2
var inside_trim3 = false
var trim3_should_fall = false
@onready var trim_3 = $Trims/Trim3
var inside_trim4 = false
var trim4_should_fall = false
@onready var trim_4 = $Trims/Trim4
var inside_trim5 = false
var trim5_should_fall = false
@onready var trim_5 = $Trims/Trim5
var inside_trim6 = false
var trim6_should_fall = false
@onready var trim_6 = $Trims/Trim6
var inside_trim7 = false
var trim7_should_fall = false
@onready var trim_7 = $Trims/Trim7

var cuts_done = 0



func _process(delta):
	trim1_fall()
	trim2_fall()
	trim3_fall()
	trim4_fall()
	trim5_fall()
	trim6_fall()
	trim7_fall()

	if cuts_done == 7:
		move_camera.emit()
		cuts_done += 1

func _input(event):
	if event.is_action_pressed("left_click") and inside_trim1:
		trim1_should_fall = true
		$Trims/Trim1/Trim1Area.queue_free()
		cuts_done += 1
	if event.is_action_pressed("left_click") and inside_trim2:
		trim2_should_fall = true
		$Trims/Trim2/Trim2Area.queue_free()
		cuts_done += 1
	if event.is_action_pressed("left_click") and inside_trim3:
		trim3_should_fall = true
		$Trims/Trim3/Trim3Area.queue_free()
		cuts_done += 1
	if event.is_action_pressed("left_click") and inside_trim4:
		trim4_should_fall = true
		$Trims/Trim4/Trim4Area.queue_free()
		cuts_done += 1
	if event.is_action_pressed("left_click") and inside_trim5:
		trim5_should_fall = true
		$Trims/Trim5/Trim5Area.queue_free()
		cuts_done += 1
	if event.is_action_pressed("left_click") and inside_trim6:
		trim6_should_fall = true
		$Trims/Trim6/Trim6Area.queue_free()
		cuts_done += 1
	if event.is_action_pressed("left_click") and inside_trim7:
		trim7_should_fall = true
		$Trims/Trim7/Trim7Area.queue_free()
		cuts_done += 1




func trim1_fall(): # spins the cut and lets it fall down before finally deleting it
	if trim1_should_fall:
		trim_1.position.y += 6
		trim_1.rotate(0.06)
		if trim_1.position.y >= 1200:
			trim_1.queue_free()
			trim1_should_fall = false # just for saving perfomance

func trim2_fall(): # spins the cut and lets it fall down before finally deleting it
	if trim2_should_fall:
		trim_2.position.y += 6
		trim_2.rotate(0.06)
		if trim_2.position.y >= 1200:
			trim_2.queue_free()
			trim2_should_fall = false # just for saving perfomance

func trim3_fall(): # spins the cut and lets it fall down before finally deleting it
	if trim3_should_fall:
		trim_3.position.y += 6
		trim_3.rotate(0.06)
		if trim_3.position.y >= 1200:
			trim_3.queue_free()
			trim3_should_fall = false # just for saving perfomance

func trim4_fall(): # spins the cut and lets it fall down before finally deleting it
	if trim4_should_fall:
		trim_4.position.y += 6
		trim_4.rotate(0.06)
		if trim_4.position.y >= 1200:
			trim_4.queue_free()
			trim4_should_fall = false # just for saving perfomance

func trim5_fall(): # spins the cut and lets it fall down before finally deleting it
	if trim5_should_fall:
		trim_5.position.y += 6
		trim_5.rotate(0.06)
		if trim_5.position.y >= 1200:
			trim_5.queue_free()
			trim5_should_fall = false # just for saving perfomance

func trim6_fall(): # spins the cut and lets it fall down before finally deleting it
	if trim6_should_fall:
		trim_6.position.y += 6
		trim_6.rotate(0.06)
		if trim_6.position.y >= 1200:
			trim_6.queue_free()
			trim6_should_fall = false # just for saving perfomance

func trim7_fall(): # spins the cut and lets it fall down before finally deleting it
	if trim7_should_fall:
		trim_7.position.y += 6
		trim_7.rotate(0.06)
		if trim_7.position.y >= 1200:
			trim_7.queue_free()
			trim7_should_fall = false # just for saving perfomance



func _on_trim_1_area_area_entered(area):
	inside_trim1 = true
func _on_trim_1_area_area_exited(area):
	inside_trim1 = false

func _on_trim_2_area_area_entered(area):
	inside_trim2 = true
func _on_trim_2_area_area_exited(area):
	inside_trim2 = false

func _on_trim_3_area_area_entered(area):
	inside_trim3 = true
func _on_trim_3_area_area_exited(area):
	inside_trim3 = false

func _on_trim_4_area_area_entered(area):
	inside_trim4 = true
func _on_trim_4_area_area_exited(area):
	inside_trim4 = false

func _on_trim_5_area_area_entered(area):
	inside_trim5 = true
func _on_trim_5_area_area_exited(area):
	inside_trim5 = false

func _on_trim_6_area_area_entered(area):
	inside_trim6 = true
func _on_trim_6_area_area_exited(area):
	inside_trim6 = false

func _on_trim_7_area_area_entered(area):
	inside_trim7 = true
func _on_trim_7_area_area_exited(area):
	inside_trim7 = false
