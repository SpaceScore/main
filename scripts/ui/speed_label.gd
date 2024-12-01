extends Label

const DELAY: float = 0.005

@onready var timer: Timer = $Timer

var display_speed: int = 0
var updating: bool = false

func _process(delta: float) -> void:
	if display_speed != Globals.player.get_display_speed() and timer.is_stopped():
		updating = true
		timer.start(DELAY)
	
	if updating:
		scale = lerp(scale, Vector2.ONE * 2, delta * 0.5)
	else:
		scale = lerp(scale, Vector2.ONE, delta)


func timeout() -> void:
	if display_speed < Globals.player.get_display_speed():
		display_speed += 10
	elif display_speed > Globals.player.get_display_speed():
		display_speed -= 10
	text = "Speed: " + str(display_speed)
	
	if display_speed == Globals.player.get_display_speed():
		updating = false
