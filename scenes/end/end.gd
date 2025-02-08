extends Node2D

func _ready():
	Nepta1.stop()


func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/menu/menu.tscn")
	
