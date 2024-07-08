extends TextureRect

var selected_something : bool = false

signal block_input
signal release_input


func _on_star_pressed():
	$"../Stars".play()
	$Star/SelectedStar.show()
	$Star2/SelectedStar.hide()
	$Star3/SelectedStar.hide()
	$Star4/SelectedStar.hide()
	$Star5/SelectedStar.hide()
	selected_something = true
	Global.job_stars_dict["GardenJob"] = 1

func _on_star_2_pressed():
	$"../Stars".play()
	$Star/SelectedStar.show()
	$Star2/SelectedStar.show()
	$Star3/SelectedStar.hide()
	$Star4/SelectedStar.hide()
	$Star5/SelectedStar.hide()
	selected_something = true
	Global.job_stars_dict["GardenJob"] = 2

func _on_star_3_pressed():
	$"../Stars".play()
	$Star/SelectedStar.show()
	$Star2/SelectedStar.show()
	$Star3/SelectedStar.show()
	$Star4/SelectedStar.hide()
	$Star5/SelectedStar.hide()
	selected_something = true
	Global.job_stars_dict["GardenJob"] = 3

func _on_star_4_pressed():
	$"../Stars".play()
	$Star/SelectedStar.show()
	$Star2/SelectedStar.show()
	$Star3/SelectedStar.show()
	$Star4/SelectedStar.show()
	$Star5/SelectedStar.hide()
	selected_something = true
	Global.job_stars_dict["GardenJob"] = 4

func _on_star_5_pressed():
	$"../Stars".play()
	$Star/SelectedStar.show()
	$Star2/SelectedStar.show()
	$Star3/SelectedStar.show()
	$Star4/SelectedStar.show()
	$Star5/SelectedStar.show()
	selected_something = true
	Global.job_stars_dict["GardenJob"] = 5

func _on_weiter_button_pressed():
	$"../Click".play()
	if !selected_something:
		$Solutions/NoSolution.show()
		$"../VoiceOver".stream = load("res://Assets/Sound/VO/Map/Quiz/Laboratory/vo_npc_chameleon_quiz_no_answer_selected.mp3")
		$"../VoiceOver".play()
		emit_signal("block_input")
		await get_tree().create_timer(2).timeout
		$Solutions/NoSolution.hide()
		emit_signal("release_input")
	elif selected_something:
		$Solutions/RightSolution.show()
		$"../VoiceOver".stream = load("res://Assets/Sound/VO/Map/Quiz/Laboratory/vo_npc_chameleon_quiz_well_done.mp3")
		$"../VoiceOver".play()
		emit_signal("block_input")
		await get_tree().create_timer(2).timeout
		emit_signal("release_input")
		Global.moving_allowed = true
		Global.menu_open = false
		Global.cutscene_playing = false
		get_tree().get_first_node_in_group("Player").play_fade_out()
		queue_free()