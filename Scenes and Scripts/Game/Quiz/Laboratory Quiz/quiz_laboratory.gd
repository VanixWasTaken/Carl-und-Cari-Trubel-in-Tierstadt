extends CanvasLayer

var area = "Garden"


### musste hier bisschen codemagie machen, wegen der modularität der quizzes
### falls ihr das quiz testet weil ihr dran rumbaut, einfach
### area = get_tree().get_current_scene().name auskommentieren und die area oben auf
### die entsprechende szene setzen (Garten = Garden, Labor = Laboratory)
func _ready():
	area = get_tree().get_current_scene().name ### findet raus wo wir grade sind
	Global.menu_open = true
	match area:
		"Laboratory":
			set_path("Laboratory", "chameleon") ### setzt den pfad um die passende stimme zu spielen, kann man erweitern
		"Garden":
			set_path("Garden Center", "gorilla") ### gleich wie oben

func _on_question_block_input():
	$InputBlock.show()
func _on_question_release_input():
	$InputBlock.hide()

func _play_hover_sounds_buttons():
	$Hover.play()

### funktion um den pfad zu setzen
func set_path(area: String, character: String):
	var children = self.get_children() ### holt sich die kinder vom quiz
	for i in 5: ### durchläuft die schleife 5 mal
		### gibt den questions (die ersten 5 kinder) in die path variable den pfad für den passenden npc mit
		children[i].path = "res://Assets/Sound/VO/" + area + "/Quiz/vo_npc_" + character + "_quiz_" 
