extends Control

@onready var label_dinero: Label = $MarginContainer/VBoxContainer/HBoxContainer/Dinero
@onready var btn_caminar: Button = $MarginContainer/VBoxContainer/HBoxContainer2/CardCaminar/BtnComprar
@onready var btn_correr: Button = $MarginContainer/VBoxContainer/HBoxContainer2/CardCorrer/BtnComprar
@onready var btn_deteccion: Button = $MarginContainer/VBoxContainer/HBoxContainer2/CardDeteccion/BtnComprar

func _ready() -> void:
	actualizar_interfaz()

func actualizar_interfaz() -> void:
	label_dinero.text = "Dinero Disponible: $" + str(Inventory.money)
	
	var indicadores_caminar = $MarginContainer/VBoxContainer/HBoxContainer2/CardCaminar/HBoxContainer.get_children()
	for i in range(indicadores_caminar.size()):
		if i < MejorasManager.nivel_caminar:
			indicadores_caminar[i].color = Color.GREEN # Debería ponerse verde si se compra (feedback visual), pero no funka
		else:
			indicadores_caminar[i].color = Color.DARK_GRAY
	
	
	var indicadores_correr = $MarginContainer/VBoxContainer/HBoxContainer2/CardCorrer/HBoxContainer.get_children()
	for i in range(indicadores_correr.size()):
		if i < MejorasManager.nivel_correr:
			indicadores_correr[i].color = Color.GREEN
		else:
			indicadores_correr[i].color = Color.DARK_GRAY
	
	var indicadores_deteccion = $MarginContainer/VBoxContainer/HBoxContainer2/CardDeteccion/HBoxContainer.get_children()
	for i in range(indicadores_deteccion.size()):
		if i < MejorasManager.nivel_deteccion:
			indicadores_deteccion[i].color = Color.GREEN
		else:
			indicadores_deteccion[i].color = Color.DARK_GRAY
	
	if MejorasManager.nivel_caminar >= MejorasManager.MAX_NIVEL:
		btn_caminar.text = "Vel. Caminar: MAX"
		btn_caminar.disabled = true
	else:
		var costo = MejorasManager.costos_caminar[MejorasManager.nivel_caminar]
		btn_caminar.text = "Mejorar Caminar ($" + str(costo) + ")"
		btn_caminar.disabled = (Inventory.money < costo)
		
	if MejorasManager.nivel_correr >= MejorasManager.MAX_NIVEL:
		btn_correr.text = "Vel. Correr: MAX"
		btn_correr.disabled = true
	else:
		var costo = MejorasManager.costos_correr[MejorasManager.nivel_correr]
		btn_correr.text = "Mejorar Correr ($" + str(costo) + ")"
		btn_correr.disabled = (Inventory.money < costo)
		
	if MejorasManager.nivel_deteccion >= MejorasManager.MAX_NIVEL:
		btn_deteccion.text = "Tiempo de Reacción: MAX"
		btn_deteccion.disabled = true
	else:
		var costo = MejorasManager.costos_deteccion[MejorasManager.nivel_deteccion]
		btn_deteccion.text = "Retrasar Detección ($" + str(costo) + ")"
		btn_deteccion.disabled = (Inventory.money < costo)


func _on_btn_caminar_pressed() -> void:
	if MejorasManager.comprar_caminar():
		actualizar_interfaz()

func _on_btn_correr_pressed() -> void:
	if MejorasManager.comprar_correr():
		actualizar_interfaz()

func _on_btn_deteccion_pressed() -> void:
	if MejorasManager.comprar_deteccion():
		actualizar_interfaz()

func _on_btn_siguiente_nivel_pressed() -> void:
	#get_tree().change_scene_to_file("res://Escenas/mission_2.tscn")
	pass


#Estuve tanto tiempo tipeando esto que creo que me volví chango
