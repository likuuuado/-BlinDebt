extends Node2D
var jugador
@export var canvasVictoria: CanvasLayer
var tieneLlave: bool
var cantidadDinero: int
@export var cantidadNecesaria: int

func _ready() -> void: # Conectar señales del Inventory
	Inventory.connect("money_update", Callable(self, "SumarDinero"))
	Inventory.connect("key_items_update", Callable(self, "VerificarLlave"))
	#canvasVictoria.visible = false

func VerificarLlave():
	tieneLlave = true

func SumarDinero(new_value: int):
	cantidadDinero += new_value



func _on_area_2d_body_entered(body: Player) -> void:
	if tieneLlave == true && cantidadDinero == cantidadNecesaria:
		canvasVictoria.visible 
