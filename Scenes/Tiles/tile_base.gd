extends Node2D
class_name TileBase

var active : bool = true

@export var health : int = 1 :
	set(value):
		health = value
		if health <= 0:
			IsDestroyed.emit(self)
			queue_free()

signal IsDestroyed(TileBase)

func Damage(_value : int) -> void:
	health -= _value

#func IsDead():
#	return health > 0

func _on_area_2d_input_event(_viewport:Node, _event:InputEvent, _shape_idx:int) -> void:
	if(position.y >= (get_tree().get_nodes_in_group("Destructable Tiles Manager")[0] as DestructableTilesManager).valid_height):
		return
	if _event is InputEventMouseButton and _event.pressed:
		Damage(1)