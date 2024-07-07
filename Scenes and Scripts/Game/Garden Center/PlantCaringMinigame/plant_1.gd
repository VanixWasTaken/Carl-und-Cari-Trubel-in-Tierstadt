extends AnimatedSprite2D

@export var family_name : String
@export var common_name : String
@export var fact_1 : String
@export var fact_2 : String
@export var fact_3 : String
@export var fact_4 : String
@export var current_air_wetness :int
@export var current_ground_wetness :float
@export var current_temperature :int
@export var current_alive_insects :int
@export var needed_air_wetness :int
@export var needed_ground_wetness :float
@export var needed_temperature :int
var water_on = false
# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().get_current_scene().common_name = common_name
	get_tree().get_current_scene().family_name = family_name
	get_tree().get_current_scene().fact_1 = fact_1
	get_tree().get_current_scene().fact_2 = fact_2
	get_tree().get_current_scene().fact_3 = fact_3
	get_tree().get_current_scene().fact_4 = fact_4
	get_tree().get_current_scene().current_ground_wetness = current_ground_wetness
	get_tree().get_current_scene().current_temperature = current_temperature
	get_tree().get_current_scene().current_air_wetness = current_air_wetness
	get_tree().get_current_scene().current_alive_insects = current_alive_insects
	get_tree().get_current_scene().needed_ground_wetness = needed_ground_wetness
	get_tree().get_current_scene().needed_temperature = needed_temperature
	get_tree().get_current_scene().needed_air_wetness = needed_air_wetness
	set_humidity()

func get_watered():
	await get_tree().create_timer(0.3).timeout
	if water_on && needed_ground_wetness != current_ground_wetness:
		current_ground_wetness += 0.5
		get_tree().get_current_scene().current_ground_wetness = current_ground_wetness
		get_watered()

func _on_watering_area_area_entered(area):
	if area.get_name() == "WaterArea":
		water_on = true
		get_watered()

func _on_watering_area_area_exited(area):
	if area.get_name() == "WaterArea":
		water_on = false

func set_humidity():
	get_tree().get_first_node_in_group("HumidityText").text = str(current_air_wetness)


func _on_insect_deadge():
	$DeathSound.play()
