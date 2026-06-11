extends Control

@onready var Inventory: Control = $Inventory
@onready var money_label: Label = $MoneyLabel
@onready var KeyItemsContainer: GridContainer = $Inventory/KeyItemsContainer3


func _ready() -> void: # Conectar señales del Inventory
	Inventory.hide()
	Inventory.connect("money_update", Callable(self, "_on_money_update"))
	Inventory.connect("key_items_update", Callable(self, "_on_key_items_update"))

func _input(event):
	if Input.is_action_just_pressed("toggle_inventory"):
		if Inventory.visible:
			Inventory.hide()
		else:
			Inventory.show()

func _on_money_update(new_value: int) -> void:
	money_label.text = str(new_value)

func _on_key_items_update(new_items_icon: Array) -> void:
	# Recorremos la lista de texturas recibidas
	var slot_index := 0
	for texture_path in new_items_icon:
		var texture := load(texture_path)
		# Buscar el siguiente slot vacío
		while slot_index < KeyItemsContainer.get_child_count():
			var slot = KeyItemsContainer.get_child(slot_index)
			if slot is TextureRect and slot.texture == null:
				slot.texture = texture
				break
			slot_index += 1
