extends Node

var mouse_full = false
var moving_allowed = true
var character = ""
var open_tutorial_door = false
var dialog_playing = false
var lab_cutscene_played = false
var cutscene_playing = false
var talked_to_chris
var should_shoot = true

var tutorial_help_button_state = 0
var laboratory_help_button_state = 0
var mini1_help_button_state = 0

var talked_to_chameleon = false #Wird auf true gesetzt, wenn man mit dem chamäleon geredet hat auf freiwilliger basis
var talked_to_chameleon_2 = false #wird aufn true gesetzt, wenn mann nach dem 1. Minispiel mit dem chameleon geredet hat
var talked_to_chameleon_3 = false #wird aufn true gesetzt, wenn mann nach dem 2. Minispiel mit dem chameleon geredet hat
var talked_to_chameleon_4 = false #wird aufn true gesetzt, wenn mann nach dem 3. Minispiel mit dem chameleon geredet hat
var return_laboratory_1 = false #wird auf true gesetzt, wenn man aus dem ersten minispiel zurück kommt
var return_laboratory_2 = false #wird auf true gesetzt, wenn man aus dem 2 minigame kommt
var return_laboratory_3 = false #wird auf true gesetzt, wenn man aus dem 3 minigame kommt
