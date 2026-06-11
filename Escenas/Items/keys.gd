extends "res://Scripts/ItemBase.gd"

@export var key_item_id: String
@export var icon : Texture2D = preload("res://assets/key asset.png")

func _on_collected() -> void:
	Inventory.add_key_item(key_item_id, icon)
	queue_free()
