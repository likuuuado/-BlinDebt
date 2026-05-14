extends "res://Scripts/ItemBase.gd"

@export var value: int

func _on_collected() -> void:
	Inventory.add_money(value)
	queue_free()
