extends AnimatedSprite2D

var family_name = ""
var common_name = ""
var fun_facts = ""
var current_air_wetness = 70
var current_ground_wetness = 28
var current_temperature = 17
var current_alive_insects = 6
var needed_air_wetness = "76 %"
var needed_ground_wetness = "39 %"
var needed_temperature = "20° C"
var water_on = false
# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().get_current_scene().current_ground_wetness = current_ground_wetness
	get_tree().get_current_scene().current_temperature = current_temperature
	get_tree().get_current_scene().current_air_wetness = current_air_wetness
	get_tree().get_current_scene().current_alive_insects = current_alive_insects
	get_tree().get_current_scene().needed_ground_wetness = needed_ground_wetness
	get_tree().get_current_scene().needed_temperature = needed_temperature
	get_tree().get_current_scene().needed_air_wetness = needed_air_wetness

func get_watered():
	await get_tree().create_timer(0.2).timeout
	if water_on:
		current_ground_wetness += 0.5
		get_tree().get_current_scene().current_ground_wetness = str(current_ground_wetness) + "%"
		get_watered()

func _on_watering_area_area_entered(area):
	if area.get_name() == "WaterArea":
		water_on = true
		get_watered()

func _on_watering_area_area_exited(area):
	if area.get_name() == "WaterArea":
		water_on = false
