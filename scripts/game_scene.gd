extends Node2D

const MAX_KEYS: int = 5

@onready var speedrun_component: Speedrun_Component = $speedrun_component

var collected_keys: int = 0

func start_game():
	for key in Globals.keys:
		key.collected.connect(check_won)
	speedrun_component.start_run()

func check_won():
	collected_keys += 1
	Globals.keys_collected = collected_keys
	Globals.updated_keys.emit()
	if collected_keys == MAX_KEYS:
		## WON GAME
		print("WON GAME")
		speedrun_component.stop_run()
		get_tree().change_scene_to_file("res://scenes/leaderboard_submission.tscn")

func _on_detection_body_entered(body: Node2D) -> void:
	if body is Player:
		start_game()
		$detection.queue_free()
		Globals.started_run.emit()
