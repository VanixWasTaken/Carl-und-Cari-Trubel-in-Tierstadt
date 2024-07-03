extends Node2D

var family_name = ""
var common_name = ""
var fun_facts = ""
var current_air_wetness 
var current_ground_wetness 
var current_temperature 
var current_alive_insects 
var needed_air_wetness 
var needed_ground_wetness 
var needed_temperature 
var needed_alive_insects = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$Humidity/Label.text = str(current_air_wetness) + "%"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Label.text = "Name: " + str(common_name) +"
	Familie: " +  str(family_name) +"
	Fakten: " +  str(fun_facts) +"
	Aktueller Status: 
	Bodenfeuchtigkeit: " +  str(current_ground_wetness) + "% / " +  str(needed_ground_wetness) + "%
	Luftdruck: " +  str(current_temperature) + "°C / " +  str(needed_temperature) + "°C
	Lebende Insekten: " + str(current_alive_insects) + " / 0
	Luftfeuchtigkeit: " +  str(current_air_wetness) + "% / " +  str(needed_air_wetness) + "%"
	
	if current_air_wetness == needed_air_wetness && current_alive_insects == needed_alive_insects && current_ground_wetness == needed_ground_wetness && current_temperature == needed_temperature:
		print("COOOOOOOOOOOOOOOOOOOOCK")
	
	if Input.is_action_just_pressed("space"):
		print(current_air_wetness)
		print(needed_air_wetness)
		print(current_alive_insects)
		print(needed_alive_insects)
		print(current_ground_wetness)
		print(needed_ground_wetness)
		print(current_temperature)
		print(needed_temperature)


func _on_plus_humidity_button_down():
	current_air_wetness += 1
	$Humidity/Label.text = str(current_air_wetness) + " %"

func _on_minus_humidity_button_down():
	current_air_wetness -= 1
	$Humidity/Label.text = str(current_air_wetness) + " %"


func _on_40_area_entered(area):
	if area.get_name() == "Pointer":
		$Temperature/TemperatureRegulator.rotation_degrees = -80
		current_temperature = 40


func _on_35_area_entered(area):
	if area.get_name() == "Pointer":
		$Temperature/TemperatureRegulator.rotation_degrees = -55
		current_temperature = 35


func _on_30_area_entered(area):
	if area.get_name() == "Pointer":
		$Temperature/TemperatureRegulator.rotation_degrees =-35
		current_temperature = 30


func _on_25_area_entered(area):
	if area.get_name() == "Pointer":
		$Temperature/TemperatureRegulator.rotation_degrees = -10
		current_temperature = 25


func _on_20_area_entered(area):
	if area.get_name() == "Pointer":
		$Temperature/TemperatureRegulator.rotation_degrees = 10
		current_temperature = 20


func _on_15_area_entered(area):
	if area.get_name() == "Pointer":
		$Temperature/TemperatureRegulator.rotation_degrees = 35
		current_temperature = 15


func _on_10_area_entered(area):
	if area.get_name() == "Pointer":
		$Temperature/TemperatureRegulator.rotation_degrees = 55 
		current_temperature = 10


func _on_5_area_entered(area):
	if area.get_name() == "Pointer":
		$Temperature/TemperatureRegulator.rotation_degrees = 80
		current_temperature = 5
