extends Label

func _process(delta: float) -> void:
	if Globals.speedrun_component.in_run:
		#stepify(8.56239, 0.01)
		text = "Time: " + str(snapped(Globals.speedrun_component.current_time, Globals.speedrun_component.TIME_FRAME))
