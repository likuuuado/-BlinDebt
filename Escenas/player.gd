extends CharacterBody2D
class_name Jugador

var speed;

func _physics_process(delta: float) -> void:
	var direcciones = Input.get_vector("right", "left", "up", "down")
	velocity = direcciones * speed
	move_and_slide()
