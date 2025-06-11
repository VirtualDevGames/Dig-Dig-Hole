extends Node
##====================================================
# README: 
#
#
#
##====================================================

signal resource_changed
signal building_requested(building : BuildingsEnum)

var house_building_resource : BuildingsResource = preload("res://Resources/Buildings/House_BuildingResource.tres")
var farm_building_resource : BuildingsResource = preload("res://Resources/Buildings/Farm_BuildingResource.tres")
var foundry_building_resource : BuildingsResource = preload("res://Resources/Buildings/Foundry_BuildingResource.tres")

var gold : int = 0

var buildings : Dictionary[BuildingsEnum, BuildingsResource] = {
	BuildingsEnum.House : house_building_resource,
	BuildingsEnum.Farm : farm_building_resource,
	BuildingsEnum.Foundry : foundry_building_resource,
}

enum BuildingsEnum {
	House,
	Farm,
	Foundry,
}

func _ready() -> void:
	for _building in buildings.values():
		_building.UpdateValues()