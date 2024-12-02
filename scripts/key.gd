extends Node2D
class_name Key

signal collected

func _ready() -> void:
	Globals.keys.append(self)

func _on_area_2d_body_entered(body: Node2D) -> void:
	collected.emit()
	queue_free()
