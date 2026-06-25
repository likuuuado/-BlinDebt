extends Control

@onready var inventario: Control = $Inventory
@onready var MoneyLabel: Label = $Gameplay/MoneyLabel
@onready var KeyItemsContainer: GridContainer = $Inventory/KeyItemsContainer3


func _ready() -> void: # Conectar señales del Inventory
	inventario.hide()
	Inventory.connect("money_update", Callable(self, "_on_money_update"))
	Inventory.connect("key_items_update", Callable(self, "_on_key_items_update"))
	
	# Acomodar cada texture rect para que sean del mismo tamaño
	for child in KeyItemsContainer.get_children():
		if child is TextureRect:
			child.expand = true
			child.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
			child.custom_minimum_size = Vector2(124, 124)

func _input(event):
	if Input.is_action_just_pressed("toggle_inventory"):
		if inventario.visible:
			inventario.hide()
		else:
			inventario.show()

func _on_money_update(new_value: int) -> void:
	MoneyLabel.text = str(new_value)

func _on_key_items_update(new_items_icon: Array) -> void:
	# Recorre la lista de texturas que le da inventory
	var slot_index := 0
	for icon in new_items_icon:
		var texture := load(icon)
		while slot_index < KeyItemsContainer.get_child_count(): # Buscar el siguiente slot vacío
			var slot = KeyItemsContainer.get_child(slot_index)
			if slot is TextureRect and slot.texture == null:
				slot.texture = texture
				break
			slot_index += 1
