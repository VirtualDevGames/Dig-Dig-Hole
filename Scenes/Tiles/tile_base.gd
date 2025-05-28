extends Node2D
class_name TileBase

var active : bool = true

func Toggle() -> void:
	active = !active
	modulate = Color.WHITE if active else Color.RED