extends "res://Scripts/ItemBase.gd"

func _on_collected() -> void:
	queue_free()
