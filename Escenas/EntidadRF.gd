extends CharacterBody2D


class_name EnemigoRF
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

const flecha_indicador = preload("res://Escenas/UI/flecha_pasos.tscn")
var flecha_jugador: Sprite2D = null
var pathFollow
var player

@export var linternaVision: PointLight2D

@export var color1: Color
@export var color2: Color

@export var tiempoDeteccion:  Timer

@export var canvasPerder: CanvasLayer

@export var tiempoAlerta: float
var angleRads : float
@export var angulo: float = 60
@export var lenght: float = 400
@export var speed: float

@export var direction = Vector2.UP
var pathPos: Vector2

var detectando: bool = false

var puntosAlerta: int

func _ready():
	add_to_group("enemigo")
	$AnimatedSprite2D.play("Entidad Walk")
	pathFollow = get_parent()
	pathPos = pathFollow.global_position 
	player = get_tree().get_first_node_in_group("player")
	angleRads = deg_to_rad(angulo / 2)
	tiempoAlerta = 1.5
	


func _physics_process(delta):
	if tiempoDeteccion.is_stopped():
		pathFollow.progress += speed * delta
		detectando = false
		tiempoDeteccion.stop()



func _process(delta):
	if Deteccion():
		tiempoDeteccion.wait_time = tiempoAlerta
		if tiempoDeteccion.is_stopped():
			tiempoDeteccion.start()
			audio_stream_player_2d.volume_db = -100
	else:
		tiempoDeteccion.wait_time = tiempoAlerta
		detectando = false
		audio_stream_player_2d.volume_db = 0
		tiempoDeteccion.stop()


func _on_timer_timeout():

	if $Sprite2D.modulate != Color.YELLOW && $Sprite2D.modulate != Color.RED:
		$Sprite2D.modulate = Color.YELLOW
		tiempoAlerta = 4
		puntosAlerta = 3
		AlertaGeneral.nivelAlerta += puntosAlerta
		print("Enemigo alerta")
		return
	elif $Sprite2D.modulate == Color.YELLOW && $Sprite2D.modulate != Color.RED:
		$Sprite2D.modulate = Color.RED
	print("Jugador detectado")
	puntosAlerta = 6 
	AlertaGeneral.nivelAlerta += puntosAlerta
	canvasPerder.visible = true
	get_tree().paused = true

func _draw():
	var limIzquierda = direction.rotated(-angleRads) * lenght
	var limDerecha = direction.rotated(angleRads) * lenght

	draw_line(Vector2.ZERO, limIzquierda, color1, 2.0)
	draw_line(Vector2.ZERO, limDerecha, color2, 2.0)

func Deteccion():
	detectando = true
	var playerPos = to_local(player.global_position)
	var anguloPlayer = direction.angle_to(playerPos)
	var distanciaPlayer = playerPos.length()
	if distanciaPlayer > lenght:
		return false

	if abs(anguloPlayer) <= angleRads:
		return true
	else:
		return false


func _on_area_sonido_body_entered(body: Node2D):
	if body is Player:
		flecha_jugador = flecha_indicador.instantiate() as Sprite2D
		flecha_jugador.enemigo_objetivo = self
		body.add_child(flecha_jugador)


func _on_area_sonido_body_exited(body: Node2D):
	if body is Player:
		if is_instance_valid(flecha_jugador):
			flecha_jugador.queue_free()
			flecha_jugador = null
	
