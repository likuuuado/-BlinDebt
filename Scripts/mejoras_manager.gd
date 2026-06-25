extends Node

var nivel_caminar: int = 0
var nivel_correr: int = 0
var nivel_deteccion: int = 0

const MAX_NIVEL: int = 3

var costos_caminar: Array = [40, 80, 160]
var costos_correr: Array = [60, 120, 220]
var costos_deteccion: Array = [70, 140, 250]


func get_speed_caminar() -> float:
	return 100.0 + (nivel_caminar * 25.0)

func get_speed_correr() -> float:
	return 200.0 + (nivel_correr * 50.0)

func get_modificador_deteccion() -> float:
	return 1.0 + (nivel_deteccion * 0.30)


func comprar_caminar() -> bool:
	if nivel_caminar < MAX_NIVEL and Inventory.money >= costos_caminar[nivel_caminar]:
		Inventory.money -= costos_caminar[nivel_caminar]
		Inventory.emit_signal("money_update", Inventory.money)
		nivel_caminar += 1
		return true
	return false


func comprar_correr() -> bool:
	if nivel_correr < MAX_NIVEL and Inventory.money >= costos_correr[nivel_correr]:
		Inventory.money -= costos_correr[nivel_correr]
		Inventory.emit_signal("money_update", Inventory.money)
		nivel_correr += 1
		return true
	return false


func comprar_deteccion() -> bool:
	if nivel_deteccion < MAX_NIVEL and Inventory.money >= costos_deteccion[nivel_deteccion]:
		Inventory.money -= costos_deteccion[nivel_deteccion]
		Inventory.emit_signal("money_update", Inventory.money)
		nivel_deteccion += 1
		return true
	return false
