extends "res://Scripts/ItemBase.gd"

@export var key_item_id: String
@export var icon: Texture2D = preload("res://assets/key asset.png")
@export var tipo: LlavesTipo.TipoLlave


# CATALOGO DE LLAVES MEDIANTE COLORES
func _ready() -> void:
	super._ready()
	
	match tipo:
		LlavesTipo.TipoLlave.AMARILLA:
			$AnimatedSprite2D.play("Idle Llave Amarilla")
		
		LlavesTipo.TipoLlave.ROJA:
			$AnimatedSprite2D.play("Idle Llave Roja")
		
		LlavesTipo.TipoLlave.AZUL:
			$AnimatedSprite2D.play("Idle Llave Azul")
		
		LlavesTipo.TipoLlave.VERDE:
			$AnimatedSprite2D.play("Idle Llave Verde")

func _on_collected() -> void:
	Inventory.add_key_item(key_item_id, icon)
	queue_free()
