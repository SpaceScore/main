extends Label

func _ready() -> void:
	Globals.updated_keys.connect(display_text)
	Globals.started_run.connect(display_text)

func display_text():
	text = "Keys: " + str(Globals.keys_collected)+" / 5"
