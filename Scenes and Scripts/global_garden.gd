extends Node


var should_enter_minigame1 = false #save
var talked_to_guido1 = false #wenn man reinkommt          #save
var talked_to_guido2 = false #1. mal freiwillig           #save
var talked_to_guido3 = false #nach dem 1. minispiel        #save
var talked_to_guido4 = false #nach dem 2. minispiel        #save
var talked_to_guido5 = false #nach dem 3_1. minispiel      #save
var talked_to_guido6 = false #nach dem 3_2. minispiel       #save

var last_finished_minigame = "NONE" # Possible variables: "NONE", "Minigame1", "Minigame2", "Minigame3", "Minigame4"               #save

#help button states
var garden_help_button_state = 0 #save
var garden_mini_help_button_state = 0 #save


# Minigame 3 variables
var plant_pots_placed = 0 #save
var stone_plates_placed = 0 #save
var flowers_placed = 0 #save
var bushs_placed = 0 #save
var current_stage = 1 #save
var stage2_correct_specs = 0 #save
