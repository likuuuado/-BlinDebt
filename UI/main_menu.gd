extends Control




func _on_b_jugar_button_down() -> void:
	get_tree().change_scene_to_file("res://Escenas/mission_1.tscn")


func _on_b_salir_button_down() -> void:
	get_tree().quit()
