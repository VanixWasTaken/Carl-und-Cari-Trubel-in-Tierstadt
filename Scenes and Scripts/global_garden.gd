extends Node


var should_enter_minigame1 = false
var talked_to_guido1 = false #wenn man reinkommt
var talked_to_guido2 = false #1. mal freiwillig
var talked_to_guido3 = false #nach dem 1. minispiel
var talked_to_guido4 = false #nach dem 2. minispiel
var talked_to_guido5 = false #nach dem 3_1. minispiel
var talked_to_guido6 = false #nach dem 3_2. minispiel

var last_finished_minigame = "NONE" # Possible variables: "NONE", "Minigame1", "Minigame2", "Minigame3", "Minigame4"

#help button states
var garden_help_button_state = 0
var garden_mini_help_button_state = 0


# Minigame 3 variables
var plant_pots_placed = 0
var stone_plates_placed = 0
var flowers_placed = 0
var bushs_placed = 0
var current_stage = 1
var stage2_correct_specs = 0
