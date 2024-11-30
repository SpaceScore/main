extends Camera2D

@export var player_target: Player
@export var follow_speed: float = 2


func _process(delta: float) -> void:
	global_position = lerp(global_position, player_target.global_position, player_target.get_speed_ratio() * delta)
