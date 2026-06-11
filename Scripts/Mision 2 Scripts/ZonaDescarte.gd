extends Area2D 

var tieneCuchillo :bool
var objetivoAsesinado: bool
var winCondition 


func _ready() -> void:
	tieneCuchillo = false
	objetivoAsesinado = false
	winCondition = get_tree().get_first_node_in_group("WinCondition")


func _input_event(_viewport, event, _shape_idx):

	if event is InputEventMouseButton:
		
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:

			if tieneCuchillo and objetivoAsesinado:

				winCondition.misionCompleta = true

				print("Condición de victoria activada")
