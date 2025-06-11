extends Control
class_name UI

@onready var gold_label : Label = $"gold value label" 

func _ready() -> void:
	GameData.resource_changed.connect(UpdateDisplay)

func _on_mine_button_pressed() -> void:
	GameData.gold += 1
	GameData.resource_changed.emit()

func UpdateDisplay():
	gold_label.text = str(GameData.gold)