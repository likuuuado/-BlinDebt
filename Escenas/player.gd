extends CharacterBody2D
class_name Player

@onready var audioListener: AudioListener2D = $AudioListener2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var sprite_2d: Sprite2D = $Sprite2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

@onready var linterna = $Linterna
var posicionLinterna: Vector2
var speed = 100;
var ultimaDireccion

func _ready() -> void:
	linterna.enabled = true
	audioListener.make_current()

func _physics_process(delta):
	posicionLinterna = get_global_mouse_position()
	linterna.look_at(posicionLinterna)
	
	GenerarSonido()
	GetInput()
	move_and_slide()

func GetInput():
	var direcciones = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	Animar()
	
	
	if abs(direcciones.x) > abs(direcciones.y):
		if direcciones.x > 0:
			sprite_2d.rotation = 1.5
		elif direcciones.x < 0:
			sprite_2d.rotation = -1.5
	elif abs(direcciones.x) < abs(direcciones.y):
		if  direcciones.y > 0:
			sprite_2d.rotation = 3.1
		elif direcciones.y < 0:
			sprite_2d.rotation = 0
	
	
	velocity = direcciones * speed
	
	if direcciones == Vector2.ZERO:
		PararAnimacion()

func Animar():
	animation_player.play("PlayerWalk")
	audio_stream_player_2d.play()

func PararAnimacion():
	animation_player.stop()
	audio_stream_player_2d.stop()

func GenerarSonido(): #esto no sirvio pero la idea es hacerlo andar 
	SonidoPasos.GenerarSonido(global_position)
