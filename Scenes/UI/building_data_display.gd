extends Control
class_name BuildingDataDisplay

@export var building : GameData.BuildingsEnum
@onready var buy_button : Button = $"buy button"
@onready var amount_label : Label = $"amount"
@onready var name_label : Label = $"name"
@onready var cost_label : Label = $"cost"

func _ready() -> void:
	GameData.resource_changed.connect(UpdateDisplay)
	UpdateDisplay()

func UpdateDisplay():
	var data = GameData.buildings.get(building)
	name_label.text = data.building_name
	amount_label.text = str(data.amount)
	cost_label.text = str(data.next_cost)

func _on_buy_button_pressed() -> void:
	GameData.building_requested.emit(building)
