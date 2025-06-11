extends Node2D

##====================================================
# README:
#
#
#
##====================================================

class_name DwarfBase

func _on_area_2d_area_entered(area:Area2D) -> void:
	(area.get_parent() as TileBase).Damage(1)
	queue_free()
