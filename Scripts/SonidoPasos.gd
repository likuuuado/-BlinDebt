extends Node

var tileMaps: Array[TileMapLayer] = []

const sonidoPasos = {
	"pasos": [
		preload("uid://3g3tvs41s4tk")
	], 
	"corriendo": []
	} 
	

func GenerarSonido(position: Vector2):
	var tile_data = []
	for tileMap in tileMaps:
			var tile_position = tileMap.local_to_map(position)
			var data = tileMap.get_cell_tile_data(tile_position)
			if data:
				tile_data.push_back(data)
	
	if tile_data.size() > 0:
		var tile_type = tile_data.back().get_custom_data("SonidoPasos")
	
		if sonidoPasos.has(tile_type):
			var audioPlayer = AudioStreamPlayer2D.new()
			audioPlayer.stream = sonidoPasos[tile_type].pick_random()
			get_tree().root.add_child(audioPlayer)
			audioPlayer.global_position = position
			audioPlayer.play()
			await audioPlayer.finished
			audioPlayer.queue_free()
