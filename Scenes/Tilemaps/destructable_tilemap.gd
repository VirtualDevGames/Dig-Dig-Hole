extends TileMapLayer

var curr_row : int = 0
var curr_column : int = 0

var space_between_tiles : int = 32

var array_of_tile_marble_bags : Array[TileMarbleBag]

@export var tilescene : PackedScene
@export var timer : Timer

func _ready() -> void:
	for i in 5:
		var new_tile_array : Array[TileBase]
		for k in 5:
			var new_tile = tilescene.instantiate() as TileBase
			add_child(new_tile)
			new_tile.position = Vector2(k * space_between_tiles, i * space_between_tiles)
			new_tile_array.append(new_tile)

		var new_marble_bag = TileMarbleBag.new(new_tile_array)
		array_of_tile_marble_bags.append(new_marble_bag)

func _on_timer_timeout() -> void:
	pass

func _process(_delta : float) -> void:
	if Input.is_action_just_pressed("Click"):
		var curr_tile = array_of_tile_marble_bags[0].Next()
		curr_tile.queue_free()

		if array_of_tile_marble_bags[0].IsEmpty():
			array_of_tile_marble_bags.remove_at(0)
