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
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Label.text = "Name: " + common_name +"
	Familie: " + family_name +"
	Fakten: " + fun_facts +"
	Aktueller Status: 
	Bodenfeuchtigkeit: " + current_ground_wetness + " / " + needed_ground_wetness + "
	Luftdruck: " + current_temperature + " / " + needed_temperature + "
	Lebende Insekten: " + str(current_alive_insects) + " / 0
	Luftfeuchtigkeit: " + current_air_wetness + " / " + needed_air_wetness
