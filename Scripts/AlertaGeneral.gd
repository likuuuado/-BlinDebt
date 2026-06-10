extends Node

var nivelAlerta: float
@export var alertaMaxima: float = 50
var canvasPerder: CanvasLayer
var barra: ProgressBar

func _ready() -> void:
	
	nivelAlerta = 0
	canvasPerder = get_tree().get_first_node_in_group("CanvasDerrota")
	barra = get_tree().get_first_node_in_group("BarraAlerta")
	#canvasPerder.visible = false


func _process(delta: float):
	
	
	if nivelAlerta >= alertaMaxima:
		canvasPerder.visible = true
		
		get_tree().paused = true

func GestionarBarrra():
	barra.ActualizarBarra(alertaMaxima, nivelAlerta)
