extends Control

# volume sliders 
@onready var Master = $Ton/VBoxContainer/Label/Master
@onready var Dialog = $Ton/VBoxContainer/Label2/Dialog
@onready var SFX = $Ton/VBoxContainer/Label3/SFX
@onready var Music = $Ton/VBoxContainer/Label4/Music

var standards = {"Master":  0.7, "Dialog": 0.5, "SFX": 0.7, "Music": 0.7}
var names: Array

signal hover
signal click


func _ready():
	
	names = [Master, Dialog, SFX, Music]
	
	Master.value = Global.master_volume
	Music.value = Global.music_volume
	SFX.value = Global.sfx_volume
	Dialog.value = Global.dialog_volume
	_set_bus_volume(0, Global.master_volume)
	_set_bus_volume(1, Global.music_volume)
	_set_bus_volume(2, Global.sfx_volume)
	_set_bus_volume(3, Global.dialog_volume)


func _on_texture_button_button_up():
	$".".visible = false


func _on_texture_button_mouse_entered():
	emit_signal("hover")

func _on_texture_button_button_down():
	emit_signal("click")



#region volume changes
func _on_master_value_changed(value):
	Global.master_volume = Master.value
	_set_bus_volume(0, Global.master_volume)


func _on_dialog_value_changed(value):
	Global.dialog_volume = Dialog.value
	_set_bus_volume(1, Global.dialog_volume)


func _on_sfx_value_changed(value):
	Global.sfx_volume = SFX.value
	_set_bus_volume(2, Global.sfx_volume)


func _on_music_value_changed(value):
	Global.music_volume = Music.value
	_set_bus_volume(3, Global.music_volume)


func _reset_volume():
	for i in 4:
		var name = AudioServer.get_bus_name(i)
		_set_bus_volume(i, standards[name])
		names[i].value = standards[name]
#endregion


# volume helper function 
func _set_bus_volume(bus_index: int, value: float):
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))
	AudioServer.set_bus_mute(bus_index, value < 0.01)


func _button_hovered():
	$Hover.play()
