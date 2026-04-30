extends CharacterBody2D
#que sintaxis tan incomoda y poco visual

class_name Enemigos

var player 

@export var angulo: float = 60
@export var lenght: float
var direction = Vector2.UP

func _on_ready():
	player = get_tree().get_nodes_in_group(player)


func _draw():
	var limIzquierda = direction.rotated(-0.6) * lenght
	var limDerecha = direction.rotated(0.6) * lenght
	
	draw_line(Vector2.ZERO, limIzquierda, Color.RED, 2.5)
	draw_line(Vector2.ZERO, limDerecha, Color.RED, 2.5)
