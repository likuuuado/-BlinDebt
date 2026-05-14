extends Area2D

var player_in_range: bool = false

func _ready() -> void: # Conectar señales del Area2D al inciar la escena
	connect("area_entered", Callable(self, "_on_area_entered"))
	connect("area_exited", Callable(self, "_on_area_exited"))
	connect("input_event", Callable(self, "_on_input_event"))
	connect("mouse_entered", Callable(self, "_on_mouse_entered"))
	connect("mouse_exited", Callable(self, "_on_mouse_exited"))


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("item_detector"):
		player_in_range = true

func _on_area_exited(area: Area2D) -> void:
	if area.is_in_group("item_detector"):
		player_in_range = false
		Input.set_default_cursor_shape(Input.CURSOR_ARROW)


func _on_input_event(viewport, event, shape_idx) -> void:
	if player_in_range and event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		_on_collected()

# Cambia la apariencia del mouse cuando entra en el item
func _on_mouse_entered() -> void:
	if player_in_range:
		Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)

# Cuando sale del item vuelve a la apariencia "normal"
func _on_mouse_exited() -> void:
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)

# En esta función cada item decidira que hace al ser recolectado
func _on_collected() -> void:
	pass
