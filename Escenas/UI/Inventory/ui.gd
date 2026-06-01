extends Control

@onready var money_label: Label = $MoneyLabel
@onready var KeyItemsContainer: BoxContainer = $KeyItemsContainer


func _ready() -> void: # Conectar señales del Inventory
	Inventory.connect("money_update", Callable(self, "_on_money_update"))
	Inventory.connect("key_items_update", Callable(self, "_on_key_items_update"))

func _on_money_update(new_value: int) -> void:
	money_label.text = str(new_value)

func _on_key_items_update(new_items_icon: Array) -> void:
	# Limpiar el container antes de actualizar
	for child in KeyItemsContainer.get_children():
		child.queue_free()
		# Crear íconos para cada id recibido
		for icon in new_items_icon:
			var icon_texture = TextureRect.new()
			icon_texture.texture = load(icon)
			icon_texture.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
			KeyItemsContainer.add_child(icon_texture)
