extends CharacterBody2D
#que sintaxis tan incomoda y poco visual

class_name Enemigos

var player
var angleRads : float
@export var color1: Color
@export var color2: Color
@export var tiempoDeteccion:  Timer
@export var tiempoAlerta: int
@export var canvasPerder: CanvasLayer

@export var angulo: float = 60
@export var lenght: float = 400
@export var direction = Vector2.UP

func _ready():
	player = get_tree().get_first_node_in_group("player")
	angleRads = deg_to_rad(angulo / 2)
	tiempoAlerta = 5


func _process(delta):
	if Deteccion():
		tiempoDeteccion.wait_time = tiempoAlerta
		if tiempoDeteccion.is_stopped():
			tiempoDeteccion.start()
	else:
		tiempoDeteccion.wait_time = tiempoAlerta
		tiempoDeteccion.stop()


func _on_timer_timeout():

	if $Sprite2D.modulate != Color.YELLOW && $Sprite2D.modulate != Color.RED:
		$Sprite2D.modulate = Color.YELLOW
		tiempoAlerta = 4
		print("Enemigo alerta")
		return
	elif $Sprite2D.modulate == Color.YELLOW && $Sprite2D.modulate != Color.RED:
		$Sprite2D.modulate = Color.RED
	print("Jugador detectado")
	canvasPerder.visible = true
	get_tree().paused = true

func _draw():
	var limIzquierda = direction.rotated(-angleRads) * lenght
	var limDerecha = direction.rotated(angleRads) * lenght

	draw_line(Vector2.ZERO, limIzquierda, color1, 2.0)
	draw_line(Vector2.ZERO, limDerecha, color2, 2.0)

func Deteccion():
	var playerPos = to_local(player.global_position)
	var anguloPlayer = direction.angle_to(playerPos)
	var distanciaPlayer = playerPos.length()
	if distanciaPlayer > lenght:
		return false

	if abs(anguloPlayer) <= angleRads:
		return true
	else:
		return false
