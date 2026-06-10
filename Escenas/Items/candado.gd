extends Area2D

@export var tipo: LlavesTipo.TipoLlave

const candado_amarillo = preload("res://assets/Items/Candado Amarillo.png")
const candado_rojo = preload("res://assets/Items/Candado Rojo.png")
const candado_azul = preload("res://assets/Items/Candado Azul.png")
const candado_verde = preload("res://assets/Items/Candado Verde.png")

var player_in_range: bool = false



func _ready():
	connect("area_entered", Callable(self, "_on_area_entered"))
	connect("area_exited", Callable(self, "_on_area_exited"))
	connect("input_event", Callable(self, "_on_input_event"))

	match tipo:
		LlavesTipo.TipoLlave.AMARILLA:
			$Sprite2D.texture = candado_amarillo
		
		LlavesTipo.TipoLlave.ROJA:
			$Sprite2D.texture = candado_rojo
		
		LlavesTipo.TipoLlave.AZUL:
			$Sprite2D.texture = candado_azul
		
		LlavesTipo.TipoLlave.VERDE:
			$Sprite2D.texture = candado_verde


func _try_open():
	var required_key := ""
		
	match tipo:
		LlavesTipo.TipoLlave.ROJA:
			required_key = "red_key"
		
		LlavesTipo.TipoLlave.AZUL:
			required_key = "blue_key"
		
		LlavesTipo.TipoLlave.VERDE:
			required_key = "green_key"
		
		LlavesTipo.TipoLlave.AMARILLA:
			required_key = "yellow_key"
		
	if Inventory.has_key_item(required_key):
		queue_free()


func _on_area_entered(area: Area2D):
	if area.is_in_group("item_detector"):
		player_in_range = true


func _on_area_exited(area: Area2D):
	if area.is_in_group("item_detector"):
		player_in_range = false


func _on_input_event(_viewport, event, _shape_idx):
	if player_in_range and event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			_try_open()
