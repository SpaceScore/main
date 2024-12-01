extends Node
class_name Speedrun_Component

const TIME_FRAME: float = 0.01

@onready var timer: Timer = $Timer

var in_run: bool = false
var current_time: float = 0

func _ready() -> void:
	Globals.speedrun_component = self
	start_run()

func _process(delta: float) -> void:
	if timer.is_stopped() and in_run:
		timer.start(TIME_FRAME)

func start_run():
	in_run = true
	timer.start(TIME_FRAME)

func stop_run():
	in_run = false
	timer.stop()

func save_time():
	Globals.saved_time += current_time

func timeout() -> void:
	current_time += TIME_FRAME
