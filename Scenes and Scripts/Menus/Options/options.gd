extends Node2D

# volume sliders 
@onready var master = $Ton/VBoxContainer/Label/Master
@onready var dialog = $Ton/VBoxContainer/Label2/Dialog
@onready var sfx = $Ton/VBoxContainer/Label3/SFX
@onready var music = $Ton/VBoxContainer/Label4/Music



signal hover
signal click


func _ready():
	master.value = Global.master_volume
	music.value = Global.music_volume
	sfx.value = Global.sfx_volume
	dialog.value = Global.dialog_volume
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
	Global.master_volume = master.value
	_set_bus_volume(0, Global.master_volume)


func _on_dialog_value_changed(value):
	Global.dialog_volume = dialog.value
	_set_bus_volume(1, Global.dialog_volume)


func _on_sfx_value_changed(value):
	Global.sfx_volume = sfx.value
	_set_bus_volume(2, Global.sfx_volume)


func _on_music_value_changed(value):
	Global.music_volume = music.value
	_set_bus_volume(3, Global.music_volume)
#endregion


# volume helper function 
func _set_bus_volume(bus_index: int, value: float):
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))
	AudioServer.set_bus_mute(bus_index, value < 0.01)
