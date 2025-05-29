extends Node2D
class_name DestructableTilesManager

@export_category("Grid Values")
@export var grid_width  : int = 5
@export var grid_height : int = 5
var space_between_tiles : int = 32

var array_of_tile_marble_bags : Array[TileMarbleBag]
var starting_amount_of_arrays : int

@export_category("Helper Exports")
@export var tilescene : PackedScene
@export var timer : Timer
@export var arrow : AnimatedSprite2D

var valid_height : int = 0

func _ready() -> void:
	for i in grid_height:
		var new_tile_array : Array[TileBase]
		for k in grid_width:
			var new_tile = tilescene.instantiate() as TileBase
			add_child(new_tile)
			new_tile.position = Vector2(k * space_between_tiles, i * space_between_tiles)
			new_tile_array.append(new_tile)

		var new_marble_bag = TileMarbleBag.new(new_tile_array)
		new_marble_bag.EmptyBag.connect(RemoveBag)
		array_of_tile_marble_bags.append(new_marble_bag)
	starting_amount_of_arrays = array_of_tile_marble_bags.size()

func _on_timer_timeout() -> void:
	pass

func _process(_delta : float) -> void:
	valid_height = ((starting_amount_of_arrays - array_of_tile_marble_bags.size()) * 32) + 64
	arrow.position.y = valid_height

	if Input.is_action_just_pressed("A"):
		var curr_tile = array_of_tile_marble_bags[0].Next()
		curr_tile.queue_free()

		if array_of_tile_marble_bags[0].IsEmpty():
			array_of_tile_marble_bags.remove_at(0)

	elif Input.is_action_just_pressed("S"):
		for array in array_of_tile_marble_bags:
			for tile in array._current_bag:
				print(tile)
			print("---- end of bag -----")
		print("---- end of array ----")

func RemoveBag(_marble_bag : TileMarbleBag):
	array_of_tile_marble_bags.erase(_marble_bag)
