extends CharacterBody2D
class_name Jugador

var speed = 100;

func _physics_process(delta):
	var direcciones = Input.get_vector("right", "left", "up", "down")
	velocity = direcciones * speed
	move_and_slide()
