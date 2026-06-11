extends Sprite2D

var enemigo_objetivo: Node2D = null

func _ready():
	visible = false

func _process(_delta: float):
	if not is_instance_valid(enemigo_objetivo):
		queue_free()
		return
	
	var audio = enemigo_objetivo.audio_stream_player_2d
	
	if audio.playing and audio.volume_db > -80:
		visible = true
		look_at(enemigo_objetivo.global_position)
		rotation += deg_to_rad(90)
	else:
		visible = false
