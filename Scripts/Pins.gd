extends Sprite2D

@onready var drag_button: Button = $Button
var dragging := false # Simplemente un bool
var OFFSET := Vector2.ZERO # Compensación

func _ready() -> void:
	# Conectar las señales del hijo button al padre
	drag_button.connect("button_down", Callable(self, "_on_button_down"))
	drag_button.connect("button_up", Callable(self, "_on_button_up"))

func _on_button_down() -> void: 
	dragging = true # Si toca el botón, se vuelve arrastrable
	offset = global_position - get_global_mouse_position()

func _on_button_up() -> void:
	dragging = false

func _process(delta: float) -> void:
	if dragging: # Si se arrastra sigue la posición del mouse hasta que se suelte
		global_position = get_global_mouse_position() + offset
