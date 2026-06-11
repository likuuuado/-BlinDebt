extends Sprite2D

@onready var drag_button: Button = $Button
var dragging := false
var OFFSET := Vector2.ZERO

func _ready() -> void:
	# Conectar las señales del hijo button al padre
	drag_button.connect("button_down", Callable(self, "_on_button_down"))
	drag_button.connect("button_up", Callable(self, "_on_button_up"))

func _on_button_down() -> void:
	dragging = true
	offset = global_position - get_global_mouse_position()

func _on_button_up() -> void:
	dragging = false

func _process(delta: float) -> void:
	if dragging:
		global_position = get_global_mouse_position() + offset
