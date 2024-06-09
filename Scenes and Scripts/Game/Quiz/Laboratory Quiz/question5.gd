extends TextureRect

var selected_something : bool = false

signal block_input
signal release_input


func _on_star_pressed():
	$Star/SelectedStar.show()
	$Star2/SelectedStar.hide()
	$Star3/SelectedStar.hide()
	$Star4/SelectedStar.hide()
	$Star5/SelectedStar.hide()
	selected_something = true
	Global.chemist_job_stars = 1

func _on_star_2_pressed():
	$Star/SelectedStar.show()
	$Star2/SelectedStar.show()
	$Star3/SelectedStar.hide()
	$Star4/SelectedStar.hide()
	$Star5/SelectedStar.hide()
	selected_something = true
	Global.chemist_job_stars = 2

func _on_star_3_pressed():
	$Star/SelectedStar.show()
	$Star2/SelectedStar.show()
	$Star3/SelectedStar.show()
	$Star4/SelectedStar.hide()
	$Star5/SelectedStar.hide()
	selected_something = true
	Global.chemist_job_stars = 3

func _on_star_4_pressed():
	$Star/SelectedStar.show()
	$Star2/SelectedStar.show()
	$Star3/SelectedStar.show()
	$Star4/SelectedStar.show()
	$Star5/SelectedStar.hide()
	selected_something = true
	Global.chemist_job_stars = 4

func _on_star_5_pressed():
	$Star/SelectedStar.show()
	$Star2/SelectedStar.show()
	$Star3/SelectedStar.show()
	$Star4/SelectedStar.show()
	$Star5/SelectedStar.show()
	selected_something = true
	Global.chemist_job_stars = 5

func _on_weiter_button_pressed():
	if !selected_something:
		$Solutions/NoSolution.show()
		emit_signal("block_input")
		await get_tree().create_timer(2).timeout
		$Solutions/NoSolution.hide()
		emit_signal("release_input")
	elif selected_something:
		$Solutions/RightSolution.show()
		emit_signal("block_input")
		await get_tree().create_timer(2).timeout
		emit_signal("release_input")
		Global.moving_allowed = true
		Global.menu_open = false
		Global.cutscene_playing = false
		queue_free()
