extends CharacterBody2D
#que sintaxis tan incomoda y poco visual

class_name Enemigos

var player 
var angleRads : float

@export var angulo: float = 60
@export var lenght: float = 400
@export var direction = Vector2.UP

func _ready():

	angleRads = deg_to_rad(angulo / 2)


func _draw():
	var limIzquierda = direction.rotated(-angleRads) * lenght
	var limDerecha = direction.rotated(angleRads) * lenght
	
	draw_line(Vector2.ZERO, limIzquierda, Color.RED, 2.0)
	draw_line(Vector2.ZERO, limDerecha, Color.GREEN, 2.0)

func Deteccion():
	var playerPos = to_local(player.global_position)
	var anguloPlayer = direction.angle_to(playerPos)
