extends Node

var player: Player
var speedrun_component: Speedrun_Component
var saved_time: float = 0

func encode_score(time: float)->int:
	return int(time * 1000)

func decode_score(time: int)->float:
	return float(time) / 1000

func reset_score():
	saved_time = 0
