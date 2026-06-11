extends Area2D

@export var sprite_normal : Texture2D
@export var sprite_cortado : Texture2D
var zonaDescarte
@onready var sprite = $Sprite2D



func _ready() -> void:
	zonaDescarte = get_tree().get_first_node_in_group("DescarteEvidencia")

func _input_event(_viewport, event, _shape_idx):

	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:

			if zonaDescarte.tieneCuchillo and !zonaDescarte.objetivoAsesinado:



				sprite.texture = sprite_cortado

				zonaDescarte.objetivoAsesinado = true
