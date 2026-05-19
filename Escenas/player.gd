extends CharacterBody2D
class_name Player


@onready var linterna = $Linterna
var posicionLinterna: Vector2
var speed = 100;

func _ready() -> void:
	linterna.enabled = true

func _physics_process(delta):
	var direcciones = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direcciones * speed

	posicionLinterna = get_global_mouse_position()
	linterna.look_at(posicionLinterna)
	
	move_and_slide()
