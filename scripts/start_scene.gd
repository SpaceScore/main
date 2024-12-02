extends Node2D

@onready var leaderboard_component: Leaderboard_Component = $leaderboard_component
@onready var vbox: VBoxContainer = $CanvasLayer/score_panel/ScrollContainer/VBoxContainer

var score_entry: PackedScene = preload("res://scenes/UI/score_entry.tscn")

func _ready() -> void:
	## Connect signal 
	leaderboard_component.loaded_leaderboards.connect(display_leaderboard)

func display_leaderboard(json):
	if json.get_data().items:
		for n in json.get_data().items.size():
			var name: String = str(json.get_data().items[n].player.name)
			var score: String = str(Globals.decode_score(int(json.get_data().items[n].score)))
			var new_entry: Score_Entry = score_entry.instantiate()
			vbox.add_child(new_entry)
			new_entry.set_data(name, score)
			


func _on_start_button_pressed() -> void:
	pass # Replace with function body.
