extends CanvasLayer

@export var Canvas: CanvasLayer


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("space"):
		Canvas.visible = false
