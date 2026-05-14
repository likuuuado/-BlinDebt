extends CanvasLayer

@onready var menu = preload("res://UI/main_menu.tscn")


func _on_button_button_down():
	get_tree().change_scene_to_file("res://UI/main_menu.tscn")
