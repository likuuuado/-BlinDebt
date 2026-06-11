extends Area2D
var jugador
@export var canvasVictoria: CanvasLayer
var tieneLlave: bool
var cantidadDinero: int
@export var cantidadNecesaria: int

func _ready() -> void: # Conectar señales del Inventory
	jugador = get_tree().get_first_node_in_group("player")
	tieneLlave = false
	canvasVictoria.visible = false
	Inventory.connect("money_update", Callable(self, "SumarDinero"))
	Inventory.connect("key_items_update", Callable(self, "VerificarLlave"))


func VerificarLlave():
	tieneLlave = true

func SumarDinero(new_value: int):
	cantidadDinero += new_value
	print(cantidadDinero)



func _on_body_entered(body: Player):
	if cantidadDinero >= cantidadNecesaria:
		canvasVictoria.visible = true
