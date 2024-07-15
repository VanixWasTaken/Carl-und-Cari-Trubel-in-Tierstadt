extends Node2D

var family_name = ""
var common_name = ""
var fact_1 = ""
var  fact_2 = ""
var fact_3 = ""
var fact_4 = ""
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

var play_air = true
var play_insects = true
var play_ground = true
var play_temperature = true

# Called when the node enters the scene tree for the first time.
func _ready():
	MusicController._play_music("peace_and_tranquility", "garden_center", -24)
	$Humidity/Label.text = str(current_air_wetness) + "%"
	$CanvasLayer/FadeAnimation.show()
	$CanvasLayer/AnimationPlayer.play("fade_in")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Label.text = "Name: " + str(common_name) +"
	Wissenschaftlicher Name: 
	" +  str(family_name) +"
	
	Fakten: " + "
	" + fact_1 + " 
	"+ fact_2 + " 
	"+ fact_3 + " 
	"+ fact_4 + "
	 
	Aktueller Status: 
	Bodenfeuchtigkeit: " +  str(current_ground_wetness) + "% / " +  str(needed_ground_wetness) + "%
	Temperatur: " +  str(current_temperature) + "°C / " +  str(needed_temperature) + "°C
	Lebende Insekten: " + str(current_alive_insects) + " / 0
	Luftfeuchtigkeit: " +  str(current_air_wetness) + "% / " +  str(needed_air_wetness) + "%"
	if current_air_wetness == needed_air_wetness && current_alive_insects == needed_alive_insects && current_ground_wetness == needed_ground_wetness && current_temperature == needed_temperature && !current_plant_done:
		next_plant_ready()
	elif current_air_wetness != needed_air_wetness || current_alive_insects != needed_alive_insects || current_ground_wetness != needed_ground_wetness || current_temperature != needed_temperature:
		if current_plant_done:
			messed_up_again()
	
	if current_air_wetness == needed_air_wetness and play_air:
		play_correct()
		play_air = false
	elif current_air_wetness != needed_air_wetness:
		play_air = true
	if current_alive_insects == needed_alive_insects and play_insects:
		play_correct()
		play_insects = false
	if current_ground_wetness == needed_ground_wetness and play_ground:
		play_correct()
		play_ground = false
	elif current_ground_wetness != needed_ground_wetness:
		play_ground = true
	if current_temperature == needed_temperature and play_temperature:
		play_correct()
		play_temperature = false
	elif current_temperature != needed_temperature:
		play_temperature = true

func next_plant_ready():
	play_finished()
	current_plant_done = true
	plants_done += 1
	$TextureButton.show()
	get_tree().get_first_node_in_group("Plants").frame = 1

func messed_up_again():
	current_plant_done = false
	plants_done -= 1
	$TextureButton.hide()
	get_tree().get_first_node_in_group("Plants").frame = 0
	
	

func _on_plus_humidity_button_down():
	current_air_wetness += 1
	$Humidity/Label.text = str(current_air_wetness) + " %"

func _on_minus_humidity_button_down():
	current_air_wetness -= 1
	$Humidity/Label.text = str(current_air_wetness) + " %"


func _on_40_area_entered(area):
	if area.get_name() == "Pointer":
		$Click.play()
		$Temperature/TemperatureRegulator.rotation_degrees = -80
		current_temperature = 30


func _on_35_area_entered(area):
	if area.get_name() == "Pointer":
		$Click.play()
		$Temperature/TemperatureRegulator.rotation_degrees = -55
		current_temperature = 28


func _on_30_area_entered(area):
	if area.get_name() == "Pointer":
		$Click.play()
		$Temperature/TemperatureRegulator.rotation_degrees =-35
		current_temperature = 26


func _on_25_area_entered(area):
	if area.get_name() == "Pointer":
		$Click.play()
		$Temperature/TemperatureRegulator.rotation_degrees = -10
		current_temperature = 24


func _on_20_area_entered(area):
	if area.get_name() == "Pointer":
		$Click.play()
		$Temperature/TemperatureRegulator.rotation_degrees = 10
		current_temperature = 22


func _on_15_area_entered(area):
	if area.get_name() == "Pointer":
		$Click.play()
		$Temperature/TemperatureRegulator.rotation_degrees = 35
		current_temperature = 20


func _on_10_area_entered(area):
	if area.get_name() == "Pointer":
		$Click.play()
		$Temperature/TemperatureRegulator.rotation_degrees = 55 
		current_temperature = 18


func _on_5_area_entered(area):
	if area.get_name() == "Pointer":
		$Click.play()
		$Temperature/TemperatureRegulator.rotation_degrees = 80
		current_temperature = 16



func _on_texture_button_button_up():
	if plants_done == 1:
		$Plant.queue_free()
		new_plant = plant_2.instantiate()
		get_tree().get_current_scene().add_child(new_plant)
		next_dialog = dialog_2.instantiate()
		get_tree().get_current_scene().add_child(next_dialog)
		$Humidity/Label.text = str(current_air_wetness) + " %"
	elif plants_done == 2:
		new_plant.queue_free()
		new_plant = plant_3.instantiate()
		get_tree().get_current_scene().add_child(new_plant)
		next_dialog = dialog_3.instantiate()
		get_tree().get_current_scene().add_child(next_dialog)
		$Humidity/Label.text = str(current_air_wetness) + " %"
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

func play_correct():
	var play_once = 1
	if play_once == 1:
		$Correct.play()
		play_once += 1

func play_finished():
	await get_tree().create_timer(0.5).timeout
	$Correct.play()
	await get_tree().create_timer(0.5).timeout
	$Correct.play()


func _on_plus_humidity_pressed():
	$AirWetnessBeep.play()

func _on_minus_humidity_pressed():
	$AirWetnessBeep.play()


func _on_plus_humidity_mouse_entered():
	$Temperature/Hover.play()

func _on_minus_humidity_mouse_entered():
	$Temperature/Hover.play()
