extends MarbleBag
class_name TileMarbleBag

##====================================================
# README:
#	Extended from MarbleBag for better usage on tiles.
#
#
##====================================================

func _init(_contents: Array):
	super(_contents)
	Reset()

func Reset():
	_current_bag.clear()
	for item in full_bag:
		# (item as TileBase).IsDestroyed.connect(DestroyedTile)
		_current_bag.insert(randi_range(0, _current_bag.size()), item)

func Next():
	var result = _current_bag.get(0)
	_current_bag.remove_at(0)
	return result

func IsEmpty():
	return true if _current_bag.size() == 0 else false
