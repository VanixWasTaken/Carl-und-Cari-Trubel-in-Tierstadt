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


# Called when the node enters the scene tree for the first time.
func _ready():
	$Humidity/Label.text = str(current_air_wetness)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Label.text = "Name: " + str(common_name) +"
	Familie: " +  str(family_name) +"
	Fakten: " +  str(fun_facts) +"
	Aktueller Status: 
	Bodenfeuchtigkeit: " +  str(current_ground_wetness) + " / " +  str(needed_ground_wetness) + "
	Luftdruck: " +  str(current_temperature) + " / " +  str(needed_temperature) + "
	Lebende Insekten: " + str(current_alive_insects) + " / 0
	Luftfeuchtigkeit: " +  str(current_air_wetness) + " / " +  str(needed_air_wetness)


func _on_plus_humidity_button_down():
	current_air_wetness += 1
	$Humidity/Label.text = str(current_air_wetness) + " %"

func _on_minus_humidity_button_down():
	current_air_wetness -= 1
	$Humidity/Label.text = str(current_air_wetness) + " %"
