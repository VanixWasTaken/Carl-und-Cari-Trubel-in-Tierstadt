extends Node2D

@export var needed_animation = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	if GlobalBand.got_barbara && !GlobalBand.completed_quest:
		$NBarbaraNPC.queue_free()
		$SamuelNPC.hide()
		$BarbaraAndSamuelNPC.show()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_npc_movement_animation_finished(anim_name):
	if anim_name.contains("BarbaraMarket"):
		Global.dialog_playing = false
		$BarbaraAndSamuelNPC.show()
		$SamuelNPC.hide()
		$BarbaraNPC.queue_free()
		

func show_barbara():
	print("GUgel das mal")
	$BarbaraNPC.show()
	if Global.completed_jobs != null:
		if Global.completed_jobs[0] == "Laboratory Building":
			global_position = $BarbaraMarkers/GardenMarker.global_position
			GlobalBand.needed_animation == "BarbaraMarket1"
		else:
			global_position = $BarbaraMarkers/LaboratoryMarker.global_position
			GlobalBand.needed_animation = "BarbaraMarket2"
