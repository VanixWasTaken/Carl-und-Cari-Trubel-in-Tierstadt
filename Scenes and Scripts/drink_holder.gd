extends AnimatedSprite2D

var water_in_1 = false
var water_in_2 = false
var water_in_3 = false
var pulver_in_1 = false
var pulver_in_2 = false
var pulver_in_3 = false
var area_name
var needed_color = "Purple"

func _on_area_2d_area_entered(area):
	area_name = area.get_name()
	if area_name.contains("WaterCup"):
		area.get_parent().play("new_animation")
		if water_in_1 == false && pulver_in_1 == false:
			$".".frame = 1
			water_in_1 = true
			$"../TextureRect".visible = true
			$"../TextureRect/DialogeText".text = "Sehr gut. Jetzt musst du 0.2 - 0.45 Gramm von dem lilanen Pulver in die Schale auf der Waage schütten."
		elif water_in_2 == false && pulver_in_1 == true:
			$".".frame = 3
			water_in_2 = true
			$"../TextureRect".visible = true
			$"../TextureRect/DialogeText".text = "Perfekt. Fülle jetzt 1.3 - 1.5 Gramm von dem roten Pulver in die Schale.."

		elif water_in_3 == false && pulver_in_2 == true:
			$".".frame = 5
			water_in_3 = true
			$"../TextureRect".visible = true
			$"../TextureRect/DialogeText".text = "Zu guter letzt musst du nur noch 1.5 - 2.0 Gramm von dem gelben Pulver in die Schale füllen."


	if area_name.contains("PulverBowl"):
		area.get_parent().play("new_animation")
		area.get_parent().bowl_full = false
		if area.get_parent().pulver_color != null && area.get_parent().pulver_color == needed_color && area.get_parent().enough == true:
			if water_in_1 == true && pulver_in_1 == false:
				$".".frame = 2
				pulver_in_1 = true
				remove_glass()
			elif water_in_2 == true && pulver_in_2 == false:
				$".".frame = 4
				pulver_in_2 = true
				remove_glass()
			elif water_in_3 == true && pulver_in_3 == false:
				$".".frame = 6
				pulver_in_3 = true

func remove_glass():
	if pulver_in_1:
		$Area2D.position.y += 100000
		$Area2D2.monitoring = true
		needed_color = "Red"
		$"../TextureRect".visible = true
		$"../TextureRect/DialogeText".text = "Gute Arbeit. Füge jetzt Wasser zum nächsten Reagenzglaz hinzu."

	if pulver_in_2:
		$Area2D2.position.y += 10000
		$Area2D3.monitoring = true
		needed_color = "Yellow"
		$"../TextureRect".visible = true
		$"../TextureRect/DialogeText".text = "Gut so. Füge nun Wasser in das letzte Reagenzglas hinzu."

	if pulver_in_3:
		$Area2D2.position.y += 10000
		needed_color = "NULL"
		$"../TextureRect".visible = true
		$"../TextureRect/DialogeText".text = "Perfekt. Jetzt haben wir alle Mixturen, die wir für die Visabel-Mischung brauchen! Lass uns zum nächsten Arbeitsschritt gehen."

func _on_area_2d_area_exited(area):
	if area_name.contains("WaterCup"):
		area.get_parent().play("default")
	if area_name.contains("PulverBowl"):
		$"../PulverBowl"._reset_bowl()
