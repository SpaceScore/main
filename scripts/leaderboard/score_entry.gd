extends HBoxContainer
class_name Score_Entry

@onready var name_label: Label = $name_label
@onready var score_label: Label = $score_label

func set_data(name: String, score: String):
	name_label.text = name
	score_label.text = score + " seconds"
	
