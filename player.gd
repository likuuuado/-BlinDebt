extends CharacterBody2D
class_name Jugador

var speed: float = 150

func _physics_process(delta: float) -> void:
	var direcciones = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direcciones * speed
	move_and_slide()
