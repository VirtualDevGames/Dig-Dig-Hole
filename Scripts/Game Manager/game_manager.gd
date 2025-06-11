extends Node2D

##====================================================
# README:
#
#
#
##====================================================

class_name GameManager

func _ready() -> void:
	GameData.building_requested.connect(_on_building_requested)

func _on_building_requested(_building : GameData.BuildingsEnum):
	if GameData.gold < GameData.buildings.get(_building).next_cost:
		print("Not enough gold.")
		return

	GameData.gold -= GameData.buildings.get(_building).next_cost
	GameData.buildings.get(_building).amount += 1
	GameData.resource_changed.emit()

func GameTick():
	print("tick")
	for building in GameData.buildings.values():
		GameData.gold += building.cps
		GameData.resource_changed.emit()
