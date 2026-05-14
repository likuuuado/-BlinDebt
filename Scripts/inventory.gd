extends Node

var money: int = 0
var key_items: Array = []

# Señales para actualizar UI
signal money_update(new_value: int)
signal key_items_update(new_item: Array)

func add_money(value: int) -> void:
	money += value
	emit_signal("money_update", money)

# Agrega una id de key item
func add_key(key_item_id: String) -> void:
	if not key_items.has(key_item_id):
		key_items.append(key_item_id)
		emit_signal("key_items_update", key_items)
