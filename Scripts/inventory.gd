extends Node

var money: int = 0
var key_items_id: Array = [] # Sirve para verificar si ese objeto esta en el inventario
var key_items_icon: Array = [] # Sirve para mandarle el icono a ui
var winCondition

# Señales para actualizar UI
signal money_update(new_value: int)
signal key_items_update(new_items_icon: Array)

func _ready() -> void:
	if winCondition == null:
		winCondition = get_tree().get_first_node_in_group("WinCondition")

func add_money(value: int) -> void:
	money += value
	emit_signal("money_update", money)
	

# Agrega una id de key item y su icono a los respectivos arrays
func add_key_item(key_item_id, icon) -> void:
	if not key_items_id.has(key_item_id):
		key_items_id.append(key_item_id)
	if not key_items_icon.has(icon):
		key_items_icon.append(icon)
		emit_signal("key_items_update", key_items_icon)

func has_key_item(key_item_id: String):
	return key_items_id.has(key_item_id)
