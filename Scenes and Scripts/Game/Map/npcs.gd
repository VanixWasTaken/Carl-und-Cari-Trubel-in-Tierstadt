extends Node2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GlobalBand.got_barbara:
		$BarbaraNPC.hide()
		$SamuelNPC.hide()


func _on_npc_movement_animation_finished(anim_name):
	if anim_name == "BarbaraMarket1":
		$SamuelNPC.hide()
		$BarbaraAndSamuelNPC.show()
		GlobalBand.got_barbara = true
