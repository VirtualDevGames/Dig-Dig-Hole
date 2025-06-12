extends TileMapLayer

##====================================================
# README:
#
#
#
##====================================================

class_name DestructableIsometricTilemap

@export var timer : Timer

var tile_marblebag : TileMarbleBag

func _ready() -> void:
	ResetTiles()

func EraseTile():
	if tile_marblebag.IsEmpty():
		ResetTiles()
		return

	var curr_tile = tile_marblebag.Next()
	set_cell(curr_tile, -1, Vector2.ZERO, 0)

func ResetTiles():
	for j in 10:
		for i in 10:
			set_cell(Vector2(i,j), 0, Vector2.ZERO, 0)

	tile_marblebag = TileMarbleBag.new(get_used_cells())
