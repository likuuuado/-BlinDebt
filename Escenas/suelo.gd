extends TileMapLayer

func _ready() -> void:
	SonidoPasos.tileMaps.push_back(self)
