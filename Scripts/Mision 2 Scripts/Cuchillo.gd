extends "res://Scripts/ItemBase.gd"

var zonaDescarte 

func _ready() -> void:
	super._ready()
	zonaDescarte = get_tree().get_first_node_in_group("DescarteEvidencia")



func _on_collected() -> void:
	zonaDescarte.tieneCuchillo = true
	queue_free()
