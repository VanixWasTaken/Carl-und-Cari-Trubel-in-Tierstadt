extends Node





func save():  # saves the current stats as a dictionary
	var save_dict : Dictionary = {
		
		"MovingAllowed" : Global.moving_allowed,
		"Character" : Global.character,
		"CompletedJobs" : Global.completed_jobs,
		"JobStarsDict" : Global.job_stars_dict,
		"LastScene" : Global.last_scene,
		"FirstGameStart" : Global.first_game_start,
		"MasterVolume" : Global.master_volume,
		"MusicVolume" : Global.music_volume,
		"SFXVolume" : Global.sfx_volume,
		"DialogVolume" : Global.dialog_volume,
		"MouseFull" : Global.mouse_full,
		"MouseInButton" : Global.mouse_in_button,
		"OpenTutorialDoor" : Global.open_tutorial_door,
		"DialogPlaying" : Global.dialog_playing,
		"LabCutscenePlayed" : Global.lab_cutscene_played,
		"CutscenePlaying" : Global.cutscene_playing,
		"TalkedToChris" : Global.talked_to_chris,
		"ShouldShoot" : Global.should_shoot,
		"MenuOpen" : Global.menu_open,
		"TutorialHelpButtonState" : Global.tutorial_help_button_state,
		"LaboratoryHelpButtonState" : Global.laboratory_help_button_state,
		"MiniHelpButtonState" : Global.mini_help_button_state,
		"ExitCoordinates" : Global.exit_coordinates,
		"StoryDialogTracker" : Global.story_dialog_tracker,
		"TalkedToChameleon1" : Global.talked_to_chameleon,
		"TalkedToChameleon2" : Global.talked_to_chameleon_2,
		"TalkedToChameleon3" : Global.talked_to_chameleon_4,
		"ReturnLaboratory1" : Global.return_laboratory_1,
		"ReturnLaboratory2" : Global.return_laboratory_2,
		"ReturnLaboratory3" : Global.return_laboratory_3,
		"InsideLaboratory" : Global.inside_laboratory,
		"PauseOpened" : Global.pause_opened,
		"GotBarbara" : GlobalBand.got_barbara,
		"GotSven" : GlobalBand.got_sven,
		"TalkedToSven1" : GlobalBand.talked_to_sven_1,
		"CompletedQuest" : GlobalBand.completed_quest,
		"NeededAnimation" : GlobalBand.needed_animation,
		"ShouldEnterMinigame1" : GlobalGarden.should_enter_minigame1,
		"TalkedToGuido1" : GlobalGarden.talked_to_guido1,
		"TalkedToGuido2" : GlobalGarden.talked_to_guido2,
		"TalkedToGuido3" : GlobalGarden.talked_to_guido3,
		"TalkedToGuido4" : GlobalGarden.talked_to_guido4,
		"TalkedToGuido5" : GlobalGarden.talked_to_guido5,
		"TalkedToGuido6" : GlobalGarden.talked_to_guido6,
		"LastFinishedMinigame" : GlobalGarden.last_finished_minigame,
		"GardenHelpButtonState" : GlobalGarden.garden_help_button_state,
		"GardenMiniHelpButtonState" : GlobalGarden.garden_mini_help_button_state,
		"PlantPotsPlaced" : GlobalGarden.plant_pots_placed,
		"StonePlatesPlaced" : GlobalGarden.stone_plates_placed,
		"FlowersPlaced" : GlobalGarden.flowers_placed,
		"BushsPlaced" : GlobalGarden.bushs_placed,
		"CurrentStage" : GlobalGarden.current_stage,
		"Stage2CorrectSpecs" : GlobalGarden.stage2_correct_specs,
		"ShowedHelpProfiles" : Global.showed_profile_help,
		"MarketReveals" : Global.showed_reveals
		
	}
	
	return save_dict




func save_game():
	var save_game = FileAccess.open("user://savegame.save", FileAccess.WRITE)
	
	var json_string = JSON.stringify(save())
	
	save_game.store_line(json_string)
	
	print("ich habe gespeichert")


func load_game():
	if not FileAccess.file_exists("user://savegame.save"):
		return
	
	var save_game = FileAccess.open("user://savegame.save", FileAccess.READ)
	while save_game.get_position() < save_game.get_length():
		var json_string = save_game.get_line()
		var json =  JSON.new()
		var parse_result = json.parse(json_string)
		var node_data = json.get_data()
		
		Global.moving_allowed = node_data["MovingAllowed"]
		Global.character = node_data["Character"]
		Global.completed_jobs = node_data["CompletedJobs"]
		Global.job_stars_dict = node_data["JobStarsDict"]
		Global.last_scene = node_data["LastScene"]
		Global.first_game_start = node_data["FirstGameStart"]
		Global.master_volume = node_data["MasterVolume"]
		Global.music_volume = node_data["MusicVolume"]
		Global.sfx_volume = node_data["SFXVolume"]
		Global.dialog_volume = node_data["DialogVolume"]
		Global.mouse_full = node_data["MouseFull"]
		Global.mouse_in_button = node_data["MouseInButton"]
		Global.open_tutorial_door = node_data["OpenTutorialDoor"]
		Global.dialog_playing = node_data["DialogPlaying"]
		Global.lab_cutscene_played = node_data["LabCutscenePlayed"]
		Global.cutscene_playing = node_data["CutscenePlaying"]
		Global.talked_to_chris = node_data["TalkedToChris"]
		Global.should_shoot = node_data["ShouldShoot"]
		Global.menu_open = node_data["MenuOpen"]
		Global.tutorial_help_button_state = node_data["TutorialHelpButtonState"]
		Global.laboratory_help_button_state = node_data["LaboratoryHelpButtonState"]
		Global.mini_help_button_state = node_data["MiniHelpButtonState"]
		Global.exit_coordinates = node_data["ExitCoordinates"]
		Global.story_dialog_tracker = node_data["StoryDialogTracker" ]
		Global.talked_to_chameleon = node_data["TalkedToChameleon1"]
		Global.talked_to_chameleon_2 = node_data["TalkedToChameleon2"]
		Global.talked_to_chameleon_4 = node_data["TalkedToChameleon3"]
		Global.return_laboratory_1 = node_data["ReturnLaboratory1"]
		Global.return_laboratory_2 = node_data["ReturnLaboratory2"]
		Global.return_laboratory_3 = node_data["ReturnLaboratory3"]
		Global.inside_laboratory = node_data["InsideLaboratory"]
		Global.pause_opened = node_data["PauseOpened"]
		GlobalBand.got_barbara = node_data["GotBarbara"]
		GlobalBand.got_sven = node_data["GotSven"]
		GlobalBand.talked_to_sven_1 = node_data["TalkedToSven1"]
		GlobalBand.completed_quest = node_data["CompletedQuest"]
		GlobalBand.needed_animation = node_data["NeededAnimation"]
		GlobalGarden.should_enter_minigame1 = node_data["ShouldEnterMinigame1"]
		GlobalGarden.talked_to_guido1 = node_data["TalkedToGuido1"]
		GlobalGarden.talked_to_guido2 = node_data["TalkedToGuido2"]
		GlobalGarden.talked_to_guido3 = node_data["TalkedToGuido3" ]
		GlobalGarden.talked_to_guido4 = node_data["TalkedToGuido4"]
		GlobalGarden.talked_to_guido5 = node_data["TalkedToGuido5"]
		GlobalGarden.talked_to_guido6 = node_data["TalkedToGuido6"]
		GlobalGarden.last_finished_minigame = node_data["LastFinishedMinigame"]
		GlobalGarden.garden_help_button_state = node_data["GardenHelpButtonState"]
		GlobalGarden.garden_mini_help_button_state = node_data["GardenMiniHelpButtonState"]
		GlobalGarden.plant_pots_placed = node_data["PlantPotsPlaced"]
		GlobalGarden.stone_plates_placed = node_data["StonePlatesPlaced"]
		GlobalGarden.flowers_placed = node_data["FlowersPlaced"]
		GlobalGarden.bushs_placed = node_data["BushsPlaced"]
		GlobalGarden.current_stage = node_data["CurrentStage" ]
		GlobalGarden.stage2_correct_specs = node_data["Stage2CorrectSpecs"]
		
		############# USED IN LOAD GAME TO HAVE THE VOLUME SET TO LAST SAVED VOLUME ###############
		_set_bus_volume(0, Global.master_volume)
		_set_bus_volume(1, Global.dialog_volume)
		_set_bus_volume(2, Global.sfx_volume)
		_set_bus_volume(3, Global.music_volume)


func clear_dict(): # Is used for overwriting the whole save game file on the computer to an empty dictionary. So it basically deletes the save 
	var clear_dict = FileAccess.open("user://savegame.save", FileAccess.WRITE)
	var empty_dict : Dictionary = {}
	var json_string = JSON.stringify(empty_dict)
	clear_dict.store_line(json_string)


func _set_bus_volume(bus_index: int, value: float): #### helper function to set the last saved volume
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))
	AudioServer.set_bus_mute(bus_index, value < 0.01)
