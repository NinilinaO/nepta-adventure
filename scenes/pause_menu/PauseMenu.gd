extends Control

@onready var main = $"../../"

func _on_resume_pressed():
	main.pauseMenu()


func _on_quit_pressed():
	Engine.time_scale = 1
	get_tree().change_scene_to_file("res://scenes/menu/menu.tscn")
