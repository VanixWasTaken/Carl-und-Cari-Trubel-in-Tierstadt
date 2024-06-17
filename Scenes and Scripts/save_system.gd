extends Node




func _input(event):   
	if event.is_action_pressed("right_click"):
		save_game()


func save():  # saves the current stats as a dictionary
	var save_dict : Dictionary = {
		
		"MovingAllowed" : Global.moving_allowed,
		"Character" : Global.character,
		"CompletedJobs" : Global.completed_jobs,
		"JobStarsDict" : Global.job_stars_dict
		
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



func clear_dict(): # Is used for overwriting the whole save game file on the computer to an empty dictionary. So it basically deletes the save 
	var clear_dict = FileAccess.open("user://savegame.save", FileAccess.WRITE)
	var empty_dict : Dictionary = {}
	var json_string = JSON.stringify(empty_dict)
	clear_dict.store_line(json_string)
