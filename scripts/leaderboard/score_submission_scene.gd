extends Node2D

@onready var leaderboard_component: Leaderboard_Component = $leaderboard_component
@onready var name_entry: LineEdit = $CanvasLayer/submit_form/name_entry
@onready var score_label: Label = $CanvasLayer/submit_form/score_label
@onready var submit_form: Control = $CanvasLayer/submit_form
@onready var loading_page: Control = $CanvasLayer/loading_page

var upload_status: int = 0

func _ready() -> void:
	## DEBUG TESTING
	#Globals.saved_time = 20.5
	
	## Code
	score_label.text = "Your Time: " + str(Globals.saved_time)

func goto_start_page():
	Globals.reset_score()
	get_tree().change_scene_to_file("res://scenes/start_scene.tscn")

func _on_submit_button_pressed() -> void:
	## Record name
	var name: String = name_entry.text
	if name == "" or name == null:
		return
	
	## Submit Score
	leaderboard_component.uploaded_name.connect(uploaded)
	leaderboard_component.uploaded_score.connect(uploaded)
	
	leaderboard_component._upload_score(Globals.encode_score(Globals.saved_time))
	leaderboard_component._change_player_name(name)
	
	print("UPLOADED TO SCOREBOARD")
	submit_form.visible = false
	loading_page.visible = true
	

func uploaded():
	if upload_status < 1:
		upload_status += 1
	else:
		goto_start_page()
