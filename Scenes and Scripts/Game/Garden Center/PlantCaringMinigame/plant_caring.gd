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
var hands_full = false
var current_plant_done = false
var plants_done = 0
var plant_2 = preload("res://Scenes and Scripts/Game/Garden Center/PlantCaringMinigame/plant_2.tscn")
var plant_3 = preload("res://Scenes and Scripts/Game/Garden Center/PlantCaringMinigame/plant_3.tscn")
var dialog_1= preload("res://Scenes and Scripts/Dialog/Garden Dialog/Minigame 2/garden_minigame_2_dialog_1.tscn")
var dialog_2 = preload("res://Scenes and Scripts/Dialog/Garden Dialog/Minigame 2/garden_minigame_2_dialog_2.tscn")
var dialog_3 = preload("res://Scenes and Scripts/Dialog/Garden Dialog/Minigame 2/garden_minigame_2_dialog_3.tscn")
var dialog_4 = preload("res://Scenes and Scripts/Dialog/Garden Dialog/Minigame 2/garden_minigame_2_dialog_4.tscn")
var garden_scene 
var finished_dialog = preload("res://Scenes and Scripts/Dialog/Garden Dialog/Minigame 2/garden_minigame_2_dialog_4.tscn")
var new_plant 
var next_dialog
# Called when the node enters the scene tree for the first time.
func _ready():
	$Humidity/Label.text = str(current_air_wetness) + "%"
	$CanvasLayer/FadeAnimation.show()
	$CanvasLayer/AnimationPlayer.play("fade_in")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Label.text = "Name: " + str(common_name) +"
	Familie: " +  str(family_name) +"
	Fakten: " +  str(fun_facts) +"
	Aktueller Status: 
	Bodenfeuchtigkeit: " +  str(current_ground_wetness) + "% / " +  str(needed_ground_wetness) + "%
	Temperatur: " +  str(current_temperature) + "°C / " +  str(needed_temperature) + "°C
	Lebende Insekten: " + str(current_alive_insects) + " / 0
	Luftfeuchtigkeit: " +  str(current_air_wetness) + "% / " +  str(needed_air_wetness) + "%"
	if current_air_wetness == needed_air_wetness && current_alive_insects == needed_alive_insects && current_ground_wetness == needed_ground_wetness && current_temperature == needed_temperature && !current_plant_done:
		current_plant_done = true
		plants_done += 1
		finish_plant()
		$TextureButton.show()
	


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

func finish_plant():
	current_plant_done = true
	get_tree().get_first_node_in_group("Plants").frame = 1
	$TextureButton.visible = true
	



func _on_texture_button_button_up():
	if plants_done == 1:
		$Plant.queue_free()
		new_plant = plant_2.instantiate()
		get_tree().get_current_scene().add_child(new_plant)
		next_dialog = dialog_2.instantiate()
		get_tree().get_current_scene().add_child(next_dialog)
	elif plants_done == 2:
		new_plant.queue_free()
		new_plant = plant_3.instantiate()
		get_tree().get_current_scene().add_child(new_plant)
		next_dialog = dialog_3.instantiate()
		get_tree().get_current_scene().add_child(next_dialog)
	elif plants_done == 3:
		var dialog_instance = finished_dialog.instantiate()
		next_dialog = dialog_4.instantiate()
		get_tree().get_current_scene().add_child(next_dialog)
	$TextureButton.hide()
	current_plant_done = false


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "fade_in":
		next_dialog = dialog_1.instantiate()
		get_tree().get_current_scene().add_child(next_dialog)
		garden_scene = load("res://Scenes and Scripts/Game/Garden Center/garden_center.tscn")
	
	if anim_name == "fade_out":
		GlobalGarden.last_finished_minigame = "CaringGame"
		get_tree().change_scene_to_packed(garden_scene)
