extends CharacterBody2D
class_name Player

@onready var audioListener: AudioListener2D = $AudioListener2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

@onready var linterna = $Linterna
var posicionLinterna: Vector2
var speed = 100;

func _ready() -> void:
	linterna.enabled = true
	audioListener.make_current()

func _physics_process(delta):
	var direcciones = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direcciones * speed
	audio_stream_player_2d.play()


	posicionLinterna = get_global_mouse_position()
	linterna.look_at(posicionLinterna)
	
	move_and_slide()
