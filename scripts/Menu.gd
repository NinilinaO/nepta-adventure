extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	Nepta1.stop()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_play_pressed():
	Nepta1.play()
	get_tree().change_scene_to_file("res://scenes/scenes/scene_1.tscn")


func _on_exit_pressed():
	get_tree().quit()
