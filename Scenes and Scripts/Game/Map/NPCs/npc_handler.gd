extends Node2D

@export var needed_animation = ""
var barbara
# Called when the node enters the scene tree for the first time.
func _ready():
	barbara = get_tree().get_first_node_in_group("Barbara")
	if GlobalBand.got_barbara && !GlobalBand.completed_quest:
		$BarbaraNPC.queue_free()
		$SamuelNPC.hide()
		$BarbaraAndSamuelNPC.show()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_npc_movement_animation_finished(anim_name):
	if anim_name.contains("BarbaraMarket"):
		barbara.get_parent().remove_child(barbara)
		add_child(barbara)
		Global.dialog_playing = false
		$BarbaraAndSamuelNPC.show()
		$SamuelNPC.hide()
		barbara.queue_free()
		

func show_barbara():
	barbara.show()
	if Global.completed_jobs.size() != 0:
		if Global.completed_jobs[0] == "Laboratory Building":
			GlobalBand.needed_animation = "BarbaraMarket1"
			barbara.global_position = $BarbaraMarkers/GardenMarker.global_position
		else:
			global_position = $BarbaraMarkers/LaboratoryMarker.global_position
			GlobalBand.needed_animation = "BarbaraMarket2"
			barbara.global_position = $BarbaraMarkers/LaboratoryMarker.global_position
