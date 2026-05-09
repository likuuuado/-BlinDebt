extends CharacterBody2D
class_name Player

var speed = 100;

func _physics_process(delta):
	var direcciones = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direcciones * speed
	move_and_slide()
