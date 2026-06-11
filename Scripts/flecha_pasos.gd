extends Sprite2D

var enemigo_objetivo: Node2D = null
var dentro_rango: bool = false

func _ready():
	enemigo_objetivo = get_tree().get_first_node_in_group("enemigo") as Node2D

func _process(_delta: float):
	if not is_instance_valid(enemigo_objetivo):
		visible = false
		return
	
	var audio = enemigo_objetivo.audio_stream_player_2d
	
	if dentro_rango and audio.playing and audio.volume_db > -80:
		visible = true
		look_at(enemigo_objetivo.global_position)
		rotation += deg_to_rad(90)
	else:
		visible = false
