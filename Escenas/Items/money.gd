extends "res://Scripts/ItemBase.gd"


@export var value: int

func _ready() -> void:
	super._ready()
	$AnimatedSprite2D.play("Idle Dinero")


func _on_collected() -> void:
		Inventory.add_money(value)
		queue_free()
